//
//  PThreadSpecificKey.swift
//  SwiftyPOSIX
//
//  Created by Braden Scothern on 2/18/18.
//  Copyright © 2018 Braden Scothern. All rights reserved.
//
// The MIT License (MIT)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//

/// The mechanism that allows access to thread specific storage that can be accessed with the `PThreadSpecificKey`.
///
/// Multiple threads may use the same `PThreadSpecificKey` to get and set an assoicated value on the Thread.
/// This value will always default to `nil` when a new `PThreadSpecificKey` or thread is created.
///
/// - Important: If the `Key` is destroyed then its `Destructor` will not execute.
///
/// - Note: `pthread_key_t`
public class PThreadSpecificKey<ValueType>: PThreadSpecificKeyDestructorRaiser {
    // MARK: - Types
    // MARK: Public

    /// The function type that can be associated with a `PThreadSpecificKey` to be called when a `PThread` exits if the value associated with the `Key` is not `nil`.
    ///
    /// Before the `Destructor` begins execution the thread local storage which contained `value` is set to `nil`.
    ///
    /// When a thread is exiting the execution order of all `Destructor`s associated with a `PThreadSpecificKey` is unspecified.
    ///
    /// It is safe to continue use of `PThreadSpecificKey.get()` and `PThreadSpecificKey.set(value:)` for any `PThreadSpecificKey`.
    /// If a new value is set for a `PThreadSpecificKey` after all `Destructor`s have executed on the thread, then the process of calling `Destructor`s is repeated.
    /// If after at least `PThread.destructorIterations` of `Destructor` calls for outstanding non-`nil` values, there are still some non-`nil` values associated with `Destructor`s it is up to the implementation of `PThread` to either:
    /// 1) Continue calling `Destructor`s, even if resulting in an infinite loop.
    /// 2) Simply end attempts to satisfy all `Destructor`s.
    ///
    /// - Parameter value: The value that was associated with the `PThreadSpecificKey` that `value` comes from.
    public typealias Destructor = (_ value: ValueType) -> Void

    // MARK: - Properties
    // MARK: Public Static

    /// The maximum number of `PthreadSpecificKey`s that can be created on the system.
    ///
    /// - Note: `PTHREAD_KEYS_MAX`
    public static var max: Int {
        return Int(PTHREAD_KEYS_MAX)
    }

    // MARK: Private

    /// The `pthread_key_t*` that is used for all `PThreadSpecific` functions.
    private var pointer = UnsafeMutablePointer<pthread_key_t>.allocate(capacity: 1)

    /// The destructor that should be raised for the `Key` when a thread exits.
    private var destructor: Destructor?

    /// The lock that protexts the contexts of the `Key`.
    private let contextsLock = PThreadMutex()

    /// The contexts that have been created for this `Key`.
    ///
    /// These are also stored with they key
    private var contexts: Set<UnsafeMutablePointer<PThreadSpecificKeyContext>> = []

    // MARK: - Init
    // MARK: Public

    /// Create a `Key` that allows access to `PThread` specific storage.
    ///
    /// - Note: `int pthread_key_create(pthread_key_t *key, void (*destructor)(void*))`
    /// - Note: `int pthread_key_delete(pthread_key_t)` is called in `deinit`
    ///
    /// - Important: This will only return `nil` if it sets Errno to one of these values:
    ///     1. Errno.EAGAIN - The system lacked the necessary resources to create another thread-specific data key, or the system-imposed limit on the total number of keys per process (PThreadSpecificKey.max) has been exceeded.
    ///     2. Errno.ENOMEM - Insufficient memory exists to create the key.
    ///
    /// - Parameter destructor: The `Destructor` that should be called when a `PThread` is exiting if the value associated with the key is non-`nil`.
    public init?(destructor: Destructor? = nil) {
        self.destructor = destructor
        let errorCode = pthread_key_create(pointer) { rawContext in
            #if os(Linux)
            let rawContext = rawContext!
            #endif
            let context = UnsafeMutablePointer<PThreadSpecificKeyContext>(OpaquePointer(rawContext))
            context.pointee.keyDestructorRaiser?.raiseDestruction(of: context)
        }

        if let error = Errno(rawValue: errorCode) {
            Errno.value = error
            return nil
        }
    }

    deinit {
        pthread_key_delete(pointer.pointee)
        pointer.deallocate()
        // Prevent memory leaks
        for context in contexts {
            context.deinitialize(count: 1).deallocate()
        }
    }

    // MARK: - Funcs
    // MARK: Public

    /// Get the thread specific value currently associated with the `Key`.
    ///
    /// - Note: `void *pthread_getspecific(pthread_key_t key)`
    ///
    /// - Returns: The value currently associated with the `Key`.
    public func get() -> ValueType? {
        guard let pointer = pthread_getspecific(self.pointer.pointee),
            let value = UnsafeMutablePointer<PThreadSpecificKeyContext>(OpaquePointer(pointer)).pointee.value
            else {
                return nil
        }
        return (value as! ValueType)
    }

    /// Sets a thread specific value with the `Key`.
    ///
    /// - Note: `int pthread_setspecific(pthread_key_t key, const void *value)`
    ///
    /// - Parameter value: The value to associate with the `Key`.
    public func set(value: ValueType?) {
        if let context = pthread_getspecific(self.pointer.pointee) {
            let context = UnsafeMutablePointer<PThreadSpecificKeyContext>(OpaquePointer(context))
            context.pointee.value = value
        } else {
            let context = UnsafeMutablePointer<PThreadSpecificKeyContext>.allocate(capacity: 1)
            context.initialize(to: PThreadSpecificKeyContext(value: value, keyDestructorRaiser: self))
            pthread_setspecific(self.pointer.pointee, UnsafeRawPointer(context))

            // This is used to prevent memory leaks.
            contextsLock.lock()
            contexts.insert(context)
            contextsLock.unlock()
        }
    }

    // MARK: - FilePrivate Protocol Conformance
    // MARK: PThreadSpecificKeyProtocol
    fileprivate func raiseDestruction(of context: UnsafeMutablePointer<PThreadSpecificKeyContext>) {
        if let value = context.pointee.value {
            destructor?(value as! ValueType)
        }

        contextsLock.lock()
        contexts.remove(context)
        contextsLock.unlock()

        context.deinitialize(count: 1).deallocate()
    }
}

// MARK: - Support Types
// MARK: Private

/// The type that is actually pointed to by a `PTHreadSpecificKey`.
///
/// Because the `PTHreadSpecificKey` keeps the type information, in order to properly cast it on gets or sets, we just keep `value` as type `Any?`.
private struct PThreadSpecificKeyContext {
    /// The value currently associated with a `PThreadSpecificKey` that created the context.
    ///
    /// Because the `PThreadSpecificKey` is the only thing that can get or set this, it knows how to safely cast it to the proper type.
    var value: Any?

    /// The object that can take a pointer to the `PThreadSpecificKeyContext` and raise the destructor that was associated with it.
    ///
    /// This should **always** be the `PThreadSpecificKey` that created the context so it can have the correct type information.
    private(set) weak var keyDestructorRaiser: PThreadSpecificKeyDestructorRaiser?

    /// Create a `PThreadSpecificKeyContext`.
    ///
    /// - Parameters:
    ///   - value: The initial value to store in the context.
    ///   - keyDestructorRaiser: The object that will raise the destructor of the context when a thread exits.
    ///     This should **always** be the `PThreadSpecificKey` that is calling this.
    init(value: Any?, keyDestructorRaiser: PThreadSpecificKeyDestructorRaiser) {
        self.value = value
        self.keyDestructorRaiser = keyDestructorRaiser
    }
}

/// The protocol that is used to safely type erase a `PThreadSpecificKey<T>` so it can convert a `PThreadSpecificKeyContext.value` back to the correct type and raise its destructor when a thread is exiting.
private protocol PThreadSpecificKeyDestructorRaiser: AnyObject {
    /// A function that can conver a `PThreadSpecificKeyContext.value` back to the correct type and raise the associated destructor as a thread is exiting.
    ///
    /// - Parameter context: A pointer to the `PThreadSpecificKeyContext` that is being destroyed as a thread is exiting.
    func raiseDestruction(of context: UnsafeMutablePointer<PThreadSpecificKeyContext>)
}

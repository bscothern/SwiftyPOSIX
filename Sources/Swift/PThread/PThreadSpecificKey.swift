//
//  PThreadSpecificKey.swift
//  SwiftyPOSIX
//
//  Created by Braden Scothern on 2/18/18.
//  Copyright © 2018-2020 Braden Scothern. All rights reserved.
//

/// The mechanism that allows access to thread specific storage that can be accessed with the `PThreadSpecificKey`.
///
/// Multiple threads may use the same `PThreadSpecificKey` to get and set an assoicated value on the Thread.
/// This value will always default to `nil` when a new `PThreadSpecificKey` or thread is created.
///
/// - Important: If the `Key` is destroyed then its `Destructor` will not execute.
///
/// - Note: `pthread_key_t`
public class PThreadSpecificKey<ValueType> {
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
    @inlinable public static var max: Int { Int(PTHREAD_KEYS_MAX) }

    // MARK: Internal

    /// The `pthread_key_t*` that is used for all `PThreadSpecific` functions.
    
    @usableFromInline internal var pointer = UnsafeMutablePointer<pthread_key_t>.allocate(capacity: 1)

    /// The destructor that should be raised for the `Key` when a thread exits.
    @usableFromInline internal var destructor: Destructor?

    /// The lock that protexts the contexts of the `Key`.
    @usableFromInline internal let contextsLock = PThreadMutex()

    /// The contexts that have been created for this `Key`.
    ///
    /// These are also stored with they key
    @usableFromInline internal var contexts: Set<UnsafeMutablePointer<PThreadSpecificKeyContext>> = []

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
    @inlinable
    public init?(destructor: Destructor? = nil) {
        self.destructor = destructor
        let errorCode = pthread_key_create(pointer) { rawContext in
            #if os(Linux)
            let rawContext = rawContext!
            #endif
            let context = rawContext.bindMemory(to: PThreadSpecificKeyContext.self, capacity: 1)
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
    @inlinable
    public func get() -> ValueType? {
        guard let pointer = pthread_getspecific(self.pointer.pointee),
            let value = pointer.bindMemory(to: PThreadSpecificKeyContext.self, capacity: 1).pointee.value
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
    @inlinable
    public func set(value: ValueType?) {
        if let context = pthread_getspecific(self.pointer.pointee) {
            let context = context.bindMemory(to: PThreadSpecificKeyContext.self, capacity: 1)
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
}

extension PThreadSpecificKey: PThreadSpecificKeyDestructorRaiser {
    // MARK: PThreadSpecificKeyProtocol
       @usableFromInline
       func raiseDestruction(of context: UnsafeMutablePointer<PThreadSpecificKeyContext>) {
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
// MARK: Internal

/// The type that is actually pointed to by a `PTHreadSpecificKey`.
///
/// Because the `PTHreadSpecificKey` keeps the type information, in order to properly cast it on gets or sets, we just keep `value` as type `Any?`.
@usableFromInline
struct PThreadSpecificKeyContext {
    /// The value currently associated with a `PThreadSpecificKey` that created the context.
    ///
    /// Because the `PThreadSpecificKey` is the only thing that can get or set this, it knows how to safely cast it to the proper type.
    @usableFromInline internal var value: Any?

    /// The object that can take a pointer to the `PThreadSpecificKeyContext` and raise the destructor that was associated with it.
    ///
    /// This should **always** be the `PThreadSpecificKey` that created the context so it can have the correct type information.
    @usableFromInline private(set) weak var keyDestructorRaiser: PThreadSpecificKeyDestructorRaiser?

    /// Create a `PThreadSpecificKeyContext`.
    ///
    /// - Parameters:
    ///   - value: The initial value to store in the context.
    ///   - keyDestructorRaiser: The object that will raise the destructor of the context when a thread exits.
    ///     This should **always** be the `PThreadSpecificKey` that is calling this.
    @usableFromInline
    init(value: Any?, keyDestructorRaiser: PThreadSpecificKeyDestructorRaiser) {
        self.value = value
        self.keyDestructorRaiser = keyDestructorRaiser
    }
}

/// The protocol that is used to safely type erase a `PThreadSpecificKey<T>` so it can convert a `PThreadSpecificKeyContext.value` back to the correct type and raise its destructor when a thread is exiting.
@usableFromInline
internal protocol PThreadSpecificKeyDestructorRaiser: AnyObject {
    /// A function that can conver a `PThreadSpecificKeyContext.value` back to the correct type and raise the associated destructor as a thread is exiting.
    ///
    /// - Parameter context: A pointer to the `PThreadSpecificKeyContext` that is being destroyed as a thread is exiting.
    func raiseDestruction(of context: UnsafeMutablePointer<PThreadSpecificKeyContext>)
}

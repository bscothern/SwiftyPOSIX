//
//  PThreadSpecific.swift
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

public enum PThreadSpecific {
    /// The mechanism that allows access to thread specific storage that can be accessed with the `Key`.
    ///
    /// Multiple threads may use the same `Key` to get and set an assoicated value on the Thread.
    /// This value will always default to `nil` when a new `Key` or thread is created.
    ///
    /// - Important: If the `Key` is destroyed then its `Destructor` will not execute.
    public class Key<ValueType>: PThreadSpecificKeyProtocol {
        //MARK:- Types
        //MARK: Public

        /// The function type that can be associated with a `Key` to be called when a `PThread` exits if the value associated with the `Key` is not `nil`.
        ///
        /// Before the `Destructor` begins execution the thread local storage which contained `value` is set to `nil`.
        ///
        /// When a thread is exiting the execution order of all `Destructor`s associated with a `Key` is unspecified.
        ///
        /// It is safe to continue use of `Key.get()` and `Key.set(value:)` for any `Key`.
        /// If a new value is set for a `Key` after all `Destructor`s have executed on the thread, then the process of calling `Destructor`s is repeated.
        /// If after at least `PThread.destructorIterations` of `Destructor` calls for outstanding non-`nil` values, there are still some non-`nil` values associated with `Destructor`s it is up to the implementation of `PThread` to either:
        /// 1) Continue calling `Destructor`s, even if resulting in an infinite loop.
        /// 2) Simply end attempts to satisfy all `Destructor`s.
        ///
        /// - Parameter value: The value that was associated with the `Key` that `value` comes from.
        public typealias Destructor = (_ value: ValueType) -> Void

        //MARK:- Properties
        //MARK: Public Static
        public static var max: Int {
            return Int(PTHREAD_KEYS_MAX)
        }

        //MARK: Private

        /// The pthread_key_t* that is used for all `PThreadSpecific` functions.
        private var pointer = UnsafeMutablePointer<pthread_key_t>.allocate(capacity: 1)

        /// The destructor that should be raised for the `Key` when a thread exits.
        private var destructor: Destructor?

        /// The lock that protexts the contexts of the `Key`.
        private let contextsLock = PThreadMutex()

        /// The contexts that have been created for this `Key`.
        ///
        /// These are also stored with they key
        private var contexts: Set<UnsafeMutablePointer<Context>> = []

        //MARK:- Init
        //MARK: Public

        /// Create a `Key` that allows access to `PThread` specific storage.
        ///
        /// - Note: `int pthread_key_create(pthread_key_t *key, void (*destructor)(void*))`
        ///
        /// - Parameter destructor: The `Destructor` that should be called when a `PThread` is exiting if the value associated with the key is non-`nil`.
        public init(destructor: Destructor? = nil) {
            self.destructor = destructor
            pthread_key_create(pointer) { context in
                let context = UnsafeMutablePointer<Context>(OpaquePointer(context))
                context.pointee.key?.raiseDestruction(of: context)
            }
        }

        deinit {
            pthread_key_delete(pointer.pointee)
            pointer.deallocate()
            for context in contexts {
                context.deinitialize(count: 1).deallocate()
            }
        }

        //MARK:- Funcs
        //MARK: Public

        /// Get the thread specific value currently associated with the `Key`.
        ///
        /// - Note: `void *pthread_getspecific(pthread_key_t key)`
        ///
        /// - Returns: The value currently associated with the `Key`.
        public func get() -> ValueType? {
            guard let pointer = pthread_getspecific(self.pointer.pointee),
                let value = UnsafeMutablePointer<Context>(OpaquePointer(pointer)).pointee.value
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
                let context = UnsafeMutablePointer<Context>(OpaquePointer(context))
                context.pointee.value = value
            } else {
                let context = UnsafeMutablePointer<Context>.allocate(capacity: 1)
                context.initialize(to: PThreadSpecific.Context(value: value, key: self))
                pthread_setspecific(self.pointer.pointee, UnsafeRawPointer(context))

                contextsLock.lock()
                contexts.insert(context)
                contextsLock.unlock()
            }
        }

        //MARK:- FilePrivate Protocol Conformance
        //MARK: PThreadSpecificKeyProtocol
        fileprivate func raiseDestruction(of context: UnsafeMutablePointer<PThreadSpecific.Context>) {

            if let value = context.pointee.value {
                destructor?(value as! ValueType)
            }

            contextsLock.lock()
            contexts.remove(context)
            contextsLock.unlock()

            context.deinitialize(count: 1).deallocate()
        }
    }

    //MARK: Private

    fileprivate struct Context {
        /// The value currently associated with a `Key`
        var value: Any?

        /// The key that needs to clean up its state about the context.
        weak var key: PThreadSpecificKeyProtocol?
    }
}

private protocol PThreadSpecificKeyProtocol: AnyObject {
    func raiseDestruction(of context: UnsafeMutablePointer<PThreadSpecific.Context>)
}

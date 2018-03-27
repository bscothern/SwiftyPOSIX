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

import Foundation

public struct PThreadSpecific {
    //MARK:- Types
    //MARK: Public
    public class Key<T> {
        //MARK:- Types
        public typealias Destructor = (_ value: T?) -> Void

        //MARK:- Properties
        public static var max: Int {
            return Int(PTHREAD_KEYS_MAX)
        }

        internal var pointer = UnsafeMutablePointer<pthread_key_t>.allocate(capacity: 1)
        private var destructor: Destructor?

        //MARK:- Init
        public init(destructor: Destructor? = nil) {
            pthread_key_create(pointer) { context in

            }
        }

        deinit {
            pthread_key_delete(pointer.pointee)
            pointer.deallocate(capacity: 1)
        }
    }

    //MARK: Private
    private struct Context<T> {
        var type: T.Type
        weak var key: Key<T>!
        var value: T?
    }

    //MARK:- Funcs
    public static func get<T>(_ key: Key<T>) -> T? {
        guard let pointer = pthread_getspecific(key.pointer.pointee) else {
                return nil
        }
        let context = UnsafeMutablePointer<Context<T>>(OpaquePointer(pointer))
        return context.pointee.value
    }

    public static func set<T>(_ key: Key<T>, value: T?) {
        var context: UnsafeMutablePointer<Context<T>>
        if let pointer = pthread_getspecific(key.pointer.pointee) {
            context = UnsafeMutablePointer<Context<T>>(OpaquePointer(pointer))
        } else {
            context = UnsafeMutablePointer<Context<T>>.allocate(capacity: 1)
            context.pointee.type = T.self
            context.pointee.key = key
        }
        context.pointee.value = value
        pthread_setspecific(context.pointee.key.pointer.pointee, UnsafeRawPointer(context))
    }
}

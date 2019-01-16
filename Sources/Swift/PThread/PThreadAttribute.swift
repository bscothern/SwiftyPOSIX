//
//  PThreadAttribute.swift
//  SwiftyPOSIX
//
//  Created by Braden Scothern on 2/9/18.
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

public class PThreadAttribute {
    //MARK:- Types
    public enum SchedulePolicy: PosixValueRepresentable {
        internal var posixValue: Int32 {
            switch self {
            case .firstInFirstOut:
                return Int32(SCHED_FIFO)
            case .roundRobin:
                return Int32(SCHED_RR)
            case .other:
                return Int32(SCHED_OTHER)
            }
        }

        case firstInFirstOut
        case roundRobin
        case other

        internal init?(posixValue: Int32) {
            switch posixValue {
            case Int32(SCHED_FIFO):
                self = .firstInFirstOut
            case Int32(SCHED_RR):
                self = .roundRobin
            case Int32(SCHED_OTHER):
                self = .other
            default:
                return nil
            }
        }
    }

    public enum Scope: PosixValueRepresentable {
        internal var posixValue: Int32 {
            switch self {
            case .system:
                return Int32(PTHREAD_SCOPE_SYSTEM)
            case .process:
                return Int32(PTHREAD_SCOPE_PROCESS)
            }
        }

        case system
        case process

        internal init?(posixValue: Int32) {
            switch posixValue {
            case Int32(PTHREAD_SCOPE_SYSTEM):
                self = .system
            case Int32(PTHREAD_SCOPE_PROCESS):
                self = .process
            default:
                return nil
            }
        }
    }

    //MARK:- Properties
    //MARK: Public Static

    /// The smallest supported stack size for a `PThread`.
    ///
    /// - Note: `PTHREAD_STACK_MIN`
    public static var stackSizeMinimum: Int {
        return Int(PTHREAD_STACK_MIN)
    }

    //MARK: Public

    /// The area of storage to be used for the created `PThread`'s stack.
    ///
    /// `baseAddress` will be the lowest addressable type of the storage and the `count` will be equal to the `stackSize`.
    ///
    /// - Important: When assigning to this property the `count` must be greater than or equal to `PThreadAttribute.stackSizeMinimum`.
    ///
    /// - Important: Can set Errno on set failures.
    ///
    /// Required Failures:
    ///
    ///    1. Errno.EINVAL - The value of stacksize is less than `PThreadAttribute.stackSizeMinimum` or exceeds an implementation-defined limit.
    ///
    /// Optional Failures:
    ///
    ///    1. Errno.EINVAL - The value of `baseAddress` does not have proper alignment to be used as a stack, or `UnsafeMutablePointer<CChar>(OpaquePointer(newValue.baseAddress)) + count` lacks proper alignment.
    ///
    ///    2. Errno.EACCES - The stack page(s) described by the `UnsafeMutableRawBufferPointer` are not both readable and writable by the thread.
    ///
    /// - Note: `int pthread_attr_getstack(const pthread_attr_t *restrict attr, void **restrict stackaddr, size_t *restrict stacksize)`
    /// - Note: `int pthread_attr_setstack(pthread_attr_t *attr, void *stackaddr, size_t stacksize)`
    public var stack: UnsafeMutableRawBufferPointer {
        get {
            var value: (pointer: UnsafeMutableRawPointer?, size: Int) = (nil, 0)
            pthread_attr_getstack(pointer, &value.pointer, &value.size)
            return UnsafeMutableRawBufferPointer(start: value.pointer, count: value.size)
        }
        set {
            guard newValue.baseAddress != nil else {
                return
            }
            let errorCode = pthread_attr_setstack(pointer, newValue.baseAddress!, newValue.count)

            if errorCode != 0 {
                Errno.value = Errno(rawValue: errorCode)
            }
        }
    }

    public var stackSize: Int {
        get {
            var value: Int = 0
            pthread_attr_getstacksize(pointer, &value)
            return value
        }
        set {
            pthread_attr_setstacksize(pointer, newValue)
        }
    }

    public var guardSize: Int {
        get {
            var value: Int = 0
            pthread_attr_getguardsize(pointer, &value)
            return value
        }
        set {
            pthread_attr_setguardsize(pointer, newValue)
        }
    }

    @available(*, unavailable, message: "This property is obsolete, non-portable, and unsafe. Instead PthreadAttribute.stack should be used. It has only been \"supported\" for clarity.")
    /// Used to specify the addres at which the stack of the newly created thread should be located.
    ///
    /// - Important: This doesn't provide a way to know specify if the address is at the top or bottom of the stack depending on how it grows.
    ///
    /// - Note: `int pthread_attr_getstackaddr(const pthread_attr_t *restrict attr, void **restrict stackaddr)`
    /// - Note: `int pthread_attr_setstackaddr(pthread_attr_t *attr, void *stackaddr)`
    public var stackAddress: UnsafeMutableRawPointer? {
        get {
            var value: UnsafeMutableRawPointer?
            pthread_attr_getstackaddr(pointer, &value)
            return value
        }
        set {
            var newValue = newValue
            if newValue == nil {
                newValue = UnsafeMutableRawPointer(bitPattern: 0)
            }
            pthread_attr_setstackaddr(pointer, newValue!)
        }
    }

    public var detatched: Bool {
        get {
            var value: Int32 = 0
            pthread_attr_getdetachstate(pointer, &value)
            return value == Int32(PTHREAD_CREATE_DETACHED)
        }
        set {
            pthread_attr_setdetachstate(pointer, newValue ? Int32(PTHREAD_CREATE_DETACHED) : Int32(PTHREAD_CREATE_JOINABLE))
        }
    }

    public var inheritSchedule: Bool {
        get {
            var value: Int32 = 0
            pthread_attr_getinheritsched(pointer, &value)
            return value == Int32(PTHREAD_INHERIT_SCHED)
        }
        set {
            pthread_attr_setinheritsched(pointer, newValue ? Int32(PTHREAD_INHERIT_SCHED): Int32(PTHREAD_EXPLICIT_SCHED))
        }
    }

    public var scheduleParameter: Int32 {
        get {
            var value = sched_param()
            pthread_attr_getschedparam(pointer, &value)
            return value.sched_priority
        }
        set {
            var scheduleParameterState = sched_param()
            memset(&scheduleParameterState, 0, MemoryLayout<sched_param>.size)
            scheduleParameterState.sched_priority = newValue
            pthread_attr_setschedparam(pointer, &scheduleParameterState)
        }
    }

    public var schedulePolicy: SchedulePolicy {
        get {
            var value: Int32 = 0
            pthread_attr_getschedpolicy(pointer, &value)
            return SchedulePolicy(posixValue: value)!
        }
        set {
            pthread_attr_setschedpolicy(pointer, newValue.posixValue)
        }
    }

    public var scope: Scope {
        get {
            var value: Int32 = 0
            pthread_attr_getscope(pointer, &value)
            return Scope(posixValue: value)!
        }
        set {
            pthread_attr_setscope(pointer, newValue.posixValue)
        }
    }

    internal var pointer = UnsafeMutablePointer<pthread_attr_t>.allocate(capacity: 1)

    //MARK:- Init
    public init?() {
        let errorCode = pthread_attr_init(pointer)

        if let error = Errno(rawValue: errorCode) {
            Errno.value = error
            return nil
        }
    }

    internal convenience init?(copy other: PThreadAttribute?) {
        guard let other = other else {
            return nil
        }
        self.init()
        self.stack = other.stack
        self.guardSize = other.guardSize
        self.detatched = other.detatched
        self.inheritSchedule = other.inheritSchedule
        self.scheduleParameter = other.scheduleParameter
        self.schedulePolicy = other.schedulePolicy
        self.scope = other.scope
    }

    deinit {
        pthread_attr_destroy(pointer)
        pointer.deallocate()
    }
}

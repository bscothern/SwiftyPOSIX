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

import Foundation

public class PThreadAttribute {
    //MARK:- Types
    public enum SchedulePolicy {
        internal var posixValue: Int32 {
            switch self {
            case .firstInFirstOut:
                return SCHED_FIFO
            case .roundRobin:
                return SCHED_RR
            case .other:
                return SCHED_OTHER
            }
        }

        case firstInFirstOut
        case roundRobin
        case other

        internal init?(posixValue: Int32) {
            switch posixValue {
            case SCHED_FIFO:
                self = .firstInFirstOut
            case SCHED_RR:
                self = .roundRobin
            case SCHED_OTHER:
                self = .other
            default:
                return nil
            }
        }
    }

    public enum Scope {
        internal var posixValue: Int32 {
            switch self {
            case .system:
                return PTHREAD_SCOPE_SYSTEM
            case .process:
                return PTHREAD_SCOPE_PROCESS
            }
        }

        case system
        case process

        internal init?(posixValue: Int32) {
            switch posixValue {
            case PTHREAD_SCOPE_SYSTEM:
                self = .system
            case PTHREAD_SCOPE_PROCESS:
                self = .process
            default:
                return nil
            }
        }
    }

    //MARK:- Properties
    public var stack: (pointer: UnsafeMutableRawPointer?, size: Int) {
        get {
            var value: (pointer: UnsafeMutableRawPointer?, size: Int) = (nil, 0)
            pthread_attr_getstack(pointer, &value.pointer, &value.size)
            return value
        }
        set {
            var newValue = newValue
            if newValue.pointer == nil {
                newValue.pointer = UnsafeMutableRawPointer(bitPattern: 0)
            }
            pthread_attr_setstack(pointer, newValue.pointer!, newValue.size)
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
            return value == PTHREAD_CREATE_DETACHED
        }
        set {
            pthread_attr_setdetachstate(pointer, newValue ? PTHREAD_CREATE_DETACHED : PTHREAD_CREATE_JOINABLE)
        }
    }

    public var inheritSchedule: Bool {
        get {
            var value: Int32 = 0
            pthread_attr_getinheritsched(pointer, &value)
            return value == PTHREAD_INHERIT_SCHED
        }
        set {
            pthread_attr_setinheritsched(pointer, newValue ? PTHREAD_INHERIT_SCHED: PTHREAD_EXPLICIT_SCHED)
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
    public init() {
        pthread_attr_init(pointer)
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
        pointer.deallocate(capacity: 1)
    }
}

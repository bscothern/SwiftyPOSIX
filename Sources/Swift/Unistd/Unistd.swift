//
//  Unistd.swift
//  SwiftyPOSIX
//
//  Created by Braden Scothern on 4/27/18.
//  Copyright © 2018 Braden Scothern. All rights reserved.
//

import Foundation

#if SWIFT_PACKAGE
import POSIX_C.Shims
#else
import SwiftyPOSIX.POSIX_C.Shims
#endif

/// ***Standard Symbolic Constants and Types***
///
/// Defines miscellaneous symbolic constants and types, and declares miscellaneous functions.
///
/// - Note: `<unistd.h>`
public enum Unistd {
    //MARK:- Types
    //MARK: Public
    
    /// Version Test Values
    public enum Version {
        //MARK:- Properties
        //MARK: Public Static

        /// Integer value indicating version of this standard (C-language binding) to which the implementation conforms.
        /// For implementations conforming to POSIX.1-2017, the value shall be `200809L`.
        ///
        /// - Note: `_POSIX_VERSION`
        public static var posix: Int {
            return Int(SP_POSIX_VERSION())
        }
        
        /// Profiles shall require the definition of the macro `_POSIX_SUBPROFILE` in `<unistd.h>` on implementations that do not meet all of the requirements of a POSIX.1-conforming implementation.
        ///
        /// If the current system fully supports the POSIX standard then this will be `nil`.
        ///
        /// - Note: `_POSIX_SUBPROFILE`
        public static var posixSubprofile: Int? {
            guard let posixSubprofilePointer = SP_POSIX_SUBPROFILE() else {
                return nil
            }
            return Int(posixSubprofilePointer.pointee)
        }

        /// Integer value indicating version of the Shell and Utilities volume of POSIX.1 to which the implementation conforms.
        /// For implementations conforming to POSIX.1-2017, the value shall be `200809L`.
        /// For profile implementations that define `_POSIX_SUBPROFILE` in `<unistd.h>`, posix2Version may be left undefined or be defined with the value `-1` to indicate that the Shell and Utilities volume of POSIX.1 is not supported.
        /// In this case, a call to `sysconf(_SC_2_VERSION)` shall return either `200809L` or `-1` indicating that the Shell and Utilities volume of POSIX.1 is or is not, respectively, supported at runtime.
        ///
        /// - Note: `_POSIX2_VERSION`
        public static var posix2: Int {
            return Int(SP_POSIX2_VERSION())
        }

        /// The `<unistd.h>` header shall define the following symbolic constant only if the implementation supports the XSI option; see XSI Conformance.
        ///
        /// An integer value indicating version of the X/Open Portability Guide to which the implementation conforms.
        /// If defined the value shall be `700`.
        ///
        /// - Note: `_XOPEN_VERSION`
        public static var xopen: Int? {
            guard let xopenPointer = SP_XOPEN_VERSION() else {
                return nil
            }
            return Int(xopenPointer.pointee)
        }
    }

    /// The following symbolic constants, if defined in `<unistd.h>`, shall have a value of `-1`, `0`, or greater, unless otherwise specified.
    ///
    /// For profile implementations that define `_POSIX_SUBPROFILE` in `<unistd.h>`, constants described below as always having a value greater than zero need not be defined and, if defined, may have a value of `-1`, `0`, or greater.
    ///
    /// If a symbolic constant is not defined or is defined with the value `-1`, the option is not supported for compilation.
    /// If it is defined with a value greater than zero, the option shall always be supported when the application is executed.
    /// If it is defined with the value zero, the option shall be supported for compilation and might or might not be supported at runtime.
    public enum Constants {
        
        /// The constants defined in `<unistd.h>` that are prepended with `_POSIX_` in C.
        public enum Posix {
            /// The implementation supports the Advisory Information option.
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            ///
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX_ADVISORY_INFO`
            public static var advisoryInfo: Int {
                return Int(SP_POSIX_ADVISORY_INFO())
            }

            /// The implementation supports asynchronous input and output.
            /// This symbol shall always be set to the value `200809L`.
            ///
            /// - Note: `_POSIX_ASYNCHRONOUS_IO`
            public static var asynchronousIO: Int {
                return Int(SP_POSIX_ASYNCHRONOUS_IO())
            }
            
            /// The implementation supports barriers.
            /// This symbol shall always be set to the value `200809L`.
            ///
            /// - Note: `_POSIX_BARRIERS`
            public static var barries: Int {
                return Int(SP_POSIX_BARRIERS())
            }

            /// The use of `chown()` and `fchown()` is restricted to a process with appropriate privileges, and to changing the group ID of a file only to the effective group ID of the process or to one of its supplementary group IDs.
            /// This symbol shall be defined with a value other than `-1`.
            ///
            /// - Note: `_POSIX_CHOWN_RESTRICTED`
            public static var chownRestricted: Int {
                return Int(SP_POSIX_CHOWN_RESTRICTED())
            }
            
            /// The implementation supports clock selection.
            /// This symbol shall always be set to the value `200809L`.
            ///
            /// - Note: `_POSIX_CLOCK_SELECTION`
            public static var clockSelection: Int {
                return Int(SP_POSIX_CLOCK_SELECTION())
            }
            
            /// The implementation supports the Process CPU-Time Clocks option.
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX_CPUTIME`
            public static var cpuTime: Int {
                return Int(SP_POSIX_CPUTIME())
            }
            
            /// The implementation supports the File Synchronization option.
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX_FSYNC`
            public static var fSync: Int {
                return Int(SP_POSIX_FSYNC())
            }
            
            /// The implementation supports the IPv6 option.
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX_IPV6`
            public static var ipv6: Int {
                return Int(SP_POSIX_IPV6())
            }
            
            /// The implementation supports job control.
            /// This symbol shall always be set to a value greater than zero.
            ///
            /// - Note: `_POSIX_JOB_CONTROL`
            public static var jobControl: Int {
                return Int(SP_POSIX_JOB_CONTROL())
            }
            
            /// The implementation supports memory mapped Files.
            /// This symbol shall always be set to the value `200809L`.
            ///
            /// - Note: `_POSIX_MAPPED_FILES`
            public static var mappedFiles: Int {
                return Int(SP_POSIX_MAPPED_FILES())
            }
            
            /// The implementation supports the Process Memory Locking option.
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX_MEMLOCK`
            public static var memlock: Int {
                return Int(SP_POSIX_MEMLOCK())
            }
            
            /// The implementation supports the Range Memory Locking option.
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX_MEMLOCK_RANGE`
            public static var memlockRange: Int {
                return Int(SP_POSIX_MEMLOCK_RANGE())
            }
            
            /// The implementation supports memory protection.
            /// This symbol shall always be set to the value 200809L.
            ///
            /// - Note: `_POSIX_MEMORY_PROTECTION`
            public static var memoryProtection: Int {
                return Int(SP_POSIX_MEMORY_PROTECTION())
            }
            
            /// The implementation supports the Message Passing option.
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX_MESSAGE_PASSING`
            public static var messagePassing: Int {
                return Int(SP_POSIX_MESSAGE_PASSING())
            }
            
            /// The implementation supports the Monotonic Clock option.
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX_MONOTONIC_CLOCK`
            public static var monotonicClock: Int {
                return Int(SP_POSIX_MONOTONIC_CLOCK())
            }
            
            /// Pathname components longer than `NAME_MAX` generate an error.
            /// This symbol shall be defined with a value other than `-1`.
            ///
            /// - Note: `_POSIX_NO_TRUNC`
            public static var noTrunc: Int {
                return Int(SP_POSIX_NO_TRUNC())
            }
            
            /// The implementation supports the Prioritized Input and Output option.
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX_PRIORITIZED_IO`
            public static var prioritizedIO: Int {
                return Int(SP_POSIX_PRIORITIZED_IO())
            }
            
            /// The implementation supports the Process Scheduling option.
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX_PRIORITY_SCHEDULING`
            public static var priorityScheduling: Int {
                return Int(SP_POSIX_PRIORITY_SCHEDULING())
            }
            
            /// The implementation supports the Raw Sockets option.
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX_RAW_SOCKETS`
            public static var rawSockets: Int {
                return Int(SP_POSIX_RAW_SOCKETS())
            }
            
            /// The implementation supports read-write locks.
            /// This symbol shall always be set to the value `200809L`.
            ///
            /// - Note: `_POSIX_READER_WRITER_LOCKS`
            public static var readerWriterLocks: Int {
                return Int(SP_POSIX_READER_WRITER_LOCKS())
            }
            
            /// The implementation supports realtime signals.
            /// This symbol shall always be set to the value `200809L`.
            ///
            /// - Note: `_POSIX_REALTIME_SIGNALS`
            public static var realtimeSignals: Int {
                return Int(SP_POSIX_REALTIME_SIGNALS())
            }
            
            /// The implementation supports the Regular Expression Handling option.
            /// This symbol shall always be set to a value greater than zero.
            ///
            /// - Note: `_POSIX_REGEXP`
            public static var regexp: Int {
                return Int(SP_POSIX_REGEXP())
            }
            
            /// Each process has a saved set-user-ID and a saved set-group-ID.
            /// This symbol shall always be set to a value greater than zero.
            ///
            /// - Note: `_POSIX_SAVED_IDS`
            public static var savedIDs: Int {
                return Int(SP_POSIX_SAVED_IDS())
            }
            
            /// The implementation supports semaphores.
            /// This symbol shall always be set to the value `200809L`.
            ///
            /// - Note: `_POSIX_SEMAPHORES`
            public static var semaphores: Int {
                return Int(SP_POSIX_SEMAPHORES())
            }
            
            /// The implementation supports the Shared Memory Objects option.
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX_SHARED_MEMORY_OBJECTS`
            public static var sharedMemoryObjects: Int {
                return Int(SP_POSIX_SHARED_MEMORY_OBJECTS())
            }
            
            /// The implementation supports the POSIX shell.
            /// This symbol shall always be set to a value greater than zero.
            ///
            /// - Note: `_POSIX_SHELL`
            public static var shell: Int {
                return Int(SP_POSIX_SHELL())
            }
            
            /// The implementation supports the Spawn option.
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX_SPAWN`
            public static var spawn: Int {
                return Int(SP_POSIX_SPAWN())
            }
            
            /// The implementation supports spin locks.
            /// This symbol shall always be set to the value `200809L`.
            ///
            /// - Note: `_POSIX_SPIN_LOCKS`
            public static var spinLocks: Int {
                return Int(SP_POSIX_SPIN_LOCKS())
            }
            
            /// The implementation supports the Process Sporadic Server option.
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX_SPORADIC_SERVER`
            public static var sporadicServer: Int {
                return Int(SP_POSIX_SPORADIC_SERVER())
            }
            
            /// The implementation supports the Synchronized Input and Output option.
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX_SYNCHRONIZED_IO`
            public static var synchronizedIO: Int {
                return Int(SP_POSIX_SYNCHRONIZED_IO())
            }
            
            /// The implementation supports the Thread Stack Address Attribute option.
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX_THREAD_ATTR_STACKADDR`
            public static var threadAttrStackAddr: Int {
                return Int(SP_POSIX_THREAD_ATTR_STACKADDR())
            }
            
            /// The implementation supports the Thread Stack Size Attribute option.
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX_THREAD_ATTR_STACKSIZE`
            public static var threadAttrStackSize: Int {
                return Int(SP_POSIX_THREAD_ATTR_STACKSIZE())
            }
            
            /// The implementation supports the Thread CPU-Time Clocks option.
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX_THREAD_CPUTIME`
            public static var threadCPUTime: Int {
                return Int(SP_POSIX_THREAD_CPUTIME())
            }
            
            /// The implementation supports the Non-Robust Mutex Priority Inheritance option.
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX_THREAD_PRIO_INHERIT`
            public static var threadPrioInherit: Int {
                return Int(SP_POSIX_THREAD_PRIO_INHERIT())
            }
            
            /// The implementation supports the Non-Robust Mutex Priority Protection option.
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX_THREAD_PRIO_PROTECT`
            public static var threadPrioProtect: Int {
                return Int(SP_POSIX_THREAD_PRIO_PROTECT())
            }
            
            /// The implementation supports the Thread Execution Scheduling option.
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX_THREAD_PRIORITY_SCHEDULING`
            public static var threadPriorityScheduling: Int {
                return Int(SP_POSIX_THREAD_PRIORITY_SCHEDULING())
            }
            
            /// The implementation supports the Thread Process-Shared Synchronization option.
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX_THREAD_PROCESS_SHARED`
            public static var threadProcessShared: Int {
                return Int(SP_POSIX_THREAD_PROCESS_SHARED())
            }
            
            /// The implementation supports the Robust Mutex Priority Inheritance option.
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX_THREAD_ROBUST_PRIO_INHERIT`
            public static var threadRobustPrioInherit: Int {
                return Int(SP_POSIX_THREAD_ROBUST_PRIO_INHERIT())
            }
            
            /// The implementation supports the Robust Mutex Priority Protection option.
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX_THREAD_ROBUST_PRIO_PROTECT`
            public static var threadRobustPrioProtect: Int {
                return Int(SP_POSIX_THREAD_ROBUST_PRIO_PROTECT())
            }
            
            /// The implementation supports thread-safe functions.
            /// This symbol shall always be set to the value `200809L`.
            ///
            /// - Note: `_POSIX_THREAD_SAFE_FUNCTIONS`
            public static var threadSafeFunctions: Int {
                return Int(SP_POSIX_THREAD_SAFE_FUNCTIONS())
            }
            
            /// The implementation supports the Thread Sporadic Server option.
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX_THREAD_SPORADIC_SERVER`
            public static var threadSporadicServer: Int {
                return Int(SP_POSIX_THREAD_SPORADIC_SERVER())
            }
            
            /// The implementation supports threads.
            /// This symbol shall always be set to the value `200809L`.
            ///
            /// - Note: `_POSIX_THREADS`
            public static var threads: Int {
                return Int(SP_POSIX_THREADS())
            }
            
            /// The implementation supports timeouts.
            /// This symbol shall always be set to the value `200809L`.
            ///
            /// - Note: `_POSIX_TIMEOUTS`
            public static var timeouts: Int {
                return Int(SP_POSIX_TIMEOUTS())
            }
            
            /// The implementation supports timers.
            /// This symbol shall always be set to the value `200809L`.
            ///
            /// - Note: `_POSIX_TIMERS`
            public static var timers: Int {
                return Int(SP_POSIX_TIMERS())
            }
            
            /// The implementation supports the Trace option.
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX_TRACE`
            public static var trace: Int {
                return Int(SP_POSIX_TRACE())
            }
            
            /// The implementation supports the Trace Event Filter option.
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX_TRACE_EVENT_FILTER`
            public static var traceEventFilter: Int {
                return Int(SP_POSIX_TRACE_EVENT_FILTER())
            }
            
            /// The implementation supports the Trace Inherit option.
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX_TRACE_INHERIT`
            public static var traceInherit: Int {
                return Int(SP_POSIX_TRACE_INHERIT())
            }
            
            /// The implementation supports the Trace Log option.
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX_TRACE_LOG`
            public static var traceLog: Int {
                return Int(SP_POSIX_TRACE_LOG())
            }
            
            /// The implementation supports the Typed Memory Objects option.
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX_TYPED_MEMORY_OBJECTS`
            public static var typedMemoryObjects: Int {
                return Int(SP_POSIX_TYPED_MEMORY_OBJECTS())
            }
        }
        
        /// The constants defined in `<unistd.h>` that are prepended with `_POSIX_V6_` in C.
        public enum PosixV6 {
        }
        
        /// The constants defined in `<unistd.h>` that are prepended with `_POSIX_V7_` in C.
        public enum PosixV7 {
        }
        
        /// The constants defined in `<unistd.h>` that are prepended with `_POSIX2_` in C.
        public enum Posix2 {
        }
        
        
        /// The constants defined in `<unistd.h>` that are prepended with `_XOPEN_` in C.
        public enum XOpen {
        }

        /*
        /// <#Description#>
        ///
        /// - Note: `<#Description#>`
        public static var <#Description#>: Int {
            #if <#Description#>
            return <#Description#>
            #else
            return -1
            #endif
        }
         */
    }
}

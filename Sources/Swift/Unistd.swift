//
//  Unistd.swift
//  SwiftyPOSIX
//
//  Created by Braden Scothern on 4/27/18.
//  Copyright © 2018 Braden Scothern. All rights reserved.
//

import Foundation

#if SWIFT_PACKAGE
import SwiftyPOSIX_C.Shims
#else
import SwiftyPOSIX.SwiftyPOSIX_C.Shims
#endif

/// ***Standard Symbolic Constants and Types***
///
/// Defines miscellaneous symbolic constants and types, and declares miscellaneous functions.
///
/// - Note: `<unistd.h>`
public enum Unistd {
    // MARK: - Types
    // MARK: Public

    /// Version Test Values
    public enum Version {
        // MARK: - Properties
        // MARK: Public Static

        /// Integer value indicating version of this standard (C-language binding) to which the implementation conforms.
        /// For implementations conforming to POSIX.1-2017, the value shall be `200809L`.
        ///
        /// - Note: `_POSIX_VERSION`
        public static let posix: Int = {
            return Int(SP_POSIX_VERSION())
        }()

        /// Profiles shall require the definition of the macro `_POSIX_SUBPROFILE` in `<unistd.h>` on implementations that do not meet all of the requirements of a POSIX.1-conforming implementation.
        ///
        /// If the current system fully supports the POSIX standard then this will be `nil`.
        ///
        /// - Note: `_POSIX_SUBPROFILE`
        public static let posixSubprofile: Int? = {
            return Int(valuePointer: SP_POSIX_SUBPROFILE())
        }()

        /// Integer value indicating version of the Shell and Utilities volume of POSIX.1 to which the implementation conforms.
        /// For implementations conforming to POSIX.1-2017, the value shall be `200809L`.
        /// For profile implementations that define `_POSIX_SUBPROFILE` in `<unistd.h>`, posix2Version may be left undefined or be defined with the value `-1` to indicate that the Shell and Utilities volume of POSIX.1 is not supported.
        /// In this case, a call to `sysconf(_SC_2_VERSION)` shall return either `200809L` or `-1` indicating that the Shell and Utilities volume of POSIX.1 is or is not, respectively, supported at runtime.
        ///
        /// - Note: `_POSIX2_VERSION`
        public static let posix2: Int? = {
            return Int(valuePointer: SP_POSIX2_VERSION())
        }()

        /// The `<unistd.h>` header shall define the following symbolic constant only if the implementation supports the XSI option see XSI Conformance.
        ///
        /// An integer value indicating version of the X/Open Portability Guide to which the implementation conforms.
        /// If defined the value shall be `700`.
        ///
        /// - Note: `_XOPEN_VERSION`
        public static let xopen: Int? = {
            return Int(valuePointer: SP_XOPEN_VERSION())
        }()
    }

    /// The following symbolic constants, if defined in `<unistd.h>`, shall have a value of `-1`, `0`, or greater, unless otherwise specified.
    ///
    /// For profile implementations that define `_POSIX_SUBPROFILE` in `<unistd.h>`, constants described below as always having a value greater than zero need not be defined and, if defined, may have a value of `-1`, `0`, or greater.
    ///
    /// If a symbolic constant is not defined or is defined with the value `-1`, the option is not supported for compilation.
    /// If it is defined with a value greater than zero, the option shall always be supported when the application is executed.
    /// If it is defined with the value zero, the option shall be supported for compilation and might or might not be supported at runtime.
    public enum Options {
        /// The constants defined in `<unistd.h>` that are prepended with `_POSIX_` in C.
        public enum Posix {
            /// The implementation supports the Advisory Information option.
            ///
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            ///
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX_ADVISORY_INFO`
            public static let advisoryInfo: Int? = {
                return Int(valuePointer: SP_POSIX_ADVISORY_INFO())
            }()

            /// The implementation supports asynchronous input and output.
            ///
            /// This symbol shall always be set to the value `200809L`.
            ///
            /// - Note: `_POSIX_ASYNCHRONOUS_IO`
            public static let asynchronousIO: Int? = {
                return Int(valuePointer: SP_POSIX_ASYNCHRONOUS_IO())
            }()

            /// The implementation supports barriers.
            /// This symbol shall always be set to the value `200809L`.
            ///
            /// - Note: `_POSIX_BARRIERS`
            public static let barries: Int? = {
                return Int(valuePointer: SP_POSIX_BARRIERS())
            }()

            /// The use of `chown()` and `fchown()` is restricted to a process with appropriate privileges, and to changing the group ID of a file only to the effective group ID of the process or to one of its supplementary group IDs.
            /// This symbol shall be defined with a value other than `-1`.
            ///
            /// - Note: `_POSIX_CHOWN_RESTRICTED`
            public static let chownRestricted: Int? = {
                return Int(valuePointer: SP_POSIX_CHOWN_RESTRICTED())
            }()

            /// The implementation supports clock selection.
            ///
            /// This symbol shall always be set to the value `200809L`.
            ///
            /// - Note: `_POSIX_CLOCK_SELECTION`
            public static let clockSelection: Int? = {
                return Int(valuePointer: SP_POSIX_CLOCK_SELECTION())
            }()

            /// The implementation supports the Process CPU-Time Clocks option.
            ///
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX_CPUTIME`
            public static let cpuTime: Int? = {
                return Int(valuePointer: SP_POSIX_CPUTIME())
            }()

            /// The implementation supports the File Synchronization option.
            ///
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX_FSYNC`
            public static let fSync: Int? = {
                return Int(valuePointer: SP_POSIX_FSYNC())
            }()

            /// The implementation supports the IPv6 option.
            ///
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX_IPV6`
            public static let ipv6: Int? = {
                return Int(valuePointer: SP_POSIX_IPV6())
            }()

            /// The implementation supports job control.
            ///
            /// This symbol shall always be set to a value greater than zero.
            ///
            /// - Note: `_POSIX_JOB_CONTROL`
            public static let jobControl: Int? = {
                return Int(valuePointer: SP_POSIX_JOB_CONTROL())
            }()

            /// The implementation supports memory mapped Files.
            ///
            /// This symbol shall always be set to the value `200809L`.
            ///
            /// - Note: `_POSIX_MAPPED_FILES`
            public static let mappedFiles: Int? = {
                return Int(valuePointer: SP_POSIX_MAPPED_FILES())
            }()

            /// The implementation supports the Process Memory Locking option.
            ///
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX_MEMLOCK`
            public static let memlock: Int? = {
                return Int(valuePointer: SP_POSIX_MEMLOCK())
            }()

            /// The implementation supports the Range Memory Locking option.
            ///
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX_MEMLOCK_RANGE`
            public static let memlockRange: Int? = {
                return Int(valuePointer: SP_POSIX_MEMLOCK_RANGE())
            }()

            /// The implementation supports memory protection.
            ///
            /// This symbol shall always be set to the value 200809L.
            ///
            /// - Note: `_POSIX_MEMORY_PROTECTION`
            public static let memoryProtection: Int? = {
                return Int(valuePointer: SP_POSIX_MEMORY_PROTECTION())
            }()

            /// The implementation supports the Message Passing option.
            ///
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX_MESSAGE_PASSING`
            public static let messagePassing: Int? = {
                return Int(valuePointer: SP_POSIX_MESSAGE_PASSING())
            }()

            /// The implementation supports the Monotonic Clock option.
            ///
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX_MONOTONIC_CLOCK`
            public static let monotonicClock: Int? = {
                return Int(valuePointer: SP_POSIX_MONOTONIC_CLOCK())
            }()

            /// Pathname components longer than `NAME_MAX` generate an error.
            ///
            /// This symbol shall be defined with a value other than `-1`.
            ///
            /// - Note: `_POSIX_NO_TRUNC`
            public static let noTrunc: Int? = {
                return Int(valuePointer: SP_POSIX_NO_TRUNC())
            }()

            /// The implementation supports the Prioritized Input and Output option.
            ///
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX_PRIORITIZED_IO`
            public static let prioritizedIO: Int? = {
                return Int(valuePointer: SP_POSIX_PRIORITIZED_IO())
            }()

            /// The implementation supports the Process Scheduling option.
            ///
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX_PRIORITY_SCHEDULING`
            public static let priorityScheduling: Int? = {
                return Int(valuePointer: SP_POSIX_PRIORITY_SCHEDULING())
            }()

            /// The implementation supports the Raw Sockets option.
            ///
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX_RAW_SOCKETS`
            public static let rawSockets: Int? = {
                return Int(valuePointer: SP_POSIX_RAW_SOCKETS())
            }()

            /// The implementation supports read-write locks.
            ///
            /// This symbol shall always be set to the value `200809L`.
            ///
            /// - Note: `_POSIX_READER_WRITER_LOCKS`
            public static let readerWriterLocks: Int? = {
                return Int(valuePointer: SP_POSIX_READER_WRITER_LOCKS())
            }()

            /// The implementation supports realtime signals.
            ///
            /// This symbol shall always be set to the value `200809L`.
            ///
            /// - Note: `_POSIX_REALTIME_SIGNALS`
            public static let realtimeSignals: Int? = {
                return Int(valuePointer: SP_POSIX_REALTIME_SIGNALS())
            }()

            /// The implementation supports the Regular Expression Handling option.
            ///
            /// This symbol shall always be set to a value greater than zero.
            ///
            /// - Note: `_POSIX_REGEXP`
            public static let regexp: Int? = {
                return Int(valuePointer: SP_POSIX_REGEXP())
            }()

            /// Each process has a saved set-user-ID and a saved set-group-ID.
            ///
            /// This symbol shall always be set to a value greater than zero.
            ///
            /// - Note: `_POSIX_SAVED_IDS`
            public static let savedIDs: Int? = {
                return Int(valuePointer: SP_POSIX_SAVED_IDS())
            }()

            /// The implementation supports semaphores.
            ///
            /// This symbol shall always be set to the value `200809L`.
            ///
            /// - Note: `_POSIX_SEMAPHORES`
            public static let semaphores: Int? = {
                return Int(valuePointer: SP_POSIX_SEMAPHORES())
            }()

            /// The implementation supports the Shared Memory Objects option.
            ///
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX_SHARED_MEMORY_OBJECTS`
            public static let sharedMemoryObjects: Int? = {
                return Int(valuePointer: SP_POSIX_SHARED_MEMORY_OBJECTS())
            }()

            /// The implementation supports the POSIX shell.
            ///
            /// This symbol shall always be set to a value greater than zero.
            ///
            /// - Note: `_POSIX_SHELL`
            public static let shell: Int? = {
                return Int(valuePointer: SP_POSIX_SHELL())
            }()

            /// The implementation supports the Spawn option.
            ///
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX_SPAWN`
            public static let spawn: Int? = {
                return Int(valuePointer: SP_POSIX_SPAWN())
            }()

            /// The implementation supports spin locks.
            ///
            /// This symbol shall always be set to the value `200809L`.
            ///
            /// - Note: `_POSIX_SPIN_LOCKS`
            public static let spinLocks: Int? = {
                return Int(valuePointer: SP_POSIX_SPIN_LOCKS())
            }()

            /// The implementation supports the Process Sporadic Server option.
            ///
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX_SPORADIC_SERVER`
            public static let sporadicServer: Int? = {
                return Int(valuePointer: SP_POSIX_SPORADIC_SERVER())
            }()

            /// The implementation supports the Synchronized Input and Output option.
            ///
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX_SYNCHRONIZED_IO`
            public static let synchronizedIO: Int? = {
                return Int(valuePointer: SP_POSIX_SYNCHRONIZED_IO())
            }()

            /// The implementation supports the Thread Stack Address Attribute option.
            ///
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX_THREAD_ATTR_STACKADDR`
            public static let threadAttrStackAddr: Int? = {
                return Int(valuePointer: SP_POSIX_THREAD_ATTR_STACKADDR())
            }()

            /// The implementation supports the Thread Stack Size Attribute option.
            ///
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX_THREAD_ATTR_STACKSIZE`
            public static let threadAttrStackSize: Int? = {
                return Int(valuePointer: SP_POSIX_THREAD_ATTR_STACKSIZE())
            }()

            /// The implementation supports the Thread CPU-Time Clocks option.
            ///
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX_THREAD_CPUTIME`
            public static let threadCPUTime: Int? = {
                return Int(valuePointer: SP_POSIX_THREAD_CPUTIME())
            }()

            /// The implementation supports the Non-Robust Mutex Priority Inheritance option.
            ///
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX_THREAD_PRIO_INHERIT`
            public static let threadPrioInherit: Int? = {
                return Int(valuePointer: SP_POSIX_THREAD_PRIO_INHERIT())
            }()

            /// The implementation supports the Non-Robust Mutex Priority Protection option.
            ///
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX_THREAD_PRIO_PROTECT`
            public static let threadPrioProtect: Int? = {
                return Int(valuePointer: SP_POSIX_THREAD_PRIO_PROTECT())
            }()

            /// The implementation supports the Thread Execution Scheduling option.
            ///
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX_THREAD_PRIORITY_SCHEDULING`
            public static let threadPriorityScheduling: Int? = {
                return Int(valuePointer: SP_POSIX_THREAD_PRIORITY_SCHEDULING())
            }()

            /// The implementation supports the Thread Process-Shared Synchronization option.
            ///
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX_THREAD_PROCESS_SHARED`
            public static let threadProcessShared: Int? = {
                return Int(valuePointer: SP_POSIX_THREAD_PROCESS_SHARED())
            }()

            /// The implementation supports the Robust Mutex Priority Inheritance option.
            ///
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX_THREAD_ROBUST_PRIO_INHERIT`
            public static let threadRobustPrioInherit: Int? = {
                return Int(valuePointer: SP_POSIX_THREAD_ROBUST_PRIO_INHERIT())
            }()

            /// The implementation supports the Robust Mutex Priority Protection option.
            ///
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX_THREAD_ROBUST_PRIO_PROTECT`
            public static let threadRobustPrioProtect: Int? = {
                return Int(valuePointer: SP_POSIX_THREAD_ROBUST_PRIO_PROTECT())
            }()

            /// The implementation supports thread-safe functions.
            ///
            /// This symbol shall always be set to the value `200809L`.
            ///
            /// - Note: `_POSIX_THREAD_SAFE_FUNCTIONS`
            public static let threadSafeFunctions: Int? = {
                return Int(valuePointer: SP_POSIX_THREAD_SAFE_FUNCTIONS())
            }()

            /// The implementation supports the Thread Sporadic Server option.
            ///
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX_THREAD_SPORADIC_SERVER`
            public static let threadSporadicServer: Int? = {
                return Int(valuePointer: SP_POSIX_THREAD_SPORADIC_SERVER())
            }()

            /// The implementation supports threads.
            ///
            /// This symbol shall always be set to the value `200809L`.
            ///
            /// - Note: `_POSIX_THREADS`
            public static let threads: Int? = {
                return Int(valuePointer: SP_POSIX_THREADS())
            }()

            /// The implementation supports timeouts.
            ///
            /// This symbol shall always be set to the value `200809L`.
            ///
            /// - Note: `_POSIX_TIMEOUTS`
            public static let timeouts: Int? = {
                return Int(valuePointer: SP_POSIX_TIMEOUTS())
            }()

            /// The implementation supports timers.
            ///
            /// This symbol shall always be set to the value `200809L`.
            ///
            /// - Note: `_POSIX_TIMERS`
            public static let timers: Int? = {
                return Int(valuePointer: SP_POSIX_TIMERS())
            }()

            /// The implementation supports the Trace option.
            ///
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX_TRACE`
            public static let trace: Int? = {
                return Int(valuePointer: SP_POSIX_TRACE())
            }()

            /// The implementation supports the Trace Event Filter option.
            ///
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX_TRACE_EVENT_FILTER`
            public static let traceEventFilter: Int? = {
                return Int(valuePointer: SP_POSIX_TRACE_EVENT_FILTER())
            }()

            /// The implementation supports the Trace Inherit option.
            ///
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX_TRACE_INHERIT`
            public static let traceInherit: Int? = {
                return Int(valuePointer: SP_POSIX_TRACE_INHERIT())
            }()

            /// The implementation supports the Trace Log option.
            ///
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX_TRACE_LOG`
            public static let traceLog: Int? = {
                return Int(valuePointer: SP_POSIX_TRACE_LOG())
            }()

            /// The implementation supports the Typed Memory Objects option.
            ///
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX_TYPED_MEMORY_OBJECTS`
            public static let typedMemoryObjects: Int? = {
                return Int(valuePointer: SP_POSIX_TYPED_MEMORY_OBJECTS())
            }()
        }

        /// The constants defined in `<unistd.h>` that are prepended with `_POSIX_V6_` in C.
        public enum PosixV6 {
            /// The implementation provides a C-language compilation environment with 32-bit `int`, `long`, `pointer`, and `off_t` types.
            ///
            /// - Note: `_POSIX_V6_ILP32_OFF32`
            public static let ilp32Off32: Int? = {
                return Int(valuePointer: SP_POSIX_V6_ILP32_OFF32())
            }()

            /// The implementation provides a C-language compilation environment with 32-bit `int`, `long`, and `pointer` types and an `off_t` type using at least 64 bits.
            ///
            /// - Note: `_POSIX_V6_ILP32_OFFBIG`
            public static let ilp32OffBig: Int? = {
                return Int(valuePointer: SP_POSIX_V6_ILP32_OFFBIG())
            }()

            /// The implementation provides a C-language compilation environment with 32-bit `int` and 64-bit `long`, `pointer`, and `off_t` types.
            ///
            /// - Note: `_POSIX_V6_LP64_OFF64`
            public static let lp64Off64: Int? = {
                return Int(valuePointer: SP_POSIX_V6_LP64_OFF64())
            }()

            /// The implementation provides a C-language compilation environment with an `int` type using at least 32 bits and `long`, `pointer`, and `off_t` types using at least 64 bits.
            ///
            /// - Note: `_POSIX_V6_LPBIG_OFFBIG`
            public static let lpBigOffBig: Int? = {
                return Int(valuePointer: SP_POSIX_V6_LPBIG_OFFBIG())
            }()
        }

        /// The constants defined in `<unistd.h>` that are prepended with `_POSIX_V7_` in C.
        public enum PosixV7 {
            /// The implementation provides a C-language compilation environment with 32-bit `int`, `long`, `pointer`, and `off_t` types.
            ///
            /// - Note: `_POSIX_V7_ILP32_OFF32`
            public static let ilp32Off32: Int? = {
                return Int(valuePointer: SP_POSIX_V7_ILP32_OFF32())
            }()

            /// The implementation provides a C-language compilation environment with 32-bit `int`, `long`, and `pointer` types and an `off_t` type using at least 64 bits.
            ///
            /// - Note: `_POSIX_V7_ILP32_OFFBIG`
            public static let ilp32OffBig: Int? = {
                return Int(valuePointer: SP_POSIX_V7_ILP32_OFFBIG())
            }()

            /// The implementation provides a C-language compilation environment with 32-bit `int` and 64-bit `long`, `pointer`, and `off_t` types.
            ///
            /// - Note: `_POSIX_V7_LP64_OFF64`
            public static let lp64Off64: Int? = {
                return Int(valuePointer: SP_POSIX_V7_LP64_OFF64())
            }()

            /// The implementation provides a C-language compilation environment with an `int` type using at least 32 bits and `long`, `pointer`, and `off_t` types using at least 64 bits.
            ///
            /// - Note: `_POSIX_V7_LPBIG_OFFBIG`
            public static let lpBigOffBig: Int? = {
                return Int(valuePointer: SP_POSIX_V7_LPBIG_OFFBIG())
            }()
        }

        /// The constants defined in `<unistd.h>` that are prepended with `_POSIX2_` in C.
        public enum Posix2 {
            /// The implementation supports the C-Language Binding option.
            ///
            /// This symbol shall always have the value `200809L`.
            ///
            /// - Note: `_POSIX2_C_BIND`
            public static let cBind: Int? = {
                return Int(valuePointer: SP_POSIX2_C_BIND())
            }()

            /// The implementation supports the C-Language Development Utilities option.
            ///
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX2_C_DEV`
            public static let cDev: Int? = {
                return Int(valuePointer: SP_POSIX2_C_DEV())
            }()

            /// The implementation supports the Terminal Characteristics option.
            ///
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or a value greater than zero.
            ///
            /// - Note: `_POSIX2_CHAR_TERM`
            public static let charTerm: Int? = {
                return Int(valuePointer: SP_POSIX2_CHAR_TERM())
            }()

            //TODO: _POSIX2_FORT_DEV

            /// The implementation supports the FORTRAN Development Utilities option.
            ///
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX2_FORT_DEV`
            public static let fortDev: Int? = {
                return Int(valuePointer: SP_POSIX2_FORT_DEV())
            }()

            /// The implementation supports the FORTRAN Runtime Utilities option.
            ///
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX2_FORT_RUN`
            public static let fortRun: Int? = {
                return Int(valuePointer: SP_POSIX2_FORT_RUN())
            }()

            /// The implementation supports the creation of locales by the localedef utility.
            ///
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX2_LOCALEDEF`
            public static let localeDef: Int? = {
                return Int(valuePointer: SP_POSIX2_LOCALEDEF())
            }()

            /// The implementation supports the Batch Environment Services and Utilities option.
            ///
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX2_PBS`
            public static let pbs: Int? = {
                return Int(valuePointer: SP_POSIX2_PBS())
            }()

            /// The implementation supports the Batch Accounting option.
            ///
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX2_PBS_ACCOUNTING`
            public static let pbsAccounting: Int? = {
                return Int(valuePointer: SP_POSIX2_PBS_ACCOUNTING())
            }()

            /// The implementation supports the Batch Checkpoint/Restart option.
            ///
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX2_PBS_CHECKPOINT`
            public static let pbsCheckpoint: Int? = {
                return Int(valuePointer: SP_POSIX2_PBS_CHECKPOINT())
            }()

            /// The implementation supports the Locate Batch Job Request option.
            ///
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX2_PBS_LOCATE`
            public static let pbsLocate: Int? = {
                return Int(valuePointer: SP_POSIX2_PBS_LOCATE())
            }()

            /// The implementation supports the Batch Job Message Request option.
            ///
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX2_PBS_MESSAGE`
            public static let pbsMessage: Int? = {
                return Int(valuePointer: SP_POSIX2_PBS_MESSAGE())
            }()

            /// The implementation supports the Track Batch Job Request option.
            ///
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX2_PBS_TRACK`
            public static let pbsTrack: Int? = {
                return Int(valuePointer: SP_POSIX2_PBS_TRACK())
            }()

            /// The implementation supports the Software Development Utilities option.
            ///
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX2_SW_DEV`
            public static let swDev: Int? = {
                return Int(valuePointer: SP_POSIX2_SW_DEV())
            }()

            /// The implementation supports the User Portability Utilities option.
            ///
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall either be `-1` or `200809L`.
            ///
            /// - Note: `_POSIX2_UPE`
            public static let upe: Int? = {
                return Int(valuePointer: SP_POSIX2_UPE())
            }()
        }

        /// The constants defined in `<unistd.h>` that are prepended with `_XOPEN_` in C.
        public enum XOpen {
            /// The implementation supports the X/Open Encryption Option Group.
            ///
            /// - Note: `_XOPEN_CRYPT`
            public static let crypt: Int? = {
                return Int(valuePointer: SP_XOPEN_CRYPT())
            }()

            /// The implementation supports the Issue 4, Version 2 Enhanced Internationalization Option Group.
            ///
            /// This symbol shall always be set to a value other than -1.
            /// - Note: `_XOPEN_ENH_I18N`
            public static let enhI18N: Int? = {
                return Int(valuePointer: SP_XOPEN_ENH_I18N())
            }()

            /// The implementation supports the X/Open Realtime Option Group.
            ///
            /// - Note: `_XOPEN_REALTIME`
            public static let realtime: Int? = {
                return Int(valuePointer: SP_XOPEN_REALTIME())
            }()

            /// The implementation supports the X/Open Realtime Threads Option Group.
            ///
            /// - Note: `_XOPEN_REALTIME_THREADS`
            public static let realtimeThreads: Int? = {
                return Int(valuePointer: SP_XOPEN_REALTIME_THREADS())
            }()

            /// The implementation supports the Issue 4, Version 2 Shared Memory Option Group.
            ///
            /// This symbol shall always be set to a value other than -1.
            ///
            /// - Note: `_XOPEN_SHM`
            public static let shm: Int? = {
                return Int(valuePointer: SP_XOPEN_SHM())
            }()

            /// The implementation supports the XSI STREAMS Option Group.
            ///
            /// - Note: `_XOPEN_STREAMS`
            public static let streams: Int? = {
                return Int(valuePointer: SP_XOPEN_STREAMS())
            }()

            /// The implementation supports the XSI option.
            ///
            /// - Note: `_XOPEN_UNIX`
            public static let unix: Int? = {
                return Int(valuePointer: SP_XOPEN_UNIX())
            }()

            /// The implementation supports the UUCP Utilities option.
            ///
            /// If this symbol is defined in `<unistd.h>`, it shall be defined to be `-1`, `0`, or `200809L`.
            /// The value of this symbol reported by `sysconf()` shall be either `-1` or `200809L`.
            ///
            /// - Note: `_XOPEN_UUCP`
            public static let uucp: Int? = {
                return Int(valuePointer: SP_XOPEN_UUCP())
            }()
        }
    }

    /// If any of the following symbolic constants are not defined in the `<unistd.h>` header, the value shall vary depending on the file to which it is applied.
    /// If defined, they shall have values suitable for use in #if preprocessing directives.
    ///
    /// If any of the following symbolic constants are defined to have value `-1` in the `<unistd.h>` header, the implementation shall not provide the option on any file if any are defined to have a value other than `-1` in the `<unistd.h>` header, the implementation shall provide the option on all applicable files.
    public enum ExecutionTime {
        /// All of the following values, whether defined as symbolic constants in `<unistd.h>` or not, may be queried with respect to a specific file using the `pathconf()` or `fpathconf()` functions.
        public enum PathConf {
            /// Asynchronous input or output operations may be performed for the associated file.
            ///
            /// - Note: `_POSIX_ASYNC_IO`
            public static let posixAsyncIO: Int? = {
                return Int(valuePointer: SP_POSIX_ASYNC_IO())
            }()

            /// Prioritized input or output operations may be performed for the associated file.
            ///
            /// - Note: `_POSIX_PRIO_IO`
            public static let posixPrioIO: Int? = {
                return Int(valuePointer: SP_POSIX_PRIO_IO())
            }()

            /// Synchronized input or output operations may be performed for the associated file.
            ///
            /// - Note: `_POSIX_SYNC_IO`
            public static let posixSyncIO: Int? = {
                return Int(valuePointer: SP_POSIX_SYNC_IO())
            }()
        }

        /// If the following symbolic constants are defined in the `<unistd.h>` header, they apply to files and all paths in all file systems on the implementation.
        public enum FileSystem {
            /// The resolution in nanoseconds for all file timestamps.
            ///
            /// - Note: `_POSIX_TIMESTAMP_RESOLUTION`
            public static let posixTimestampResolution: Int? = {
                return Int(valuePointer: SP_POSIX_TIMESTAMP_RESOLUTION())
            }()

            /// Symbolic links can be created.
            ///
            /// - Note: `_POSIX2_SYMLINKS`
            public static let posix2Symlinks: Int? = {
                return Int(valuePointer: SP_POSIX2_SYMLINKS())
            }()
        }
    }

    public enum FunctionConstants {
        /// The `<unistd.h>` header shall define the following symbolic constants for use with the `access()` function.
        ///
        /// The values shall be suitable for use in #if preprocessing directives.
        ///
        /// The constants `F_OK`, `R_OK`, `W_OK`, and `X_OK` and the expressions `R_OK|W_OK`, `R_OK|X_OK`, and `R_OK|W_OK|X_OK` shall all have distinct values.
        public enum AccessMode: Int32, CaseIterable {
            /// Test for existence of file.
            ///
            /// - Note: `F_OK`
            case exists

            /// Test for read permission.
            ///
            /// - Note: `R_OK`
            case read

            /// Test for write permission.
            ///
            /// - Note: `W_OK`
            case write

            /// Test for execute (search) permission.
            ///
            /// - Note: `X_OK`
            case execute

            public var rawValue: Int32 {
                switch self {
                case .exists:
                    return F_OK
                case .read:
                    return R_OK
                case .write:
                    return W_OK
                case .execute:
                    return X_OK
                }
            }
        }

        //TODO: Convert ConfstrName to a struct
        /// The `<unistd.h>` header shall define the following symbolic constants for the `confstr()` function.
        public enum ConfstrName {
            /// This is the value for the PATH environment variable that finds all of the standard utilities that are provided in a manner accessible via the exec family of functions.
            ///
            /// - Note: `_CS_PATH`
            public static var path: Int? = {
                return Int(valuePointer: SP_CS_PATH())
            }()

            /// The POSIX v7 defines for `consfstr()`.
            ///
            /// These values in C land all start with `_CS_POSIX_V7_`
            public enum POSIXv7 {
                /// These `consfstr()` defines for POSIX v7 are the `ILP32_OFF32` values.
                ///
                /// These all start with `_CS_POSIX_V7_ILP32_OFF32_`.
                public enum ILP32Off32 {
                    /// If `sysconf(_SC_V7_ILP32_OFF32)` returns `-1`, the meaning of this value is unspecified.
                    /// Otherwise, this value is the set of initial options to be given to the c99 utility to build an application using a programming model with 32-bit `int`, `long`, `pointer`, and `off_t` types.
                    ///
                    /// - Note: `_CS_POSIX_V7_ILP32_OFF32_CFLAGS`
                    public static let cFlags: Int? = {
                        return Int(valuePointer: SP_CS_POSIX_V7_ILP32_OFF32_CFLAGS())
                    }()

                    /// If `sysconf(_SC_V7_ILP32_OFF32)` returns `-1`, the meaning of this value is unspecified.
                    /// Otherwise, this value is the set of final options to be given to the c99 utility to build an application using a programming model with 32-bit `int`, `long`, `pointer`, and `off_t` types.
                    ///
                    /// - Note: `_CS_POSIX_V7_ILP32_OFF32_LDFLAGS`
                    public static let ldFlags: Int? = {
                        return Int(valuePointer: SP_CS_POSIX_V7_ILP32_OFF32_LDFLAGS())
                    }()

                    /// If `sysconf(_SC_V7_ILP32_OFF32)` returns `-1`, the meaning of this value is unspecified.
                    /// Otherwise, this value is the set of libraries to be given to the c99 utility to build an application using a programming model with 32-bit `int`, `long`, `pointer`, and `off_t` types.
                    ///
                    /// - Note: `_CS_POSIX_V7_ILP32_OFF32_LIBS`
                    public static let libs: Int? = {
                        return Int(valuePointer: SP_CS_POSIX_V7_ILP32_OFF32_LIBS())
                    }()
                }

                /// These `consfstr()` defines for POSIX v7 are the `ILP32_OFFBIG` values.
                ///
                /// These all start with `_CS_POSIX_V7_ILP32_OFFBIG_`.
                public enum ILP32OffBig {
                    /// If `sysconf(_SC_V7_ILP32_OFFBIG)` returns `-1`, the meaning of this value is unspecified.
                    /// Otherwise, this value is the set of initial options to be given to the c99 utility to build an application using a programming model with 32-bit `int`, `long`, and pointer types, and an `off_t` type using at least 64 bits.
                    ///
                    /// - Note: `_CS_POSIX_V7_ILP32_OFFBIG_CFLAGS`
                    public static let cFlags: Int? = {
                        return Int(valuePointer: SP_CS_POSIX_V7_ILP32_OFFBIG_CFLAGS())
                    }()

                    /// If `sysconf(_SC_V7_ILP32_OFFBIG)` returns `-1`, the meaning of this value is unspecified.
                    /// Otherwise, this value is the set of final options to be given to the c99 utility to build an application using a programming model with 32-bit `int`, `long`, and pointer types, and an `off_t` type using at least 64 bits.
                    ///
                    /// - Note: `_CS_POSIX_V7_ILP32_OFFBIG_LDFLAGS`
                    public static let ldFlags: Int? = {
                        return Int(valuePointer: SP_CS_POSIX_V7_ILP32_OFFBIG_LDFLAGS())
                    }()

                    /// If `sysconf(_SC_V7_ILP32_OFFBIG)` returns `-1`, the meaning of this value is unspecified.
                    /// Otherwise, this value is the set of libraries to be given to the c99 utility to build an application using a programming model with 32-bit `int`, `long`, and pointer types, and an `off_t` type using at least 64 bits.
                    ///
                    /// - Note: `_CS_POSIX_V7_ILP32_OFFBIG_LIBS`
                    public static let libs: Int? = {
                        return Int(valuePointer: SP_CS_POSIX_V7_ILP32_OFFBIG_LIBS())
                    }()
                }

                /// These `consfstr()` defines for POSIX v7 are the `LP64_OFF64` values.
                ///
                /// These all start with `_CS_POSIX_V7_LP64_OFF64_`.
                public enum LP64Off64 {
                    /// If `sysconf(_SC_V7_LP64_OFF64)` returns `-1`, the meaning of this value is unspecified.
                    /// Otherwise, this value is the set of initial options to be given to the c99 utility to build an application using a programming model with 32-bit `int` and 64-bit `long`, `pointer`, and `off_t` types.
                    ///
                    /// - Note: `_CS_POSIX_V7_LP64_OFF64_CFLAGS`
                    public static let cFlags: Int? = {
                        return Int(valuePointer: SP_CS_POSIX_V7_LP64_OFF64_CFLAGS())
                    }()

                    /// If `sysconf(_SC_V7_LP64_OFF64)` returns `-1`, the meaning of this value is unspecified.
                    /// Otherwise, this value is the set of final options to be given to the c99 utility to build an application using a programming model with 32-bit `int` and 64-bit `long`, `pointer`, and `off_t` types.
                    ///
                    /// - Note: `_CS_POSIX_V7_LP64_OFF64_LDFLAGS`
                    public static let ldFlags: Int? = {
                        return Int(valuePointer: SP_CS_POSIX_V7_LP64_OFF64_LDFLAGS())
                    }()

                    /// If `sysconf(_SC_V7_LP64_OFF64)` returns `-1`, the meaning of this value is unspecified.
                    /// Otherwise, this value is the set of libraries to be given to the c99 utility to build an application using a programming model with 32-bit `int` and 64-bit `long`, `pointer`, and `off_t` types.
                    ///
                    /// - Note: `_CS_POSIX_V7_LP64_OFF64_LIBS`
                    public static let libs: Int? = {
                        return Int(valuePointer: SP_CS_POSIX_V7_LP64_OFF64_LIBS())
                    }()
                }

                /// These `consfstr()` defines for POSIX v7 are the `LPBIG_OFFBIG` values.
                ///
                /// These all start with `_CS_POSIX_V7_LPBIG_OFFBIG_`.
                public enum LPBigOffBig {
                    /// If `sysconf(_SC_V7_LPBIG_OFFBIG)` returns `-1`, the meaning of this value is unspecified.
                    /// Otherwise, this value is the set of initial options to be given to the c99 utility to build an application using a programming model with an `int` type using at least 32 bits and `long`, `pointer`, and `off_t` types using at least 64 bits.
                    ///
                    /// - Note: `_CS_POSIX_V7_LPBIG_OFFBIG_CFLAGS`
                    public static let cFlags: Int? = {
                        return Int(valuePointer: SP_CS_POSIX_V7_LPBIG_OFFBIG_CFLAGS())
                    }()

                    /// If `sysconf(_SC_V7_LPBIG_OFFBIG)` returns `-1`, the meaning of this value is unspecified.
                    /// Otherwise, this value is the set of final options to be given to the c99 utility to build an application using a programming model with an `int` type using at least 32 bits and `long`, `pointer`, and `off_t` types using at least 64 bits.
                    ///
                    /// - Note: `_CS_POSIX_V7_LPBIG_OFFBIG_LDFLAGS`
                    public static let ldFlags: Int? = {
                        return Int(valuePointer: SP_CS_POSIX_V7_LPBIG_OFFBIG_LDFLAGS())
                    }()

                    /// If `sysconf(_SC_V7_LPBIG_OFFBIG)` returns `-1`, the meaning of this value is unspecified.
                    /// Otherwise, this value is the set of libraries to be given to the c99 utility to build an application using a programming model with an `int` type using at least 32 bits and `long`, `pointer`, and `off_t` types using at least 64 bits.
                    ///
                    /// - Note: `_CS_POSIX_V7_LPBIG_OFFBIG_LIBS`
                    public static let libs: Int? = {
                        return Int(valuePointer: SP_CS_POSIX_V7_LPBIG_OFFBIG_LIBS())
                    }()
                }

                /// These `consfstr()` defines for POSIX v7 are the `THREADS` values.
                ///
                /// These all start with `_CS_POSIX_V7_THREADS_`.
                public enum Threads {
                    /// If `sysconf(_SC_POSIX_THREADS)` returns `-1`, the meaning of this value is unspecified.
                    /// Otherwise, this value is the set of initial options to be given to the c99 utility to build a multi-threaded application.
                    /// These flags are in addition to those associated with any of the other `_CS_POSIX_V7_*_CFLAGS` values used to specify particular type size programing environments.
                    ///
                    /// - Note: `_CS_POSIX_V7_THREADS_CFLAGS`
                    public static let cFlags: Int? = {
                        return Int(valuePointer: SP_CS_POSIX_V7_THREADS_CFLAGS())
                    }()

                    /// If `sysconf(_SC_POSIX_THREADS)` returns `-1`, the meaning of this value is unspecified.
                    /// Otherwise, this value is the set of final options to be given to the c99 utility to build a multi-threaded application.
                    /// These flags are in addition to those associated with any of the other `_CS_POSIX_V7_*_LDFLAGS` values used to specify particular type size programing environments.
                    ///
                    /// - Note: `_CS_POSIX_V7_THREADS_LDFLAGS`
                    public static let ldFlags: Int? = {
                        return Int(valuePointer: SP_CS_POSIX_V7_THREADS_LDFLAGS())
                    }()
                }

                /// This value is a <newline>-separated list of names of programming environments supported by the implementation in which the widths of the `blksize_t`, `cc_t`, `mode_t`, `nfds_t`, `pid_t`, `ptrdiff_t`, `size_t`, `speed_t`, `ssize_t`, `suseconds_t`, `tcflag_t`, `wchar_t`, and `wint_t` types are no greater than the width of type `long`.
                /// The format of each name shall be suitable for use with the `getconf` `-v` option.
                ///
                /// - Note: `_CS_POSIX_V7_WIDTH_RESTRICTED_ENVS`
                public static let widthRestrictedEnvs: Int? = {
                    return Int(valuePointer: SP_CS_POSIX_V7_WIDTH_RESTRICTED_ENVS())
                }()

                /// This is the value that provides the environment variable information (other than that provided by `_CS_PATH`) that is required by the implementation to create a conforming environment, as described in the implementation's conformance documentation.
                ///
                /// - Note: `_CS_V7_ENV`
                public static let env: Int? = {
                    return Int(valuePointer: SP_CS_V7_ENV())
                }()
            }

            /// Constants reserved for compatibility with `Unistd.h` issue 6.
            public enum POSIXv6 {
                /// These `consfstr()` defines for POSIX v6 are the `ILP32_OFF32` values.
                ///
                /// These all start with `_CS_POSIX_V6_ILP32_OFF32_`.
                public enum ILP32Off32 {
                    /// A constant reserved for compatibility with `Unistd.h` issue 6.
                    ///
                    /// - Note: `_CS_POSIX_V6_ILP32_OFF32_CFLAGS`
                    public static let cFlags: Int? = {
                        return Int(valuePointer: SP_CS_POSIX_V6_ILP32_OFF32_CFLAGS())
                    }()

                    /// A constant reserved for compatibility with `Unistd.h` issue 6.
                    ///
                    /// - Note: `_CS_POSIX_V6_ILP32_OFF32_LDFLAGS`
                    public static let ldFlags: Int? = {
                        return Int(valuePointer: SP_CS_POSIX_V6_ILP32_OFF32_LDFLAGS())
                    }()

                    /// A constant reserved for compatibility with `Unistd.h` issue 6.
                    ///
                    /// - Note: `_CS_POSIX_V6_ILP32_OFF32_LIBS`
                    public static let libs: Int? = {
                        return Int(valuePointer: SP_CS_POSIX_V6_ILP32_OFF32_LIBS())
                    }()
                }

                /// These `consfstr()` defines for POSIX v6 are the `ILP32_OFFBIG` values.
                ///
                /// These all start with `_CS_POSIX_V6_ILP32_OFFBIG_`.
                public enum ILP32OffBig {
                    /// A constant reserved for compatibility with `Unistd.h` issue 6.
                    ///
                    /// - Note: `_CS_POSIX_V6_ILP32_OFFBIG_CFLAGS`
                    public static let cFlags: Int? = {
                        return Int(valuePointer: SP_CS_POSIX_V6_ILP32_OFFBIG_CFLAGS())
                    }()

                    /// A constant reserved for compatibility with `Unistd.h` issue 6.
                    ///
                    /// - Note: `_CS_POSIX_V6_ILP32_OFFBIG_LDFLAGS`
                    public static let ldFlags: Int? = {
                        return Int(valuePointer: SP_CS_POSIX_V6_ILP32_OFFBIG_LDFLAGS())
                    }()

                    /// A constant reserved for compatibility with `Unistd.h` issue 6.
                    ///
                    /// - Note: `_CS_POSIX_V6_ILP32_OFFBIG_LIBS`
                    public static let libs: Int? = {
                        return Int(valuePointer: SP_CS_POSIX_V6_ILP32_OFFBIG_LIBS())
                    }()
                }

                /// These `consfstr()` defines for POSIX v6 are the `LP64_OFF64` values.
                ///
                /// These all start with `_CS_POSIX_V6_LP64_OFF64_`.
                public enum LP64Off64 {
                    /// A constant reserved for compatibility with `Unistd.h` issue 6.
                    ///
                    /// - Note: `_CS_POSIX_V6_LP64_OFF64_CFLAGS`
                    public static let cFlags: Int? = {
                        return Int(valuePointer: SP_CS_POSIX_V6_LP64_OFF64_CFLAGS())
                    }()

                    /// A constant reserved for compatibility with `Unistd.h` issue 6.
                    ///
                    /// - Note: `_CS_POSIX_V6_LP64_OFF64_LDFLAGS`
                    public static let ldFlags: Int? = {
                        return Int(valuePointer: SP_CS_POSIX_V6_LP64_OFF64_LDFLAGS())
                    }()

                    /// A constant reserved for compatibility with `Unistd.h` issue 6.
                    ///
                    /// - Note: `_CS_POSIX_V6_LP64_OFF64_LIBS`
                    public static let libs: Int? = {
                        return Int(valuePointer: SP_CS_POSIX_V6_LP64_OFF64_LIBS())
                    }()
                }

                /// These `consfstr()` defines for POSIX v6 are the `LPBIG_OFFBIG` values.
                ///
                /// These all start with `_CS_POSIX_V6_LPBIG_OFFBIG_`.
                public enum LPBigOffBig {
                    /// A constant reserved for compatibility with `Unistd.h` issue 6.
                    ///
                    /// - Note: `_CS_POSIX_V6_LPBIG_OFFBIG_CFLAGS`
                    public static let cFlags: Int? = {
                        return Int(valuePointer: SP_CS_POSIX_V6_LPBIG_OFFBIG_CFLAGS())
                    }()

                    /// A constant reserved for compatibility with `Unistd.h` issue 6.
                    ///
                    /// - Note: `_CS_POSIX_V6_LPBIG_OFFBIG_LDFLAGS`
                    public static let ldFlags: Int? = {
                        return Int(valuePointer: SP_CS_POSIX_V6_LPBIG_OFFBIG_LDFLAGS())
                    }()

                    /// A constant reserved for compatibility with `Unistd.h` issue 6.
                    ///
                    /// - Note: `_CS_POSIX_V6_LPBIG_OFFBIG_LIBS`
                    public static let libs: Int? = {
                        return Int(valuePointer: SP_CS_POSIX_V6_LPBIG_OFFBIG_LIBS())
                    }()
                }

                /// A constant reserved for compatibility with `Unistd.h` issue 6.
                ///
                /// - Note: `_CS_POSIX_V6_WIDTH_RESTRICTED_ENVS`
                public static let widthRestrictedEnvs: Int? = {
                    return Int(valuePointer: SP_CS_POSIX_V6_WIDTH_RESTRICTED_ENVS())
                }()

                /// A constant reserved for compatibility with `Unistd.h` issue 6.
                ///
                /// - Note: `_CS_V6_ENV`
                public static let env: Int? = {
                    return Int(valuePointer: SP_CS_V6_ENV())
                }()
            }
        }

        /// The `<unistd.h>` header shall define the following symbolic constants as possible values for the function argument to the `lockf()` function.
        public enum LockfFunction: Int32, CaseIterable {
            /// Lock a section for exclusive use.
            ///
            /// - Note: `F_LOCK`
            case lock

            /// Test section for locks by other processes.
            ///
            /// - Note: `F_TEST`
            case test

            /// Test and lock a section for exclusive use.
            ///
            /// - Note: `F_TLOCK`
            case testLock

            /// Unlock locked sections.
            ///
            /// - Note: `F_ULOCK`
            case unlock

            public var rawValue: Int32 {
                switch self {
                case .lock:
                    return F_LOCK
                case .test:
                    return F_TEST
                case .testLock:
                    return F_TLOCK
                case .unlock:
                    return F_ULOCK
                }
            }
        }

        /// The `<unistd.h>` header shall define the following symbolic constants for `pathconf()`.
        public struct PathconfName: RawRepresentable, Hashable, CaseIterable {
            public typealias RawValue = Int
            public typealias AllCases = [PathconfName]

            public let rawValue: RawValue

            private init?(valuePointer: UnsafePointer<Int32>?) {
                guard let value = Int(valuePointer: valuePointer) else {
                    return nil
                }
                self.rawValue = value
            }

            public init?(rawValue: Int) {
                guard let pathconfName = PathconfName.allCases.first(where: { $0.rawValue == rawValue }) else {
                    return nil
                }
                self = pathconfName
            }

            public static let allCases: AllCases = {
                return [
                    symlinks,
                    allocSizeMin,
                    asyncIO,
                    chownRestricted,
                    fileSizeBits,
                    linkMax,
                    maxCanon,
                    maxInput,
                    nameMax,
                    noTrunc,
                    pathMax,
                    pipeBuf,
                    prioIO,
                    recIncrXferSize,
                    recMaxXferSize,
                    recMinXferSize,
                    recXferAlign,
                    symlinkMax,
                    syncIO,
                    timestampResolution,
                    vDisable
                ].lazy.compactMap { $0 }
            }()

            public static var symlinks: PathconfName? {
                return PathconfName(valuePointer: SP_PC_2_SYMLINKS())
            }

            public static var allocSizeMin: PathconfName? {
                return PathconfName(valuePointer: SP_PC_ALLOC_SIZE_MIN())
            }

            public static var asyncIO: PathconfName? {
                return PathconfName(valuePointer: SP_PC_ASYNC_IO())
            }

            public static var chownRestricted: PathconfName? {
                return PathconfName(valuePointer: SP_PC_CHOWN_RESTRICTED())
            }

            public static var fileSizeBits: PathconfName? {
                return PathconfName(valuePointer: SP_PC_FILESIZEBITS())
            }

            public static var linkMax: PathconfName? {
                return PathconfName(valuePointer: SP_PC_LINK_MAX())
            }

            public static var maxCanon: PathconfName? {
                return PathconfName(valuePointer: SP_PC_MAX_CANON())
            }

            public static var maxInput: PathconfName? {
                return PathconfName(valuePointer: SP_PC_MAX_INPUT())
            }

            public static var nameMax: PathconfName? {
                return PathconfName(valuePointer: SP_PC_NAME_MAX())
            }

            public static var noTrunc: PathconfName? {
                return PathconfName(valuePointer: SP_PC_NO_TRUNC())
            }

            public static var pathMax: PathconfName? {
                return PathconfName(valuePointer: SP_PC_PATH_MAX())
            }

            public static var pipeBuf: PathconfName? {
                return PathconfName(valuePointer: SP_PC_PIPE_BUF())
            }

            public static var prioIO: PathconfName? {
                return PathconfName(valuePointer: SP_PC_PRIO_IO())
            }

            public static var recIncrXferSize: PathconfName? {
                return PathconfName(valuePointer: SP_PC_REC_INCR_XFER_SIZE())
            }

            public static var recMaxXferSize: PathconfName? {
                return PathconfName(valuePointer: SP_PC_REC_MAX_XFER_SIZE())
            }

            public static var recMinXferSize: PathconfName? {
                return PathconfName(valuePointer: SP_PC_REC_MIN_XFER_SIZE())
            }

            public static var recXferAlign: PathconfName? {
                return PathconfName(valuePointer: SP_PC_REC_XFER_ALIGN())
            }

            public static var symlinkMax: PathconfName? {
                return PathconfName(valuePointer: SP_PC_SYMLINK_MAX())
            }

            public static var syncIO: PathconfName? {
                return PathconfName(valuePointer: SP_PC_SYNC_IO())
            }

            public static var timestampResolution: PathconfName? {
                return PathconfName(valuePointer: SP_PC_TIMESTAMP_RESOLUTION())
            }

            public static var vDisable: PathconfName? {
                return PathconfName(valuePointer: SP_PC_VDISABLE())
            }
        }

        public struct SysconfName: RawRepresentable, Hashable, CaseIterable {
            public typealias RawValue = Int
            public typealias AllCases = [SysconfName]

            public let rawValue: RawValue

            private init?(valuePointer: UnsafePointer<Int32>?) {
                guard let value = Int(valuePointer: valuePointer) else {
                    return nil
                }
                self.rawValue = value
            }

            public init?(rawValue: Int) {
                guard let sysconfName = SysconfName.allCases.first(where: { $0.rawValue == rawValue }) else {
                    return nil
                }
                self = sysconfName
            }

            public static let allCases: AllCases = {
                return [
                    v2CBind,
                    v2CDev,
                    v2CharTerm,
                    v2FortDev,
                    v2FortRun,
                    v2LocalDef,
                    v2PBS,
                    v2PBSAccounting,
                    v2PBSCheckpoing,
                    v2PBSLocate,
                    v2PBSMessage,
                    v2PBSTrack,
                    v2SWDev,
                    v2UPE,
                    v2Version,
                    advisoryInfo,
                    aioListIOMax,
                    aioMax,
                    aioPrioDeltaMax,
                    argMax,
                    asynchronousIO,
                    atExitMax,
                    barriers,
                    bcBaseMax,
                    bcDimMax,
                    bcScaleMax,
                    bcStringMax,
                    childMax,
                    clkTck,
                    clockSelection,
                    collWeightsMax,
                    cpuTime,
                    delayTimerMax,
                    exprNestMax,
                    fsync,
                    getgrRSizeMax,
                    getpwRSizeMax,
                    hostNameMax,
                    iovMax,
                    ipv6,
                    jobControl,
                    lineMax,
                    loginNameMax,
                    mappedFiles,
                    memlock,
                    memlockRange,
                    memoryProtection,
                    messagePassing,
                    monotonicClock,
                    mqOpenMax,
                    mqPrioMax,
                    nGropusMax,
                    openMax,
                    page_size, {
                        // The two constants _SC_PAGESIZE and _SC_PAGE_SIZE may be defined to have the same value.
                        // Because of this we want to ensure that only one or the other is returned in order to avoid duplicate rawValues.
                        guard page_size != pageSize else {
                            return nil
                        }
                        return pageSize
                    }(),
                    prioritizedIO,
                    priorityScheduling,
                    rawSockets,
                    reDupMax,
                    readerWriterLocks,
                    realtimeSignals,
                    regexp,
                    rtSigMax,
                    savedIDs,
                    semNSemsMax,
                    semValueMax,
                    semaphores,
                    sharedMemoryObjects,
                    shell,
                    sigqueueMax,
                    spawn,
                    spinLocks,
                    sporadicServer,
                    ssREPLMax,
                    streamMax,
                    symLoopMax,
                    synchronizedIO,
                    threadAttrStackAddr,
                    threadAttrStackSize,
                    threadCPUTime,
                    threadDestructorIterations,
                    threadKeysMax,
                    threadPrioInherit,
                    threadPrioProtect,
                    threadPriorityScheduling,
                    threadProcessShared,
                    threadRobustPrioInherit,
                    threadRobustPrioProtect,
                    threadSafeFunctions,
                    threadSporadicServer,
                    threadStackMin,
                    threadThreadsMax,
                    threads,
                    timeouts,
                    timerMax,
                    timers,
                    trace,
                    traceEventFilter,
                    traceEventNameMax,
                    traceInherit,
                    traceLog,
                    traceNameMax,
                    traceSysMax,
                    traceUserEventMax,
                    ttyNameMax,
                    typedMemoryObjects,
                    tzNameMax,
                    v7ILP32Off32,
                    v7ILP32OffBig,
                    v7LP64Off64,
                    v7LPBigOffBig,
                    v6ILP32Off32,
                    v6ILP32OffBig,
                    v6LP64Off64,
                    v6LPBigOffBig,
                    version,
                    xopenCrypt,
                    xopenEnhI18N,
                    xopenRealtime,
                    xopenRealtimeThreads,
                    xopenShm,
                    xopenStreams,
                    xopenUnix,
                    xopenUUCP,
                    xopenVersion
                ].lazy.compactMap { $0 }
            }()

            public static var v2CBind: SysconfName? {
                return SysconfName(valuePointer: SP_SC_2_C_BIND())
            }

            public static var v2CDev: SysconfName? {
                return SysconfName(valuePointer: SP_SC_2_C_DEV())
            }

            public static var v2CharTerm: SysconfName? {
                return SysconfName(valuePointer: SP_SC_2_CHAR_TERM())
            }

            public static var v2FortDev: SysconfName? {
                return SysconfName(valuePointer: SP_SC_2_FORT_DEV())
            }

            public static var v2FortRun: SysconfName? {
                return SysconfName(valuePointer: SP_SC_2_FORT_RUN())
            }

            public static var v2LocalDef: SysconfName? {
                return SysconfName(valuePointer: SP_SC_2_LOCALEDEF())
            }

            public static var v2PBS: SysconfName? {
                return SysconfName(valuePointer: SP_SC_2_PBS())
            }

            public static var v2PBSAccounting: SysconfName? {
                return SysconfName(valuePointer: SP_SC_2_PBS_ACCOUNTING())
            }

            public static var v2PBSCheckpoing: SysconfName? {
                return SysconfName(valuePointer: SP_SC_2_PBS_CHECKPOINT())
            }

            public static var v2PBSLocate: SysconfName? {
                return SysconfName(valuePointer: SP_SC_2_PBS_LOCATE())
            }

            public static var v2PBSMessage: SysconfName? {
                return SysconfName(valuePointer: SP_SC_2_PBS_MESSAGE())
            }

            public static var v2PBSTrack: SysconfName? {
                return SysconfName(valuePointer: SP_SC_2_PBS_TRACK())
            }

            public static var v2SWDev: SysconfName? {
                return SysconfName(valuePointer: SP_SC_2_SW_DEV())
            }

            public static var v2UPE: SysconfName? {
                return SysconfName(valuePointer: SP_SC_2_UPE())
            }

            public static var v2Version: SysconfName? {
                return SysconfName(valuePointer: SP_SC_2_VERSION())
            }

            public static var advisoryInfo: SysconfName? {
                return SysconfName(valuePointer: SP_SC_ADVISORY_INFO())
            }

            public static var aioListIOMax: SysconfName? {
                return SysconfName(valuePointer: SP_SC_AIO_LISTIO_MAX())
            }

            public static var aioMax: SysconfName? {
                return SysconfName(valuePointer: SP_SC_AIO_MAX())
            }

            public static var aioPrioDeltaMax: SysconfName? {
                return SysconfName(valuePointer: SP_SC_AIO_PRIO_DELTA_MAX())
            }

            public static var argMax: SysconfName? {
                return SysconfName(valuePointer: SP_SC_ARG_MAX())
            }

            public static var asynchronousIO: SysconfName? {
                return SysconfName(valuePointer: SP_SC_ASYNCHRONOUS_IO())
            }

            public static var atExitMax: SysconfName? {
                return SysconfName(valuePointer: SP_SC_ATEXIT_MAX())
            }

            public static var barriers: SysconfName? {
                return SysconfName(valuePointer: SP_SC_BARRIERS())
            }

            public static var bcBaseMax: SysconfName? {
                return SysconfName(valuePointer: SP_SC_BC_BASE_MAX())
            }

            public static var bcDimMax: SysconfName? {
                return SysconfName(valuePointer: SP_SC_BC_DIM_MAX())
            }

            public static var bcScaleMax: SysconfName? {
                return SysconfName(valuePointer: SP_SC_BC_SCALE_MAX())
            }

            public static var bcStringMax: SysconfName? {
                return SysconfName(valuePointer: SP_SC_BC_STRING_MAX())
            }

            public static var childMax: SysconfName? {
                return SysconfName(valuePointer: SP_SC_CHILD_MAX())
            }

            public static var clkTck: SysconfName? {
                return SysconfName(valuePointer: SP_SC_CLK_TCK())
            }

            public static var clockSelection: SysconfName? {
                return SysconfName(valuePointer: SP_SC_CLOCK_SELECTION())
            }

            public static var collWeightsMax: SysconfName? {
                return SysconfName(valuePointer: SP_SC_COLL_WEIGHTS_MAX())
            }

            public static var cpuTime: SysconfName? {
                return SysconfName(valuePointer: SP_SC_CPUTIME())
            }

            public static var delayTimerMax: SysconfName? {
                return SysconfName(valuePointer: SP_SC_DELAYTIMER_MAX())
            }

            public static var exprNestMax: SysconfName? {
                return SysconfName(valuePointer: SP_SC_EXPR_NEST_MAX())
            }

            public static var fsync: SysconfName? {
                return SysconfName(valuePointer: SP_SC_FSYNC())
            }

            public static var getgrRSizeMax: SysconfName? {
                return SysconfName(valuePointer: SP_SC_GETGR_R_SIZE_MAX())
            }

            public static var getpwRSizeMax: SysconfName? {
                return SysconfName(valuePointer: SP_SC_GETPW_R_SIZE_MAX())
            }

            public static var hostNameMax: SysconfName? {
                return SysconfName(valuePointer: SP_SC_HOST_NAME_MAX())
            }

            public static var iovMax: SysconfName? {
                return SysconfName(valuePointer: SP_SC_IOV_MAX())
            }

            public static var ipv6: SysconfName? {
                return SysconfName(valuePointer: SP_SC_IPV6())
            }

            public static var jobControl: SysconfName? {
                return SysconfName(valuePointer: SP_SC_JOB_CONTROL())
            }

            public static var lineMax: SysconfName? {
                return SysconfName(valuePointer: SP_SC_LINE_MAX())
            }

            public static var loginNameMax: SysconfName? {
                return SysconfName(valuePointer: SP_SC_LOGIN_NAME_MAX())
            }

            public static var mappedFiles: SysconfName? {
                return SysconfName(valuePointer: SP_SC_MAPPED_FILES())
            }

            public static var memlock: SysconfName? {
                return SysconfName(valuePointer: SP_SC_MEMLOCK())
            }

            public static var memlockRange: SysconfName? {
                return SysconfName(valuePointer: SP_SC_MEMLOCK_RANGE())
            }

            public static var memoryProtection: SysconfName? {
                return SysconfName(valuePointer: SP_SC_MEMORY_PROTECTION())
            }

            public static var messagePassing: SysconfName? {
                return SysconfName(valuePointer: SP_SC_MESSAGE_PASSING())
            }

            public static var monotonicClock: SysconfName? {
                return SysconfName(valuePointer: SP_SC_MONOTONIC_CLOCK())
            }

            public static var mqOpenMax: SysconfName? {
                return SysconfName(valuePointer: SP_SC_MQ_OPEN_MAX())
            }

            public static var mqPrioMax: SysconfName? {
                return SysconfName(valuePointer: SP_SC_MQ_PRIO_MAX())
            }

            public static var nGropusMax: SysconfName? {
                return SysconfName(valuePointer: SP_SC_NGROUPS_MAX())
            }

            public static var openMax: SysconfName? {
                return SysconfName(valuePointer: SP_SC_OPEN_MAX())
            }

            public static var page_size: SysconfName? {
                return SysconfName(valuePointer: SP_SC_PAGE_SIZE())
            }

            public static var pageSize: SysconfName? {
                return SysconfName(valuePointer: SP_SC_PAGESIZE())
            }

            public static var prioritizedIO: SysconfName? {
                return SysconfName(valuePointer: SP_SC_PRIORITIZED_IO())
            }

            public static var priorityScheduling: SysconfName? {
                return SysconfName(valuePointer: SP_SC_PRIORITY_SCHEDULING())
            }

            public static var rawSockets: SysconfName? {
                return SysconfName(valuePointer: SP_SC_RAW_SOCKETS())
            }

            public static var reDupMax: SysconfName? {
                return SysconfName(valuePointer: SP_SC_RE_DUP_MAX())
            }

            public static var readerWriterLocks: SysconfName? {
                return SysconfName(valuePointer: SP_SC_READER_WRITER_LOCKS())
            }

            public static var realtimeSignals: SysconfName? {
                return SysconfName(valuePointer: SP_SC_REALTIME_SIGNALS())
            }

            public static var regexp: SysconfName? {
                return SysconfName(valuePointer: SP_SC_REGEXP())
            }

            public static var rtSigMax: SysconfName? {
                return SysconfName(valuePointer: SP_SC_RTSIG_MAX())
            }

            public static var savedIDs: SysconfName? {
                return SysconfName(valuePointer: SP_SC_SAVED_IDS())
            }

            public static var semNSemsMax: SysconfName? {
                return SysconfName(valuePointer: SP_SC_SEM_NSEMS_MAX())
            }

            public static var semValueMax: SysconfName? {
                return SysconfName(valuePointer: SP_SC_SEM_VALUE_MAX())
            }

            public static var semaphores: SysconfName? {
                return SysconfName(valuePointer: SP_SC_SEMAPHORES())
            }

            public static var sharedMemoryObjects: SysconfName? {
                return SysconfName(valuePointer: SP_SC_SHARED_MEMORY_OBJECTS())
            }

            public static var shell: SysconfName? {
                return SysconfName(valuePointer: SP_SC_SHELL())
            }

            public static var sigqueueMax: SysconfName? {
                return SysconfName(valuePointer: SP_SC_SIGQUEUE_MAX())
            }

            public static var spawn: SysconfName? {
                return SysconfName(valuePointer: SP_SC_SPAWN())
            }

            public static var spinLocks: SysconfName? {
                return SysconfName(valuePointer: SP_SC_SPIN_LOCKS())
            }

            public static var sporadicServer: SysconfName? {
                return SysconfName(valuePointer: SP_SC_SPORADIC_SERVER())
            }

            public static var ssREPLMax: SysconfName? {
                return SysconfName(valuePointer: SP_SC_SS_REPL_MAX())
            }

            public static var streamMax: SysconfName? {
                return SysconfName(valuePointer: SP_SC_STREAM_MAX())
            }

            public static var symLoopMax: SysconfName? {
                return SysconfName(valuePointer: SP_SC_SYMLOOP_MAX())
            }

            public static var synchronizedIO: SysconfName? {
                return SysconfName(valuePointer: SP_SC_SYNCHRONIZED_IO())
            }

            public static var threadAttrStackAddr: SysconfName? {
                return SysconfName(valuePointer: SP_SC_THREAD_ATTR_STACKADDR())
            }

            public static var threadAttrStackSize: SysconfName? {
                return SysconfName(valuePointer: SP_SC_THREAD_ATTR_STACKSIZE())
            }

            public static var threadCPUTime: SysconfName? {
                return SysconfName(valuePointer: SP_SC_THREAD_CPUTIME())
            }

            public static var threadDestructorIterations: SysconfName? {
                return SysconfName(valuePointer: SP_SC_THREAD_DESTRUCTOR_ITERATIONS())
            }

            public static var threadKeysMax: SysconfName? {
                return SysconfName(valuePointer: SP_SC_THREAD_KEYS_MAX())
            }

            public static var threadPrioInherit: SysconfName? {
                return SysconfName(valuePointer: SP_SC_THREAD_PRIO_INHERIT())
            }

            public static var threadPrioProtect: SysconfName? {
                return SysconfName(valuePointer: SP_SC_THREAD_PRIO_PROTECT())
            }

            public static var threadPriorityScheduling: SysconfName? {
                return SysconfName(valuePointer: SP_SC_THREAD_PRIORITY_SCHEDULING())
            }

            public static var threadProcessShared: SysconfName? {
                return SysconfName(valuePointer: SP_SC_THREAD_PROCESS_SHARED())
            }

            public static var threadRobustPrioInherit: SysconfName? {
                return SysconfName(valuePointer: SP_SC_THREAD_ROBUST_PRIO_INHERIT())
            }

            public static var threadRobustPrioProtect: SysconfName? {
                return SysconfName(valuePointer: SP_SC_THREAD_ROBUST_PRIO_PROTECT())
            }

            public static var threadSafeFunctions: SysconfName? {
                return SysconfName(valuePointer: SP_SC_THREAD_SAFE_FUNCTIONS())
            }

            public static var threadSporadicServer: SysconfName? {
                return SysconfName(valuePointer: SP_SC_THREAD_SPORADIC_SERVER())
            }

            public static var threadStackMin: SysconfName? {
                return SysconfName(valuePointer: SP_SC_THREAD_STACK_MIN())
            }

            public static var threadThreadsMax: SysconfName? {
                return SysconfName(valuePointer: SP_SC_THREAD_THREADS_MAX())
            }

            public static var threads: SysconfName? {
                return SysconfName(valuePointer: SP_SC_THREADS())
            }

            public static var timeouts: SysconfName? {
                return SysconfName(valuePointer: SP_SC_TIMEOUTS())
            }

            public static var timerMax: SysconfName? {
                return SysconfName(valuePointer: SP_SC_TIMER_MAX())
            }

            public static var timers: SysconfName? {
                return SysconfName(valuePointer: SP_SC_TIMERS())
            }

            public static var trace: SysconfName? {
                return SysconfName(valuePointer: SP_SC_TRACE())
            }

            public static var traceEventFilter: SysconfName? {
                return SysconfName(valuePointer: SP_SC_TRACE_EVENT_FILTER())
            }

            public static var traceEventNameMax: SysconfName? {
                return SysconfName(valuePointer: SP_SC_TRACE_EVENT_NAME_MAX())
            }

            public static var traceInherit: SysconfName? {
                return SysconfName(valuePointer: SP_SC_TRACE_INHERIT())
            }

            public static var traceLog: SysconfName? {
                return SysconfName(valuePointer: SP_SC_TRACE_LOG())
            }

            public static var traceNameMax: SysconfName? {
                return SysconfName(valuePointer: SP_SC_TRACE_NAME_MAX())
            }

            public static var traceSysMax: SysconfName? {
                return SysconfName(valuePointer: SP_SC_TRACE_SYS_MAX())
            }

            public static var traceUserEventMax: SysconfName? {
                return SysconfName(valuePointer: SP_SC_TRACE_USER_EVENT_MAX())
            }

            public static var ttyNameMax: SysconfName? {
                return SysconfName(valuePointer: SP_SC_TTY_NAME_MAX())
            }

            public static var typedMemoryObjects: SysconfName? {
                return SysconfName(valuePointer: SP_SC_TYPED_MEMORY_OBJECTS())
            }

            public static var tzNameMax: SysconfName? {
                return SysconfName(valuePointer: SP_SC_TZNAME_MAX())
            }

            public static var v7ILP32Off32: SysconfName? {
                return SysconfName(valuePointer: SP_SC_V7_ILP32_OFF32())
            }

            public static var v7ILP32OffBig: SysconfName? {
                return SysconfName(valuePointer: SP_SC_V7_ILP32_OFFBIG())
            }

            public static var v7LP64Off64: SysconfName? {
                return SysconfName(valuePointer: SP_SC_V7_LP64_OFF64())
            }

            public static var v7LPBigOffBig: SysconfName? {
                return SysconfName(valuePointer: SP_SC_V7_LPBIG_OFFBIG())
            }

            public static var v6ILP32Off32: SysconfName? {
                return SysconfName(valuePointer: SP_SC_V6_ILP32_OFF32())
            }

            public static var v6ILP32OffBig: SysconfName? {
                return SysconfName(valuePointer: SP_SC_V6_ILP32_OFFBIG())
            }

            public static var v6LP64Off64: SysconfName? {
                return SysconfName(valuePointer: SP_SC_V6_LP64_OFF64())
            }

            public static var v6LPBigOffBig: SysconfName? {
                return SysconfName(valuePointer: SP_SC_V6_LPBIG_OFFBIG())
            }

            public static var version: SysconfName? {
                return SysconfName(valuePointer: SP_SC_VERSION())
            }

            public static var xopenCrypt: SysconfName? {
                return SysconfName(valuePointer: SP_SC_XOPEN_CRYPT())
            }

            public static var xopenEnhI18N: SysconfName? {
                return SysconfName(valuePointer: SP_SC_XOPEN_ENH_I18N())
            }

            public static var xopenRealtime: SysconfName? {
                return SysconfName(valuePointer: SP_SC_XOPEN_REALTIME())
            }

            public static var xopenRealtimeThreads: SysconfName? {
                return SysconfName(valuePointer: SP_SC_XOPEN_REALTIME_THREADS())
            }

            public static var xopenShm: SysconfName? {
                return SysconfName(valuePointer: SP_SC_XOPEN_SHM())
            }

            public static var xopenStreams: SysconfName? {
                return SysconfName(valuePointer: SP_SC_XOPEN_STREAMS())
            }

            public static var xopenUnix: SysconfName? {
                return SysconfName(valuePointer: SP_SC_XOPEN_UNIX())
            }

            public static var xopenUUCP: SysconfName? {
                return SysconfName(valuePointer: SP_SC_XOPEN_UUCP())
            }

            public static var xopenVersion: SysconfName? {
                return SysconfName(valuePointer: SP_SC_XOPEN_VERSION())
            }
        }
    }

    public enum StandardFileStreams: Int32, CaseIterable {
        case `in`
        case out
        case error

        public var rawValue: RawValue {
            switch self {
            case .in:
                return STDIN_FILENO
            case .out:
                return STDOUT_FILENO
            case .error:
                return STDERR_FILENO
            }
        }
    }

    public var disable: Character? {
        guard let valuePointer = SP_POSIX_VDISABLE() else {
            return nil
        }
        return Character(Unicode.Scalar(valuePointer.pointee))
    }
}

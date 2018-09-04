//
//  SwiftyPOSIX_unistd.c
//  SwiftyPOSIX iOS
//
//  Created by Braden Scothern on 9/3/18.
//  Copyright © 2018 Braden Scothern. All rights reserved.
//

#include "include/SP_unistd.h"
#include <unistd.h>

//MARK:- Version Test Macros

long SP_POSIX_VERSION() {
    return _POSIX_VERSION;
}

const int* SP_POSIX_SUBPROFILE() {
#if _POSIX_SUBPROFILE
    const static int posix_subprofile = _POSIX_SUBPROFILE;
    return &posix_subprofile;
#else
    return NULL;
#endif
}

long SP_POSIX2_VERSION() {
#if !_POSIX_SUBPROFILE
    return _POSIX2_VERSION;
#else
    return -1;
#endif
}

const int* SP_XOPEN_VERSION() {
#if _XOPEN_VERSION
    const static int xopen_version = _XOPEN_VERSION;
    return &xopen_version;
#else
    return NULL;
#endif
}

//MARK:- Constants for Options and Option Groups

//MARK: _POSIX_ defines
int SP_POSIX_ADVISORY_INFO() {
#if _POSIX_ADVISORY_INFO
    return _POSIX_ADVISORY_INFO;
#else
    return -1;
#endif
}

int SP_POSIX_ASYNCHRONOUS_IO() {
#if _POSIX_ASYNCHRONOUS_IO
    return _POSIX_ASYNCHRONOUS_IO;
#else
    #error "_POSIX_ASYNCHRONOUS_IO: This symbol shall always be set to the value 200809L."
#endif
}

int SP_POSIX_BARRIERS() {
#if _POSIX_BARRIERS
    return _POSIX_BARRIERS;
#else
    #error "_POSIX_BARRIERS: This symbol shall always be set to the value 200809L."
#endif
}

int SP_POSIX_CHOWN_RESTRICTED() {
#if _POSIX_CHOWN_RESTRICTED
    return _POSIX_CHOWN_RESTRICTED;
#else
    #error "_POSIX_CHOWN_RESTRICTED: This symbol shall be defined with a value other than -1."
#endif
}

int SP_POSIX_CLOCK_SELECTION() {
#if _POSIX_CLOCK_SELECTION
    return _POSIX_CLOCK_SELECTION;
#else
    #error "_POSIX_CLOCK_SELECTION: This symbol shall always be set to the value 200809L."
#endif
}

int SP_POSIX_CPUTIME() {
#if _POSIX_CPUTIME
    return _POSIX_CPUTIME;
#else
    return -1;
#endif
}

int SP_POSIX_FSYNC() {
#if _POSIX_FSYNC
    return _POSIX_FSYNC;
#else
    return -1;
#endif
}

int SP_POSIX_IPV6() {
#if _POSIX_IPV6
    return _POSIX_IPV6;
#else
    return -1;
#endif
}

int SP_POSIX_JOB_CONTROL() {
#if _POSIX_JOB_CONTROL
    return _POSIX_JOB_CONTROL;
#else
    #error "_POSIX_JOB_CONTROL: This symbol shall always be set to a value greater than zero."
#endif
}

int SP_POSIX_MAPPED_FILES() {
#if _POSIX_MAPPED_FILES
    return _POSIX_MAPPED_FILES;
#else
    #error "_POSIX_MAPPED_FILES: This symbol shall always be set to the value 200809L."
#endif
}

int SP_POSIX_MEMLOCK() {
#if _POSIX_MEMLOCK
    return _POSIX_MEMLOCK;
#else
    return -1;
#endif
}

int SP_POSIX_MEMLOCK_RANGE() {
#if _POSIX_MEMLOCK_RANGE
    return _POSIX_MEMLOCK_RANGE;
#else
    return -1;
#endif
}

int SP_POSIX_MEMORY_PROTECTION() {
#if _POSIX_MEMORY_PROTECTION
    return _POSIX_MEMORY_PROTECTION;
#else
    #error "_POSIX_MEMORY_PROTECTION: This symbol shall always be set to the value 200809L."
#endif
}

int SP_POSIX_MESSAGE_PASSING() {
#if _POSIX_MESSAGE_PASSING
    return _POSIX_MESSAGE_PASSING;
#else
    return -1;
#endif
}

int SP_POSIX_MONOTONIC_CLOCK() {
#if _POSIX_MONOTONIC_CLOCK
    return _POSIX_MONOTONIC_CLOCK;
#else
    return -1;
#endif
}

int SP_POSIX_NO_TRUNC() {
#if _POSIX_NO_TRUNC
    return _POSIX_NO_TRUNC;
#else
    #error "_POSIX_NO_TRUNC: This symbol shall be defined with a value other than -1."
#endif
}

int SP_POSIX_PRIORITIZED_IO() {
#if _POSIX_PRIORITIZED_IO
    return _POSIX_PRIORITIZED_IO;
#else
    return -1;
#endif
}

int SP_POSIX_PRIORITY_SCHEDULING() {
#if _POSIX_PRIORITY_SCHEDULING
    return _POSIX_PRIORITY_SCHEDULING;
#else
    return -1;
#endif
}

int SP_POSIX_RAW_SOCKETS() {
#if _POSIX_RAW_SOCKETS
    return _POSIX_RAW_SOCKETS;
#else
    return -1;
#endif
}

int SP_POSIX_READER_WRITER_LOCKS() {
#if _POSIX_READER_WRITER_LOCKS
    return _POSIX_READER_WRITER_LOCKS;
#else
    #error "_POSIX_READER_WRITER_LOCKS: This symbol shall always be set to the value 200809L."
#endif
}

int SP_POSIX_REALTIME_SIGNALS() {
#if _POSIX_REALTIME_SIGNALS
    return _POSIX_REALTIME_SIGNALS;
#else
    #error "_POSIX_REALTIME_SIGNALS: This symbol shall always be set to the value 200809L."
#endif
}

int SP_POSIX_REGEXP() {
#if _POSIX_REGEXP
    return _POSIX_REGEXP;
#else
    #error "_POSIX_REGEXP: This symbol shall always be set to a value greater than zero."
#endif
}

int SP_POSIX_SAVED_IDS() {
#if _POSIX_SAVED_IDS
    return _POSIX_SAVED_IDS;
#else
    #error "_POSIX_SAVED_IDS: This symbol shall always be set to a value greater than zero."
#endif
}

int SP_POSIX_SEMAPHORES() {
#if _POSIX_SEMAPHORES
    return _POSIX_SEMAPHORES;
#else
    #error "_POSIX_SEMAPHORES: This symbol shall always be set to the value 200809L."
#endif
}

int SP_POSIX_SHARED_MEMORY_OBJECTS() {
#if _POSIX_SHARED_MEMORY_OBJECTS
    return _POSIX_SHARED_MEMORY_OBJECTS;
#else
    return -1;
#endif
}

int SP_POSIX_SHELL() {
#if _POSIX_SHELL
    return _POSIX_SHELL;
#else
    #error "_POSIX_SHELL: This symbol shall always be set to a value greater than zero."
#endif
}

int SP_POSIX_SPAWN() {
#if _POSIX_SPAWN
    return _POSIX_SPAWN;
#else
    return -1;
#endif
}

int SP_POSIX_SPIN_LOCKS() {
#if _POSIX_SPIN_LOCKS
    return _POSIX_SPIN_LOCKS;
#else
    #error "_POSIX_SPIN_LOCKS: This symbol shall always be set to the value 200809L."
#endif
}

int SP_POSIX_SPORADIC_SERVER() {
#if _POSIX_SPORADIC_SERVER
    return _POSIX_SPORADIC_SERVER;
#else
    return -1;
#endif
}

int SP_POSIX_SYNCHRONIZED_IO() {
#if _POSIX_SYNCHRONIZED_IO
    return _POSIX_SYNCHRONIZED_IO;
#else
    return -1;
#endif
}

int SP_POSIX_THREAD_ATTR_STACKADDR() {
#if _POSIX_THREAD_ATTR_STACKADDR
    return _POSIX_THREAD_ATTR_STACKADDR;
#else
    return -1;
#endif
}

int SP_POSIX_THREAD_ATTR_STACKSIZE() {
#if _POSIX_THREAD_ATTR_STACKSIZE
    return _POSIX_THREAD_ATTR_STACKSIZE;
#else
    return -1;
#endif
}

int SP_POSIX_THREAD_CPUTIME() {
#if _POSIX_THREAD_CPUTIME
    return _POSIX_THREAD_CPUTIME;
#else
    return -1;
#endif
}

int SP_POSIX_THREAD_PRIO_INHERIT() {
#if _POSIX_THREAD_PRIO_INHERIT
    return _POSIX_THREAD_PRIO_INHERIT;
#else
    return -1;
#endif
}

int SP_POSIX_THREAD_PRIO_PROTECT() {
#if _POSIX_THREAD_PRIO_PROTECT
    return _POSIX_THREAD_PRIO_PROTECT;
#else
    return -1;
#endif
}

int SP_POSIX_THREAD_PRIORITY_SCHEDULING() {
#if _POSIX_THREAD_PRIORITY_SCHEDULING
    return _POSIX_THREAD_PRIORITY_SCHEDULING;
#else
    return -1;
#endif
}

int SP_POSIX_THREAD_PROCESS_SHARED() {
#if _POSIX_THREAD_PROCESS_SHARED
    return _POSIX_THREAD_PROCESS_SHARED;
#else
    return -1;
#endif
}

int SP_POSIX_THREAD_ROBUST_PRIO_INHERIT() {
#if _POSIX_THREAD_ROBUST_PRIO_INHERIT
    return _POSIX_THREAD_ROBUST_PRIO_INHERIT;
#else
    return -1;
#endif
}

int SP_POSIX_THREAD_ROBUST_PRIO_PROTECT() {
#if _POSIX_THREAD_ROBUST_PRIO_PROTECT
    return _POSIX_THREAD_ROBUST_PRIO_PROTECT;
#else
    return -1;
#endif
}

int SP_POSIX_THREAD_SAFE_FUNCTIONS() {
#if _POSIX_THREAD_SAFE_FUNCTIONS
    return _POSIX_THREAD_SAFE_FUNCTIONS;
#else
    return -1;
#endif
}

int SP_POSIX_THREAD_SPORADIC_SERVER() {
#if _POSIX_THREAD_SPORADIC_SERVER
    return _POSIX_THREAD_SPORADIC_SERVER;
#else
    return -1;
#endif
}

int SP_POSIX_THREADS() {
#if _POSIX_THREADS
    return _POSIX_THREADS;
#else
    #error "_POSIX_THREADS: This symbol shall always be set to the value 200809L."
#endif
}

int SP_POSIX_TIMEOUTS() {
#if _POSIX_TIMEOUTS
    return _POSIX_TIMEOUTS;
#else
    #error "_POSIX_TIMEOUTS: This symbol shall always be set to the value 200809L."
#endif
}

int SP_POSIX_TIMERS() {
#if _POSIX_TIMERS
    return _POSIX_TIMERS;
#else
    #error "_POSIX_TIMERS: This symbol shall always be set to the value 200809L."
#endif
}

int SP_POSIX_TRACE() {
#if _POSIX_TRACE
    return _POSIX_TRACE;
#else
    return -1;
#endif
}

int SP_POSIX_TRACE_EVENT_FILTER() {
#if _POSIX_TRACE_EVENT_FILTER
    return _POSIX_TRACE_EVENT_FILTER;
#else
    return -1;
#endif
}

int SP_POSIX_TRACE_INHERIT() {
#if _POSIX_TRACE_INHERIT
    return _POSIX_TRACE_INHERIT;
#else
    return -1;
#endif
}

int SP_POSIX_TRACE_LOG() {
#if _POSIX_TRACE_LOG
    return _POSIX_TRACE_LOG;
#else
    return -1;
#endif
}

int SP_POSIX_TYPED_MEMORY_OBJECTS() {
#if _POSIX_TYPED_MEMORY_OBJECTS
    return _POSIX_TYPED_MEMORY_OBJECTS;
#else
    return -1;
#endif
}

//MARK: POSIX V6
int SP_POSIX_V6_ILP32_OFF32() {
#if _POSIX_V6_ILP32_OFF32
    return _POSIX_V6_ILP32_OFF32;
#else
    return -1;
#endif
}

int SP_POSIX_V6_ILP32_OFFBIG() {
#if _POSIX_V6_ILP32_OFFBIG
    return _POSIX_V6_ILP32_OFFBIG;
#else
    return -1;
#endif
}

int SP_POSIX_V6_LP64_OFF64() {
#if _POSIX_V6_LP64_OFF64
    return _POSIX_V6_LP64_OFF64;
#else
    return -1;
#endif
}

int SP_POSIX_V6_LPBIG_OFFBIG() {
#if _POSIX_V6_LPBIG_OFFBIG
    return _POSIX_V6_LPBIG_OFFBIG;
#else
    return -1;
#endif
}

//MARK: POSIX V7
int SP_POSIX_V7_ILP32_OFF32() {
#if _POSIX_V7_ILP32_OFF32
    return _POSIX_V7_ILP32_OFF32;
#else
    return -1;
#endif
}

int SP_POSIX_V7_ILP32_OFFBIG() {
#if _POSIX_V7_ILP32_OFFBIG
    return _POSIX_V7_ILP32_OFFBIG;
#else
    return -1;
#endif
}

int SP_POSIX_V7_LP64_OFF64() {
#if _POSIX_V7_LP64_OFF64
    return _POSIX_V7_LP64_OFF64;
#else
    return -1;
#endif
}

int SP_POSIX_V7_LPBIG_OFFBIG() {
#if _POSIX_V7_LPBIG_OFFBIG
    return _POSIX_V7_LPBIG_OFFBIG;
#else
    return -1;
#endif
}

//MARK: POSIX2
int SP_POSIX2_C_BIND() {
#if _POSIX2_C_BIND
    return _POSIX2_C_BIND;
#else
    return -1;
#endif
}

int SP_POSIX2_C_DEV() {
#if _POSIX2_C_DEV
    return _POSIX2_C_DEV;
#else
    return -1;
#endif
}

int SP_POSIX2_CHAR_TERM() {
#if _POSIX2_CHAR_TERM
    return _POSIX2_CHAR_TERM;
#else
    return -1;
#endif
}

int SP_POSIX2_FORT_DEV() {
#if _POSIX2_FORT_DEV
    return _POSIX2_FORT_DEV;
#else
    return -1;
#endif
}

int SP_POSIX2_FORT_RUN() {
#if _POSIX2_FORT_RUN
    return _POSIX2_FORT_RUN;
#else
    return -1;
#endif
}

int SP_POSIX2_LOCALEDEF() {
#if _POSIX2_LOCALEDEF
    return _POSIX2_LOCALEDEF;
#else
    return -1;
#endif
}

int SP_POSIX2_PBS() {
#if _POSIX2_PBS
    return _POSIX2_PBS;
#else
    return -1;
#endif
}

int SP_POSIX2_PBS_ACCOUNTING() {
#if _POSIX2_PBS_ACCOUNTING
    return _POSIX2_PBS_ACCOUNTING;
#else
    return -1;
#endif
}

int SP_POSIX2_PBS_CHECKPOINT() {
#if _POSIX2_PBS_CHECKPOINT
    return _POSIX2_PBS_CHECKPOINT;
#else
    return -1;
#endif
}

int SP_POSIX2_PBS_LOCATE() {
#if _POSIX2_PBS_LOCATE
    return _POSIX2_PBS_LOCATE;
#else
    return -1;
#endif
}

int SP_POSIX2_PBS_MESSAGE() {
#if _POSIX2_PBS_MESSAGE
    return _POSIX2_PBS_MESSAGE;
#else
    return -1;
#endif
}

int SP_POSIX2_PBS_TRACK() {
#if _POSIX2_PBS_TRACK
    return _POSIX2_PBS_TRACK;
#else
    return -1;
#endif
}

int SP_POSIX2_SW_DEV() {
#if _POSIX2_SW_DEV
    return _POSIX2_SW_DEV;
#else
    return -1;
#endif
}

int SP_POSIX2_UPE() {
#if _POSIX2_UPE
    return _POSIX2_UPE;
#else
    return -1;
#endif
}

//MARK: XOPEN
int SP_XOPEN_CRYPT() {
#if _XOPEN_CRYPT
    return _XOPEN_CRYPT;
#else
    return -1;
#endif
}

int SP_XOPEN_ENH_I18N() {
#if _XOPEN_ENH_I18N
    return _XOPEN_ENH_I18N;
#else
    return -1;
#endif
}

int SP_XOPEN_REALTIME() {
#if _XOPEN_REALTIME
    return _XOPEN_REALTIME;
#else
    return -1;
#endif
}

int SP_XOPEN_REALTIME_THREADS() {
#if _XOPEN_REALTIME_THREADS
    return _XOPEN_REALTIME_THREADS;
#else
    return -1;
#endif
}

int SP_XOPEN_SHM() {
#if _XOPEN_SHM
    return _XOPEN_SHM;
#else
    return -1;
#endif
}

int SP_XOPEN_STREAMS() {
#if _XOPEN_STREAMS
    return _XOPEN_STREAMS;
#else
    return -1;
#endif
}

int SP_XOPEN_UNIX() {
#if _XOPEN_UNIX
    return _XOPEN_UNIX;
#else
    return -1;
#endif
}

int SP_XOPEN_UUCP() {
#if _XOPEN_UUCP
    return _XOPEN_UUCP;
#else
    return -1;
#endif
}

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

const long* SP_POSIX2_VERSION() {
#if !_POSIX_SUBPROFILE
    const static long value = _POSIX2_VERSION;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_SUBPROFILE() {
#if _POSIX_SUBPROFILE
    const static int value = _POSIX_SUBPROFILE;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_XOPEN_VERSION() {
#if _XOPEN_VERSION
    const static int value = _XOPEN_VERSION;
    return &value;
#else
    return NULL;
#endif
}

//MARK:- Constants for Options and Option Groups
//MARK: _POSIX_ defines
const int* SP_POSIX_ADVISORY_INFO() {
#if _POSIX_ADVISORY_INFO
    const static int value = _POSIX_ADVISORY_INFO;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_ASYNCHRONOUS_IO() {
#if _POSIX_ASYNCHRONOUS_IO
    const static int value = _POSIX_ASYNCHRONOUS_IO;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_BARRIERS() {
#if _POSIX_BARRIERS
    const static int value = _POSIX_BARRIERS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_CHOWN_RESTRICTED() {
#if _POSIX_CHOWN_RESTRICTED
    const static int value = _POSIX_CHOWN_RESTRICTED;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_CLOCK_SELECTION() {
#if _POSIX_CLOCK_SELECTION
    const static int value = _POSIX_CLOCK_SELECTION;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_CPUTIME() {
#if _POSIX_CPUTIME
    const static int value = _POSIX_CPUTIME;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_FSYNC() {
#if _POSIX_FSYNC
    const static int value = _POSIX_FSYNC;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_IPV6() {
#if _POSIX_IPV6
    const static int value = _POSIX_IPV6;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_JOB_CONTROL() {
#if _POSIX_JOB_CONTROL
    const static int value = _POSIX_JOB_CONTROL;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_MAPPED_FILES() {
#if _POSIX_MAPPED_FILES
    const static int value = _POSIX_MAPPED_FILES;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_MEMLOCK() {
#if _POSIX_MEMLOCK
    const static int value = _POSIX_MEMLOCK;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_MEMLOCK_RANGE() {
#if _POSIX_MEMLOCK_RANGE
    const static int value = _POSIX_MEMLOCK_RANGE;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_MEMORY_PROTECTION() {
#if _POSIX_MEMORY_PROTECTION
    const static int value = _POSIX_MEMORY_PROTECTION;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_MESSAGE_PASSING() {
#if _POSIX_MESSAGE_PASSING
    const static int value = _POSIX_MESSAGE_PASSING;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_MONOTONIC_CLOCK() {
#if _POSIX_MONOTONIC_CLOCK
    const static int value = _POSIX_MONOTONIC_CLOCK;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_NO_TRUNC() {
#if _POSIX_NO_TRUNC
    const static int value = _POSIX_NO_TRUNC;
    return &value;
#else
        return NULL;
#endif
}

const int* SP_POSIX_PRIORITIZED_IO() {
#if _POSIX_PRIORITIZED_IO
    const static int value = _POSIX_PRIORITIZED_IO;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_PRIORITY_SCHEDULING() {
#if _POSIX_PRIORITY_SCHEDULING
    const static int value = _POSIX_PRIORITY_SCHEDULING;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_RAW_SOCKETS() {
#if _POSIX_RAW_SOCKETS
    const static int value = _POSIX_RAW_SOCKETS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_READER_WRITER_LOCKS() {
#if _POSIX_READER_WRITER_LOCKS
    const static int value = _POSIX_READER_WRITER_LOCKS;
    return &value;
#else
        return NULL;
#endif
}

const int* SP_POSIX_REALTIME_SIGNALS() {
#if _POSIX_REALTIME_SIGNALS
    const static int value = _POSIX_REALTIME_SIGNALS;
    return &value;
#else
        return NULL;
#endif
}

const int* SP_POSIX_REGEXP() {
#if _POSIX_REGEXP
    const static int value = _POSIX_REGEXP;
    return &value;
#else
        return NULL;
#endif
}

const int* SP_POSIX_SAVED_IDS() {
#if _POSIX_SAVED_IDS
    const static int value = _POSIX_SAVED_IDS;
    return &value;
#else
        return NULL;
#endif
}

const int* SP_POSIX_SEMAPHORES() {
#if _POSIX_SEMAPHORES
    const static int value = _POSIX_SEMAPHORES;
    return &value;
#else
        return NULL;
#endif
}

const int* SP_POSIX_SHARED_MEMORY_OBJECTS() {
#if _POSIX_SHARED_MEMORY_OBJECTS
    const static int value = _POSIX_SHARED_MEMORY_OBJECTS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_SHELL() {
#if _POSIX_SHELL
    const static int value = _POSIX_SHELL;
    return &value;
#else
        return NULL;
#endif
}

const int* SP_POSIX_SPAWN() {
#if _POSIX_SPAWN
    const static int value = _POSIX_SPAWN;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_SPIN_LOCKS() {
#if _POSIX_SPIN_LOCKS
    const static int value = _POSIX_SPIN_LOCKS;
    return &value;
#else
        return NULL;
#endif
}

const int* SP_POSIX_SPORADIC_SERVER() {
#if _POSIX_SPORADIC_SERVER
    const static int value = _POSIX_SPORADIC_SERVER;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_SYNCHRONIZED_IO() {
#if _POSIX_SYNCHRONIZED_IO
    const static int value = _POSIX_SYNCHRONIZED_IO;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_THREAD_ATTR_STACKADDR() {
#if _POSIX_THREAD_ATTR_STACKADDR
    const static int value = _POSIX_THREAD_ATTR_STACKADDR;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_THREAD_ATTR_STACKSIZE() {
#if _POSIX_THREAD_ATTR_STACKSIZE
    const static int value = _POSIX_THREAD_ATTR_STACKSIZE;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_THREAD_CPUTIME() {
#if _POSIX_THREAD_CPUTIME
    const static int value = _POSIX_THREAD_CPUTIME;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_THREAD_PRIO_INHERIT() {
#if _POSIX_THREAD_PRIO_INHERIT
    const static int value = _POSIX_THREAD_PRIO_INHERIT;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_THREAD_PRIO_PROTECT() {
#if _POSIX_THREAD_PRIO_PROTECT
    const static int value = _POSIX_THREAD_PRIO_PROTECT;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_THREAD_PRIORITY_SCHEDULING() {
#if _POSIX_THREAD_PRIORITY_SCHEDULING
    const static int value = _POSIX_THREAD_PRIORITY_SCHEDULING;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_THREAD_PROCESS_SHARED() {
#if _POSIX_THREAD_PROCESS_SHARED
    const static int value = _POSIX_THREAD_PROCESS_SHARED;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_THREAD_ROBUST_PRIO_INHERIT() {
#if _POSIX_THREAD_ROBUST_PRIO_INHERIT
    const static int value = _POSIX_THREAD_ROBUST_PRIO_INHERIT;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_THREAD_ROBUST_PRIO_PROTECT() {
#if _POSIX_THREAD_ROBUST_PRIO_PROTECT
    const static int value = _POSIX_THREAD_ROBUST_PRIO_PROTECT;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_THREAD_SAFE_FUNCTIONS() {
#if _POSIX_THREAD_SAFE_FUNCTIONS
    const static int value = _POSIX_THREAD_SAFE_FUNCTIONS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_THREAD_SPORADIC_SERVER() {
#if _POSIX_THREAD_SPORADIC_SERVER
    const static int value = _POSIX_THREAD_SPORADIC_SERVER;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_THREADS() {
#if _POSIX_THREADS
    const static int value = _POSIX_THREADS;
    return &value;
#else
        return NULL;
#endif
}

const int* SP_POSIX_TIMEOUTS() {
#if _POSIX_TIMEOUTS
    const static int value = _POSIX_TIMEOUTS;
    return &value;
#else
        return NULL;
#endif
}

const int* SP_POSIX_TIMERS() {
#if _POSIX_TIMERS
    const static int value = _POSIX_TIMERS;
    return &value;
#else
        return NULL;
#endif
}

const int* SP_POSIX_TRACE() {
#if _POSIX_TRACE
    const static int value = _POSIX_TRACE;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_TRACE_EVENT_FILTER() {
#if _POSIX_TRACE_EVENT_FILTER
    const static int value = _POSIX_TRACE_EVENT_FILTER;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_TRACE_INHERIT() {
#if _POSIX_TRACE_INHERIT
    const static int value = _POSIX_TRACE_INHERIT;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_TRACE_LOG() {
#if _POSIX_TRACE_LOG
    const static int value = _POSIX_TRACE_LOG;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_TYPED_MEMORY_OBJECTS() {
#if _POSIX_TYPED_MEMORY_OBJECTS
    const static int value = _POSIX_TYPED_MEMORY_OBJECTS;
    return &value;
#else
    return NULL;
#endif
}

//MARK: POSIX V6
const int* SP_POSIX_V6_ILP32_OFF32() {
#if _POSIX_V6_ILP32_OFF32
    const static int value = _POSIX_V6_ILP32_OFF32;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_V6_ILP32_OFFBIG() {
#if _POSIX_V6_ILP32_OFFBIG
    const static int value = _POSIX_V6_ILP32_OFFBIG;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_V6_LP64_OFF64() {
#if _POSIX_V6_LP64_OFF64
    const static int value = _POSIX_V6_LP64_OFF64;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_V6_LPBIG_OFFBIG() {
#if _POSIX_V6_LPBIG_OFFBIG
    const static int value = _POSIX_V6_LPBIG_OFFBIG;
    return &value;
#else
    return NULL;
#endif
}

//MARK: POSIX V7
const int* SP_POSIX_V7_ILP32_OFF32() {
#if _POSIX_V7_ILP32_OFF32
    const static int value = _POSIX_V7_ILP32_OFF32;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_V7_ILP32_OFFBIG() {
#if _POSIX_V7_ILP32_OFFBIG
    const static int value = _POSIX_V7_ILP32_OFFBIG;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_V7_LP64_OFF64() {
#if _POSIX_V7_LP64_OFF64
    const static int value = _POSIX_V7_LP64_OFF64;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_V7_LPBIG_OFFBIG() {
#if _POSIX_V7_LPBIG_OFFBIG
    const static int value = _POSIX_V7_LPBIG_OFFBIG;
    return &value;
#else
    return NULL;
#endif
}

//MARK: POSIX2
const int* SP_POSIX2_C_BIND() {
#if _POSIX2_C_BIND
    const static int value = _POSIX2_C_BIND;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX2_C_DEV() {
#if _POSIX2_C_DEV
    const static int value = _POSIX2_C_DEV;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX2_CHAR_TERM() {
#if _POSIX2_CHAR_TERM
    const static int value = _POSIX2_CHAR_TERM;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX2_FORT_DEV() {
#if _POSIX2_FORT_DEV
    const static int value = _POSIX2_FORT_DEV;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX2_FORT_RUN() {
#if _POSIX2_FORT_RUN
    const static int value = _POSIX2_FORT_RUN;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX2_LOCALEDEF() {
#if _POSIX2_LOCALEDEF
    const static int value = _POSIX2_LOCALEDEF;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX2_PBS() {
#if _POSIX2_PBS
    const static int value = _POSIX2_PBS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX2_PBS_ACCOUNTING() {
#if _POSIX2_PBS_ACCOUNTING
    const static int value = _POSIX2_PBS_ACCOUNTING;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX2_PBS_CHECKPOINT() {
#if _POSIX2_PBS_CHECKPOINT
    const static int value = _POSIX2_PBS_CHECKPOINT;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX2_PBS_LOCATE() {
#if _POSIX2_PBS_LOCATE
    const static int value = _POSIX2_PBS_LOCATE;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX2_PBS_MESSAGE() {
#if _POSIX2_PBS_MESSAGE
    const static int value = _POSIX2_PBS_MESSAGE;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX2_PBS_TRACK() {
#if _POSIX2_PBS_TRACK
    const static int value = _POSIX2_PBS_TRACK;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX2_SW_DEV() {
#if _POSIX2_SW_DEV
    const static int value = _POSIX2_SW_DEV;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX2_UPE() {
#if _POSIX2_UPE
    const static int value = _POSIX2_UPE;
    return &value;
#else
    return NULL;
#endif
}

//MARK: XOPEN
const int* SP_XOPEN_CRYPT() {
#if _XOPEN_CRYPT
    const static int value = _XOPEN_CRYPT;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_XOPEN_ENH_I18N() {
#if _XOPEN_ENH_I18N
    const static int value = _XOPEN_ENH_I18N;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_XOPEN_REALTIME() {
#if _XOPEN_REALTIME
    const static int value = _XOPEN_REALTIME;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_XOPEN_REALTIME_THREADS() {
#if _XOPEN_REALTIME_THREADS
    const static int value = _XOPEN_REALTIME_THREADS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_XOPEN_SHM() {
#if _XOPEN_SHM
    const static int value = _XOPEN_SHM;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_XOPEN_STREAMS() {
#if _XOPEN_STREAMS
    const static int value = _XOPEN_STREAMS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_XOPEN_UNIX() {
#if _XOPEN_UNIX
    const static int value = _XOPEN_UNIX;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_XOPEN_UUCP() {
#if _XOPEN_UUCP
    const static int value = _XOPEN_UUCP;
    return &value;
#else
    return NULL;
#endif
}

//MARK:- Execution-Time Symbolic Constants
const int* SP_POSIX_ASYNC_IO() {
#if _POSIX_ASYNC_IO
    const static int value = _POSIX_ASYNC_IO;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_PRIO_IO() {
#if _POSIX_PRIO_IO
    const static int value = _POSIX_PRIO_IO;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_SYNC_IO() {
#if _POSIX_SYNC_IO
    const static int value = _POSIX_SYNC_IO;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_TIMESTAMP_RESOLUTION() {
#if _POSIX_TIMESTAMP_RESOLUTION
    const static int value = _POSIX_TIMESTAMP_RESOLUTION;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX2_SYMLINKS() {
#if _POSIX2_SYMLINKS
    const static int value = _POSIX2_SYMLINKS;
    return &value;
#else
    return NULL;
#endif
}

//MARK:- Constants For Functions
const int* SP_CS_PATH() {
#if _CS_PATH
    const static int value = _CS_PATH;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_CS_POSIX_V7_ILP32_OFF32_CFLAGS() {
#if _CS_POSIX_V7_ILP32_OFF32_CFLAGS
    const static int value = _CS_POSIX_V7_ILP32_OFF32_CFLAGS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_CS_POSIX_V7_ILP32_OFF32_LDFLAGS() {
#if _CS_POSIX_V7_ILP32_OFF32_LDFLAGS
    const static int value = _CS_POSIX_V7_ILP32_OFF32_LDFLAGS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_CS_POSIX_V7_ILP32_OFF32_LIBS() {
#if _CS_POSIX_V7_ILP32_OFF32_LIBS
    const static int value = _CS_POSIX_V7_ILP32_OFF32_LIBS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_CS_POSIX_V7_ILP32_OFFBIG_CFLAGS() {
#if _CS_POSIX_V7_ILP32_OFFBIG_CFLAGS
    const static int value = _CS_POSIX_V7_ILP32_OFFBIG_CFLAGS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_CS_POSIX_V7_ILP32_OFFBIG_LDFLAGS() {
#if _CS_POSIX_V7_ILP32_OFFBIG_LDFLAGS
    const static int value = _CS_POSIX_V7_ILP32_OFFBIG_LDFLAGS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_CS_POSIX_V7_ILP32_OFFBIG_LIBS() {
#if _CS_POSIX_V7_ILP32_OFFBIG_LIBS
    const static int value = _CS_POSIX_V7_ILP32_OFFBIG_LIBS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_CS_POSIX_V7_LP64_OFF64_CFLAGS() {
#if _CS_POSIX_V7_LP64_OFF64_CFLAGS
    const static int value = _CS_POSIX_V7_LP64_OFF64_CFLAGS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_CS_POSIX_V7_LP64_OFF64_LDFLAGS() {
#if _CS_POSIX_V7_LP64_OFF64_LDFLAGS
    const static int value = _CS_POSIX_V7_LP64_OFF64_LDFLAGS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_CS_POSIX_V7_LP64_OFF64_LIBS() {
#if _CS_POSIX_V7_LP64_OFF64_LIBS
    const static int value = _CS_POSIX_V7_LP64_OFF64_LIBS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_CS_POSIX_V7_LPBIG_OFFBIG_CFLAGS() {
#if _CS_POSIX_V7_LPBIG_OFFBIG_CFLAGS
    const static int value = _CS_POSIX_V7_LPBIG_OFFBIG_CFLAGS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_CS_POSIX_V7_LPBIG_OFFBIG_LDFLAGS() {
#if _CS_POSIX_V7_LPBIG_OFFBIG_LDFLAGS
    const static int value = _CS_POSIX_V7_LPBIG_OFFBIG_LDFLAGS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_CS_POSIX_V7_LPBIG_OFFBIG_LIBS() {
#if _CS_POSIX_V7_LPBIG_OFFBIG_LIBS
    const static int value = _CS_POSIX_V7_LPBIG_OFFBIG_LIBS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_CS_POSIX_V7_THREADS_CFLAGS() {
#if _CS_POSIX_V7_THREADS_CFLAGS
    const static int value = _CS_POSIX_V7_THREADS_CFLAGS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_CS_POSIX_V7_THREADS_LDFLAGS() {
#if _CS_POSIX_V7_THREADS_LDFLAGS
    const static int value = _CS_POSIX_V7_THREADS_LDFLAGS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_CS_POSIX_V7_WIDTH_RESTRICTED_ENVS() {
#if _CS_POSIX_V7_WIDTH_RESTRICTED_ENVS
    const static int value = _CS_POSIX_V7_WIDTH_RESTRICTED_ENVS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_CS_V7_ENV() {
#if _CS_V7_ENV
    const static int value = _CS_V7_ENV;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_CS_POSIX_V6_ILP32_OFF32_CFLAGS() {
#if _CS_POSIX_V6_ILP32_OFF32_CFLAGS
    const static int value = _CS_POSIX_V6_ILP32_OFF32_CFLAGS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_CS_POSIX_V6_ILP32_OFF32_LDFLAGS() {
#if _CS_POSIX_V6_ILP32_OFF32_LDFLAGS
    const static int value = _CS_POSIX_V6_ILP32_OFF32_LDFLAGS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_CS_POSIX_V6_ILP32_OFF32_LIBS() {
#if _CS_POSIX_V6_ILP32_OFF32_LIBS
    const static int value = _CS_POSIX_V6_ILP32_OFF32_LIBS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_CS_POSIX_V6_ILP32_OFFBIG_CFLAGS() {
#if _CS_POSIX_V6_ILP32_OFFBIG_CFLAGS
    const static int value = _CS_POSIX_V6_ILP32_OFFBIG_CFLAGS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_CS_POSIX_V6_ILP32_OFFBIG_LDFLAGS() {
#if _CS_POSIX_V6_ILP32_OFFBIG_LDFLAGS
    const static int value = _CS_POSIX_V6_ILP32_OFFBIG_LDFLAGS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_CS_POSIX_V6_ILP32_OFFBIG_LIBS() {
#if _CS_POSIX_V6_ILP32_OFFBIG_LIBS
    const static int value = _CS_POSIX_V6_ILP32_OFFBIG_LIBS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_CS_POSIX_V6_LP64_OFF64_CFLAGS() {
#if _CS_POSIX_V6_LP64_OFF64_CFLAGS
    const static int value = _CS_POSIX_V6_LP64_OFF64_CFLAGS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_CS_POSIX_V6_LP64_OFF64_LDFLAGS() {
#if _CS_POSIX_V6_LP64_OFF64_LDFLAGS
    const static int value = _CS_POSIX_V6_LP64_OFF64_LDFLAGS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_CS_POSIX_V6_LP64_OFF64_LIBS() {
#if _CS_POSIX_V6_LP64_OFF64_LIBS
    const static int value = _CS_POSIX_V6_LP64_OFF64_LIBS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_CS_POSIX_V6_LPBIG_OFFBIG_CFLAGS() {
#if _CS_POSIX_V6_LPBIG_OFFBIG_CFLAGS
    const static int value = _CS_POSIX_V6_LPBIG_OFFBIG_CFLAGS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_CS_POSIX_V6_LPBIG_OFFBIG_LDFLAGS() {
#if _CS_POSIX_V6_LPBIG_OFFBIG_LDFLAGS
    const static int value = _CS_POSIX_V6_LPBIG_OFFBIG_LDFLAGS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_CS_POSIX_V6_LPBIG_OFFBIG_LIBS() {
#if _CS_POSIX_V6_LPBIG_OFFBIG_LIBS
    const static int value = _CS_POSIX_V6_LPBIG_OFFBIG_LIBS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_CS_POSIX_V6_WIDTH_RESTRICTED_ENVS() {
#if _CS_POSIX_V6_WIDTH_RESTRICTED_ENVS
    const static int value = _CS_POSIX_V6_WIDTH_RESTRICTED_ENVS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_CS_V6_ENV() {
#if _CS_V6_ENV
    const static int value = _CS_V6_ENV;
    return &value;
#else
    return NULL;
#endif
}

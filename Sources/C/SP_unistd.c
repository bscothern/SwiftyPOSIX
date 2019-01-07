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
#ifdef _POSIX_SUBPROFILE
    const static long value = _POSIX2_VERSION;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_SUBPROFILE() {
#ifdef _POSIX_SUBPROFILE
    const static int value = _POSIX_SUBPROFILE;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_XOPEN_VERSION() {
#ifdef _XOPEN_VERSION
    const static int value = _XOPEN_VERSION;
    return &value;
#else
    return NULL;
#endif
}

//MARK:- Constants for Options and Option Groups
//MARK: _POSIX_ defines
const int* SP_POSIX_ADVISORY_INFO() {
#ifdef _POSIX_ADVISORY_INFO
    const static int value = _POSIX_ADVISORY_INFO;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_ASYNCHRONOUS_IO() {
#ifdef _POSIX_ASYNCHRONOUS_IO
    const static int value = _POSIX_ASYNCHRONOUS_IO;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_BARRIERS() {
#ifdef _POSIX_BARRIERS
    const static int value = _POSIX_BARRIERS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_CHOWN_RESTRICTED() {
#ifdef _POSIX_CHOWN_RESTRICTED
    const static int value = _POSIX_CHOWN_RESTRICTED;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_CLOCK_SELECTION() {
#ifdef _POSIX_CLOCK_SELECTION
    const static int value = _POSIX_CLOCK_SELECTION;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_CPUTIME() {
#ifdef _POSIX_CPUTIME
    const static int value = _POSIX_CPUTIME;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_FSYNC() {
#ifdef _POSIX_FSYNC
    const static int value = _POSIX_FSYNC;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_IPV6() {
#ifdef _POSIX_IPV6
    const static int value = _POSIX_IPV6;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_JOB_CONTROL() {
#ifdef _POSIX_JOB_CONTROL
    const static int value = _POSIX_JOB_CONTROL;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_MAPPED_FILES() {
#ifdef _POSIX_MAPPED_FILES
    const static int value = _POSIX_MAPPED_FILES;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_MEMLOCK() {
#ifdef _POSIX_MEMLOCK
    const static int value = _POSIX_MEMLOCK;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_MEMLOCK_RANGE() {
#ifdef _POSIX_MEMLOCK_RANGE
    const static int value = _POSIX_MEMLOCK_RANGE;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_MEMORY_PROTECTION() {
#ifdef _POSIX_MEMORY_PROTECTION
    const static int value = _POSIX_MEMORY_PROTECTION;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_MESSAGE_PASSING() {
#ifdef _POSIX_MESSAGE_PASSING
    const static int value = _POSIX_MESSAGE_PASSING;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_MONOTONIC_CLOCK() {
#ifdef _POSIX_MONOTONIC_CLOCK
    const static int value = _POSIX_MONOTONIC_CLOCK;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_NO_TRUNC() {
#ifdef _POSIX_NO_TRUNC
    const static int value = _POSIX_NO_TRUNC;
    return &value;
#else
        return NULL;
#endif
}

const int* SP_POSIX_PRIORITIZED_IO() {
#ifdef _POSIX_PRIORITIZED_IO
    const static int value = _POSIX_PRIORITIZED_IO;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_PRIORITY_SCHEDULING() {
#ifdef _POSIX_PRIORITY_SCHEDULING
    const static int value = _POSIX_PRIORITY_SCHEDULING;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_RAW_SOCKETS() {
#ifdef _POSIX_RAW_SOCKETS
    const static int value = _POSIX_RAW_SOCKETS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_READER_WRITER_LOCKS() {
#ifdef _POSIX_READER_WRITER_LOCKS
    const static int value = _POSIX_READER_WRITER_LOCKS;
    return &value;
#else
        return NULL;
#endif
}

const int* SP_POSIX_REALTIME_SIGNALS() {
#ifdef _POSIX_REALTIME_SIGNALS
    const static int value = _POSIX_REALTIME_SIGNALS;
    return &value;
#else
        return NULL;
#endif
}

const int* SP_POSIX_REGEXP() {
#ifdef _POSIX_REGEXP
    const static int value = _POSIX_REGEXP;
    return &value;
#else
        return NULL;
#endif
}

const int* SP_POSIX_SAVED_IDS() {
#ifdef _POSIX_SAVED_IDS
    const static int value = _POSIX_SAVED_IDS;
    return &value;
#else
        return NULL;
#endif
}

const int* SP_POSIX_SEMAPHORES() {
#ifdef _POSIX_SEMAPHORES
    const static int value = _POSIX_SEMAPHORES;
    return &value;
#else
        return NULL;
#endif
}

const int* SP_POSIX_SHARED_MEMORY_OBJECTS() {
#ifdef _POSIX_SHARED_MEMORY_OBJECTS
    const static int value = _POSIX_SHARED_MEMORY_OBJECTS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_SHELL() {
#ifdef _POSIX_SHELL
    const static int value = _POSIX_SHELL;
    return &value;
#else
        return NULL;
#endif
}

const int* SP_POSIX_SPAWN() {
#ifdef _POSIX_SPAWN
    const static int value = _POSIX_SPAWN;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_SPIN_LOCKS() {
#ifdef _POSIX_SPIN_LOCKS
    const static int value = _POSIX_SPIN_LOCKS;
    return &value;
#else
        return NULL;
#endif
}

const int* SP_POSIX_SPORADIC_SERVER() {
#ifdef _POSIX_SPORADIC_SERVER
    const static int value = _POSIX_SPORADIC_SERVER;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_SYNCHRONIZED_IO() {
#ifdef _POSIX_SYNCHRONIZED_IO
    const static int value = _POSIX_SYNCHRONIZED_IO;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_THREAD_ATTR_STACKADDR() {
#ifdef _POSIX_THREAD_ATTR_STACKADDR
    const static int value = _POSIX_THREAD_ATTR_STACKADDR;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_THREAD_ATTR_STACKSIZE() {
#ifdef _POSIX_THREAD_ATTR_STACKSIZE
    const static int value = _POSIX_THREAD_ATTR_STACKSIZE;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_THREAD_CPUTIME() {
#ifdef _POSIX_THREAD_CPUTIME
    const static int value = _POSIX_THREAD_CPUTIME;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_THREAD_PRIO_INHERIT() {
#ifdef _POSIX_THREAD_PRIO_INHERIT
    const static int value = _POSIX_THREAD_PRIO_INHERIT;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_THREAD_PRIO_PROTECT() {
#ifdef _POSIX_THREAD_PRIO_PROTECT
    const static int value = _POSIX_THREAD_PRIO_PROTECT;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_THREAD_PRIORITY_SCHEDULING() {
#ifdef _POSIX_THREAD_PRIORITY_SCHEDULING
    const static int value = _POSIX_THREAD_PRIORITY_SCHEDULING;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_THREAD_PROCESS_SHARED() {
#ifdef _POSIX_THREAD_PROCESS_SHARED
    const static int value = _POSIX_THREAD_PROCESS_SHARED;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_THREAD_ROBUST_PRIO_INHERIT() {
#ifdef _POSIX_THREAD_ROBUST_PRIO_INHERIT
    const static int value = _POSIX_THREAD_ROBUST_PRIO_INHERIT;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_THREAD_ROBUST_PRIO_PROTECT() {
#ifdef _POSIX_THREAD_ROBUST_PRIO_PROTECT
    const static int value = _POSIX_THREAD_ROBUST_PRIO_PROTECT;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_THREAD_SAFE_FUNCTIONS() {
#ifdef _POSIX_THREAD_SAFE_FUNCTIONS
    const static int value = _POSIX_THREAD_SAFE_FUNCTIONS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_THREAD_SPORADIC_SERVER() {
#ifdef _POSIX_THREAD_SPORADIC_SERVER
    const static int value = _POSIX_THREAD_SPORADIC_SERVER;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_THREADS() {
#ifdef _POSIX_THREADS
    const static int value = _POSIX_THREADS;
    return &value;
#else
        return NULL;
#endif
}

const int* SP_POSIX_TIMEOUTS() {
#ifdef _POSIX_TIMEOUTS
    const static int value = _POSIX_TIMEOUTS;
    return &value;
#else
        return NULL;
#endif
}

const int* SP_POSIX_TIMERS() {
#ifdef _POSIX_TIMERS
    const static int value = _POSIX_TIMERS;
    return &value;
#else
        return NULL;
#endif
}

const int* SP_POSIX_TRACE() {
#ifdef _POSIX_TRACE
    const static int value = _POSIX_TRACE;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_TRACE_EVENT_FILTER() {
#ifdef _POSIX_TRACE_EVENT_FILTER
    const static int value = _POSIX_TRACE_EVENT_FILTER;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_TRACE_INHERIT() {
#ifdef _POSIX_TRACE_INHERIT
    const static int value = _POSIX_TRACE_INHERIT;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_TRACE_LOG() {
#ifdef _POSIX_TRACE_LOG
    const static int value = _POSIX_TRACE_LOG;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_TYPED_MEMORY_OBJECTS() {
#ifdef _POSIX_TYPED_MEMORY_OBJECTS
    const static int value = _POSIX_TYPED_MEMORY_OBJECTS;
    return &value;
#else
    return NULL;
#endif
}

//MARK: POSIX V6
const int* SP_POSIX_V6_ILP32_OFF32() {
#ifdef _POSIX_V6_ILP32_OFF32
    const static int value = _POSIX_V6_ILP32_OFF32;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_V6_ILP32_OFFBIG() {
#ifdef _POSIX_V6_ILP32_OFFBIG
    const static int value = _POSIX_V6_ILP32_OFFBIG;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_V6_LP64_OFF64() {
#ifdef _POSIX_V6_LP64_OFF64
    const static int value = _POSIX_V6_LP64_OFF64;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_V6_LPBIG_OFFBIG() {
#ifdef _POSIX_V6_LPBIG_OFFBIG
    const static int value = _POSIX_V6_LPBIG_OFFBIG;
    return &value;
#else
    return NULL;
#endif
}

//MARK: POSIX V7
const int* SP_POSIX_V7_ILP32_OFF32() {
#ifdef _POSIX_V7_ILP32_OFF32
    const static int value = _POSIX_V7_ILP32_OFF32;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_V7_ILP32_OFFBIG() {
#ifdef _POSIX_V7_ILP32_OFFBIG
    const static int value = _POSIX_V7_ILP32_OFFBIG;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_V7_LP64_OFF64() {
#ifdef _POSIX_V7_LP64_OFF64
    const static int value = _POSIX_V7_LP64_OFF64;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_V7_LPBIG_OFFBIG() {
#ifdef _POSIX_V7_LPBIG_OFFBIG
    const static int value = _POSIX_V7_LPBIG_OFFBIG;
    return &value;
#else
    return NULL;
#endif
}

//MARK: POSIX2
const int* SP_POSIX2_C_BIND() {
#ifdef _POSIX2_C_BIND
    const static int value = _POSIX2_C_BIND;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX2_C_DEV() {
#ifdef _POSIX2_C_DEV
    const static int value = _POSIX2_C_DEV;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX2_CHAR_TERM() {
#ifdef _POSIX2_CHAR_TERM
    const static int value = _POSIX2_CHAR_TERM;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX2_FORT_DEV() {
#ifdef _POSIX2_FORT_DEV
    const static int value = _POSIX2_FORT_DEV;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX2_FORT_RUN() {
#ifdef _POSIX2_FORT_RUN
    const static int value = _POSIX2_FORT_RUN;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX2_LOCALEDEF() {
#ifdef _POSIX2_LOCALEDEF
    const static int value = _POSIX2_LOCALEDEF;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX2_PBS() {
#ifdef _POSIX2_PBS
    const static int value = _POSIX2_PBS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX2_PBS_ACCOUNTING() {
#ifdef _POSIX2_PBS_ACCOUNTING
    const static int value = _POSIX2_PBS_ACCOUNTING;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX2_PBS_CHECKPOINT() {
#ifdef _POSIX2_PBS_CHECKPOINT
    const static int value = _POSIX2_PBS_CHECKPOINT;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX2_PBS_LOCATE() {
#ifdef _POSIX2_PBS_LOCATE
    const static int value = _POSIX2_PBS_LOCATE;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX2_PBS_MESSAGE() {
#ifdef _POSIX2_PBS_MESSAGE
    const static int value = _POSIX2_PBS_MESSAGE;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX2_PBS_TRACK() {
#ifdef _POSIX2_PBS_TRACK
    const static int value = _POSIX2_PBS_TRACK;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX2_SW_DEV() {
#ifdef _POSIX2_SW_DEV
    const static int value = _POSIX2_SW_DEV;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX2_UPE() {
#ifdef _POSIX2_UPE
    const static int value = _POSIX2_UPE;
    return &value;
#else
    return NULL;
#endif
}

//MARK: XOPEN
const int* SP_XOPEN_CRYPT() {
#ifdef _XOPEN_CRYPT
    const static int value = _XOPEN_CRYPT;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_XOPEN_ENH_I18N() {
#ifdef _XOPEN_ENH_I18N
    const static int value = _XOPEN_ENH_I18N;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_XOPEN_REALTIME() {
#ifdef _XOPEN_REALTIME
    const static int value = _XOPEN_REALTIME;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_XOPEN_REALTIME_THREADS() {
#ifdef _XOPEN_REALTIME_THREADS
    const static int value = _XOPEN_REALTIME_THREADS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_XOPEN_SHM() {
#ifdef _XOPEN_SHM
    const static int value = _XOPEN_SHM;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_XOPEN_STREAMS() {
#ifdef _XOPEN_STREAMS
    const static int value = _XOPEN_STREAMS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_XOPEN_UNIX() {
#ifdef _XOPEN_UNIX
    const static int value = _XOPEN_UNIX;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_XOPEN_UUCP() {
#ifdef _XOPEN_UUCP
    const static int value = _XOPEN_UUCP;
    return &value;
#else
    return NULL;
#endif
}

//MARK:- Execution-Time Symbolic Constants
const int* SP_POSIX_ASYNC_IO() {
#ifdef _POSIX_ASYNC_IO
    const static int value = _POSIX_ASYNC_IO;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_PRIO_IO() {
#ifdef _POSIX_PRIO_IO
    const static int value = _POSIX_PRIO_IO;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_SYNC_IO() {
#ifdef _POSIX_SYNC_IO
    const static int value = _POSIX_SYNC_IO;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX_TIMESTAMP_RESOLUTION() {
#ifdef _POSIX_TIMESTAMP_RESOLUTION
    const static int value = _POSIX_TIMESTAMP_RESOLUTION;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_POSIX2_SYMLINKS() {
#ifdef _POSIX2_SYMLINKS
    const static int value = _POSIX2_SYMLINKS;
    return &value;
#else
    return NULL;
#endif
}

//MARK:- Constants For Functions
//MARK: confstr()
const int* SP_CS_PATH() {
#ifdef _CS_PATH
    const static int value = _CS_PATH;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_CS_POSIX_V7_ILP32_OFF32_CFLAGS() {
#ifdef _CS_POSIX_V7_ILP32_OFF32_CFLAGS
    const static int value = _CS_POSIX_V7_ILP32_OFF32_CFLAGS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_CS_POSIX_V7_ILP32_OFF32_LDFLAGS() {
#ifdef _CS_POSIX_V7_ILP32_OFF32_LDFLAGS
    const static int value = _CS_POSIX_V7_ILP32_OFF32_LDFLAGS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_CS_POSIX_V7_ILP32_OFF32_LIBS() {
#ifdef _CS_POSIX_V7_ILP32_OFF32_LIBS
    const static int value = _CS_POSIX_V7_ILP32_OFF32_LIBS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_CS_POSIX_V7_ILP32_OFFBIG_CFLAGS() {
#ifdef _CS_POSIX_V7_ILP32_OFFBIG_CFLAGS
    const static int value = _CS_POSIX_V7_ILP32_OFFBIG_CFLAGS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_CS_POSIX_V7_ILP32_OFFBIG_LDFLAGS() {
#ifdef _CS_POSIX_V7_ILP32_OFFBIG_LDFLAGS
    const static int value = _CS_POSIX_V7_ILP32_OFFBIG_LDFLAGS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_CS_POSIX_V7_ILP32_OFFBIG_LIBS() {
#ifdef _CS_POSIX_V7_ILP32_OFFBIG_LIBS
    const static int value = _CS_POSIX_V7_ILP32_OFFBIG_LIBS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_CS_POSIX_V7_LP64_OFF64_CFLAGS() {
#ifdef _CS_POSIX_V7_LP64_OFF64_CFLAGS
    const static int value = _CS_POSIX_V7_LP64_OFF64_CFLAGS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_CS_POSIX_V7_LP64_OFF64_LDFLAGS() {
#ifdef _CS_POSIX_V7_LP64_OFF64_LDFLAGS
    const static int value = _CS_POSIX_V7_LP64_OFF64_LDFLAGS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_CS_POSIX_V7_LP64_OFF64_LIBS() {
#ifdef _CS_POSIX_V7_LP64_OFF64_LIBS
    const static int value = _CS_POSIX_V7_LP64_OFF64_LIBS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_CS_POSIX_V7_LPBIG_OFFBIG_CFLAGS() {
#ifdef _CS_POSIX_V7_LPBIG_OFFBIG_CFLAGS
    const static int value = _CS_POSIX_V7_LPBIG_OFFBIG_CFLAGS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_CS_POSIX_V7_LPBIG_OFFBIG_LDFLAGS() {
#ifdef _CS_POSIX_V7_LPBIG_OFFBIG_LDFLAGS
    const static int value = _CS_POSIX_V7_LPBIG_OFFBIG_LDFLAGS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_CS_POSIX_V7_LPBIG_OFFBIG_LIBS() {
#ifdef _CS_POSIX_V7_LPBIG_OFFBIG_LIBS
    const static int value = _CS_POSIX_V7_LPBIG_OFFBIG_LIBS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_CS_POSIX_V7_THREADS_CFLAGS() {
#ifdef _CS_POSIX_V7_THREADS_CFLAGS
    const static int value = _CS_POSIX_V7_THREADS_CFLAGS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_CS_POSIX_V7_THREADS_LDFLAGS() {
#ifdef _CS_POSIX_V7_THREADS_LDFLAGS
    const static int value = _CS_POSIX_V7_THREADS_LDFLAGS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_CS_POSIX_V7_WIDTH_RESTRICTED_ENVS() {
#ifdef _CS_POSIX_V7_WIDTH_RESTRICTED_ENVS
    const static int value = _CS_POSIX_V7_WIDTH_RESTRICTED_ENVS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_CS_V7_ENV() {
#ifdef _CS_V7_ENV
    const static int value = _CS_V7_ENV;
    return &value;
#else
    return NULL;
#endif
}

//MARK: confstr() issue 6
const int* SP_CS_POSIX_V6_ILP32_OFF32_CFLAGS() {
#ifdef _CS_POSIX_V6_ILP32_OFF32_CFLAGS
    const static int value = _CS_POSIX_V6_ILP32_OFF32_CFLAGS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_CS_POSIX_V6_ILP32_OFF32_LDFLAGS() {
#ifdef _CS_POSIX_V6_ILP32_OFF32_LDFLAGS
    const static int value = _CS_POSIX_V6_ILP32_OFF32_LDFLAGS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_CS_POSIX_V6_ILP32_OFF32_LIBS() {
#ifdef _CS_POSIX_V6_ILP32_OFF32_LIBS
    const static int value = _CS_POSIX_V6_ILP32_OFF32_LIBS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_CS_POSIX_V6_ILP32_OFFBIG_CFLAGS() {
#ifdef _CS_POSIX_V6_ILP32_OFFBIG_CFLAGS
    const static int value = _CS_POSIX_V6_ILP32_OFFBIG_CFLAGS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_CS_POSIX_V6_ILP32_OFFBIG_LDFLAGS() {
#ifdef _CS_POSIX_V6_ILP32_OFFBIG_LDFLAGS
    const static int value = _CS_POSIX_V6_ILP32_OFFBIG_LDFLAGS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_CS_POSIX_V6_ILP32_OFFBIG_LIBS() {
#ifdef _CS_POSIX_V6_ILP32_OFFBIG_LIBS
    const static int value = _CS_POSIX_V6_ILP32_OFFBIG_LIBS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_CS_POSIX_V6_LP64_OFF64_CFLAGS() {
#ifdef _CS_POSIX_V6_LP64_OFF64_CFLAGS
    const static int value = _CS_POSIX_V6_LP64_OFF64_CFLAGS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_CS_POSIX_V6_LP64_OFF64_LDFLAGS() {
#ifdef _CS_POSIX_V6_LP64_OFF64_LDFLAGS
    const static int value = _CS_POSIX_V6_LP64_OFF64_LDFLAGS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_CS_POSIX_V6_LP64_OFF64_LIBS() {
#ifdef _CS_POSIX_V6_LP64_OFF64_LIBS
    const static int value = _CS_POSIX_V6_LP64_OFF64_LIBS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_CS_POSIX_V6_LPBIG_OFFBIG_CFLAGS() {
#ifdef _CS_POSIX_V6_LPBIG_OFFBIG_CFLAGS
    const static int value = _CS_POSIX_V6_LPBIG_OFFBIG_CFLAGS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_CS_POSIX_V6_LPBIG_OFFBIG_LDFLAGS() {
#ifdef _CS_POSIX_V6_LPBIG_OFFBIG_LDFLAGS
    const static int value = _CS_POSIX_V6_LPBIG_OFFBIG_LDFLAGS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_CS_POSIX_V6_LPBIG_OFFBIG_LIBS() {
#ifdef _CS_POSIX_V6_LPBIG_OFFBIG_LIBS
    const static int value = _CS_POSIX_V6_LPBIG_OFFBIG_LIBS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_CS_POSIX_V6_WIDTH_RESTRICTED_ENVS() {
#ifdef _CS_POSIX_V6_WIDTH_RESTRICTED_ENVS
    const static int value = _CS_POSIX_V6_WIDTH_RESTRICTED_ENVS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_CS_V6_ENV() {
#ifdef _CS_V6_ENV
    const static int value = _CS_V6_ENV;
    return &value;
#else
    return NULL;
#endif
}

//MARK:- pathconf()
const int* SP_PC_2_SYMLINKS() {
#ifdef _PC_2_SYMLINKS
    const static int value = _PC_2_SYMLINKS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_PC_ALLOC_SIZE_MIN() {
#ifdef _PC_ALLOC_SIZE_MIN
    const static int value = _PC_ALLOC_SIZE_MIN;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_PC_ASYNC_IO() {
#ifdef _PC_ASYNC_IO
    const static int value = _PC_ASYNC_IO;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_PC_CHOWN_RESTRICTED() {
#ifdef _PC_CHOWN_RESTRICTED
    const static int value = _PC_CHOWN_RESTRICTED;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_PC_FILESIZEBITS() {
#ifdef _PC_FILESIZEBITS
    const static int value = _PC_FILESIZEBITS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_PC_LINK_MAX() {
#ifdef _PC_LINK_MAX
    const static int value = _PC_LINK_MAX;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_PC_MAX_CANON() {
#ifdef _PC_MAX_CANON
    const static int value = _PC_MAX_CANON;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_PC_MAX_INPUT() {
#ifdef _PC_MAX_INPUT
    const static int value = _PC_MAX_INPUT;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_PC_NAME_MAX() {
#ifdef _PC_NAME_MAX
    const static int value = _PC_NAME_MAX;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_PC_NO_TRUNC() {
#ifdef _PC_NO_TRUNC
    const static int value = _PC_NO_TRUNC;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_PC_PATH_MAX() {
#ifdef _PC_PATH_MAX
    const static int value = _PC_PATH_MAX;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_PC_PIPE_BUF() {
#ifdef _PC_PIPE_BUF
    const static int value = _PC_PIPE_BUF;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_PC_PRIO_IO() {
#ifdef _PC_PRIO_IO
    const static int value = _PC_PRIO_IO;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_PC_REC_INCR_XFER_SIZE() {
#ifdef _PC_REC_INCR_XFER_SIZE
    const static int value = _PC_REC_INCR_XFER_SIZE;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_PC_REC_MAX_XFER_SIZE() {
#ifdef _PC_REC_MAX_XFER_SIZE
    const static int value = _PC_REC_MAX_XFER_SIZE;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_PC_REC_MIN_XFER_SIZE() {
#ifdef _PC_REC_MIN_XFER_SIZE
    const static int value = _PC_REC_MIN_XFER_SIZE;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_PC_REC_XFER_ALIGN() {
#ifdef _PC_REC_XFER_ALIGN
    const static int value = _PC_REC_XFER_ALIGN;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_PC_SYMLINK_MAX() {
#ifdef _PC_SYMLINK_MAX
    const static int value = _PC_SYMLINK_MAX;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_PC_SYNC_IO() {
#ifdef _PC_SYNC_IO
    const static int value = _PC_SYNC_IO;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_PC_TIMESTAMP_RESOLUTION() {
#ifdef _PC_TIMESTAMP_RESOLUTION
    const static int value = _PC_TIMESTAMP_RESOLUTION;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_PC_VDISABLE() {
#ifdef _PC_VDISABLE
    const static int value = _PC_VDISABLE;
    return &value;
#else
    return NULL;
#endif
}

//MARK: sysconf()
const int* SP_SC_2_C_BIND() {
#ifdef _SC_2_C_BIND
    const static int value = _SC_2_C_BIND;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_2_C_DEV() {
#ifdef _SC_2_C_DEV
    const static int value = _SC_2_C_DEV;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_2_CHAR_TERM() {
#ifdef _SC_2_CHAR_TERM
    const static int value = _SC_2_CHAR_TERM;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_2_FORT_DEV() {
#ifdef _SC_2_FORT_DEV
    const static int value = _SC_2_FORT_DEV;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_2_FORT_RUN() {
#ifdef _SC_2_FORT_RUN
    const static int value = _SC_2_FORT_RUN;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_2_LOCALEDEF() {
#ifdef _SC_2_LOCALEDEF
    const static int value = _SC_2_LOCALEDEF;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_2_PBS() {
#ifdef _SC_2_PBS
    const static int value = _SC_2_PBS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_2_PBS_ACCOUNTING() {
#ifdef _SC_2_PBS_ACCOUNTING
    const static int value = _SC_2_PBS_ACCOUNTING;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_2_PBS_CHECKPOINT() {
#ifdef _SC_2_PBS_CHECKPOINT
    const static int value = _SC_2_PBS_CHECKPOINT;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_2_PBS_LOCATE() {
#ifdef _SC_2_PBS_LOCATE
    const static int value = _SC_2_PBS_LOCATE;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_2_PBS_MESSAGE() {
#ifdef _SC_2_PBS_MESSAGE
    const static int value = _SC_2_PBS_MESSAGE;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_2_PBS_TRACK() {
#ifdef _SC_2_PBS_TRACK
    const static int value = _SC_2_PBS_TRACK;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_2_SW_DEV() {
#ifdef _SC_2_SW_DEV
    const static int value = _SC_2_SW_DEV;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_2_UPE() {
#ifdef _SC_2_UPE
    const static int value = _SC_2_UPE;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_2_VERSION() {
#ifdef _SC_2_VERSION
    const static int value = _SC_2_VERSION;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_ADVISORY_INFO() {
#ifdef _SC_ADVISORY_INFO
    const static int value = _SC_ADVISORY_INFO;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_AIO_LISTIO_MAX() {
#ifdef _SC_AIO_LISTIO_MAX
    const static int value = _SC_AIO_LISTIO_MAX;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_AIO_MAX() {
#ifdef _SC_AIO_MAX
    const static int value = _SC_AIO_MAX;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_AIO_PRIO_DELTA_MAX() {
#ifdef _SC_AIO_PRIO_DELTA_MAX
    const static int value = _SC_AIO_PRIO_DELTA_MAX;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_ARG_MAX() {
#ifdef _SC_ARG_MAX
    const static int value = _SC_ARG_MAX;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_ASYNCHRONOUS_IO() {
#ifdef _SC_ASYNCHRONOUS_IO
    const static int value = _SC_ASYNCHRONOUS_IO;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_ATEXIT_MAX() {
#ifdef _SC_ATEXIT_MAX
    const static int value = _SC_ATEXIT_MAX;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_BARRIERS() {
#ifdef _SC_BARRIERS
    const static int value = _SC_BARRIERS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_BC_BASE_MAX() {
#ifdef _SC_BC_BASE_MAX
    const static int value = _SC_BC_BASE_MAX;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_BC_DIM_MAX() {
#ifdef _SC_BC_DIM_MAX
    const static int value = _SC_BC_DIM_MAX;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_BC_SCALE_MAX() {
#ifdef _SC_BC_SCALE_MAX
    const static int value = _SC_BC_SCALE_MAX;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_BC_STRING_MAX() {
#ifdef _SC_BC_STRING_MAX
    const static int value = _SC_BC_STRING_MAX;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_CHILD_MAX() {
#ifdef _SC_CHILD_MAX
    const static int value = _SC_CHILD_MAX;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_CLK_TCK() {
#ifdef _SC_CLK_TCK
    const static int value = _SC_CLK_TCK;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_CLOCK_SELECTION() {
#ifdef _SC_CLOCK_SELECTION
    const static int value = _SC_CLOCK_SELECTION;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_COLL_WEIGHTS_MAX() {
#ifdef _SC_COLL_WEIGHTS_MAX
    const static int value = _SC_COLL_WEIGHTS_MAX;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_CPUTIME() {
#ifdef _SC_CPUTIME
    const static int value = _SC_CPUTIME;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_DELAYTIMER_MAX() {
#ifdef _SC_DELAYTIMER_MAX
    const static int value = _SC_DELAYTIMER_MAX;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_EXPR_NEST_MAX() {
#ifdef _SC_EXPR_NEST_MAX
    const static int value = _SC_EXPR_NEST_MAX;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_FSYNC() {
#ifdef _SC_FSYNC
    const static int value = _SC_FSYNC;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_GETGR_R_SIZE_MAX() {
#ifdef _SC_GETGR_R_SIZE_MAX
    const static int value = _SC_GETGR_R_SIZE_MAX;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_GETPW_R_SIZE_MAX() {
#ifdef _SC_GETPW_R_SIZE_MAX
    const static int value = _SC_GETPW_R_SIZE_MAX;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_HOST_NAME_MAX() {
#ifdef _SC_HOST_NAME_MAX
    const static int value = _SC_HOST_NAME_MAX;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_IOV_MAX() {
#ifdef _SC_IOV_MAX
    const static int value = _SC_IOV_MAX;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_IPV6() {
#ifdef _SC_IPV6
    const static int value = _SC_IPV6;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_JOB_CONTROL() {
#ifdef _SC_JOB_CONTROL
    const static int value = _SC_JOB_CONTROL;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_LINE_MAX() {
#ifdef _SC_LINE_MAX
    const static int value = _SC_LINE_MAX;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_LOGIN_NAME_MAX() {
#ifdef _SC_LOGIN_NAME_MAX
    const static int value = _SC_LOGIN_NAME_MAX;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_MAPPED_FILES() {
#ifdef _SC_MAPPED_FILES
    const static int value = _SC_MAPPED_FILES;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_MEMLOCK() {
#ifdef _SC_MEMLOCK
    const static int value = _SC_MEMLOCK;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_MEMLOCK_RANGE() {
#ifdef _SC_MEMLOCK_RANGE
    const static int value = _SC_MEMLOCK_RANGE;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_MEMORY_PROTECTION() {
#ifdef _SC_MEMORY_PROTECTION
    const static int value = _SC_MEMORY_PROTECTION;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_MESSAGE_PASSING() {
#ifdef _SC_MESSAGE_PASSING
    const static int value = _SC_MESSAGE_PASSING;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_MONOTONIC_CLOCK() {
#ifdef _SC_MONOTONIC_CLOCK
    const static int value = _SC_MONOTONIC_CLOCK;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_MQ_OPEN_MAX() {
#ifdef _SC_MQ_OPEN_MAX
    const static int value = _SC_MQ_OPEN_MAX;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_MQ_PRIO_MAX() {
#ifdef _SC_MQ_PRIO_MAX
    const static int value = _SC_MQ_PRIO_MAX;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_NGROUPS_MAX() {
#ifdef _SC_NGROUPS_MAX
    const static int value = _SC_NGROUPS_MAX;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_OPEN_MAX() {
#ifdef _SC_OPEN_MAX
    const static int value = _SC_OPEN_MAX;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_PAGE_SIZE() {
#ifdef _SC_PAGE_SIZE
    const static int value = _SC_PAGE_SIZE;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_PAGESIZE() {
#ifdef _SC_PAGESIZE
    const static int value = _SC_PAGESIZE;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_PRIORITIZED_IO() {
#ifdef _SC_PRIORITIZED_IO
    const static int value = _SC_PRIORITIZED_IO;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_PRIORITY_SCHEDULING() {
#ifdef _SC_PRIORITY_SCHEDULING
    const static int value = _SC_PRIORITY_SCHEDULING;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_RAW_SOCKETS() {
#ifdef _SC_RAW_SOCKETS
    const static int value = _SC_RAW_SOCKETS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_RE_DUP_MAX() {
#ifdef _SC_RE_DUP_MAX
    const static int value = _SC_RE_DUP_MAX;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_READER_WRITER_LOCKS() {
#ifdef _SC_READER_WRITER_LOCKS
    const static int value = _SC_READER_WRITER_LOCKS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_REALTIME_SIGNALS() {
#ifdef _SC_REALTIME_SIGNALS
    const static int value = _SC_REALTIME_SIGNALS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_REGEXP() {
#ifdef _SC_REGEXP
    const static int value = _SC_REGEXP;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_RTSIG_MAX() {
#ifdef _SC_RTSIG_MAX
    const static int value = _SC_RTSIG_MAX;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_SAVED_IDS() {
#ifdef _SC_SAVED_IDS
    const static int value = _SC_SAVED_IDS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_SEM_NSEMS_MAX() {
#ifdef _SC_SEM_NSEMS_MAX
    const static int value = _SC_SEM_NSEMS_MAX;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_SEM_VALUE_MAX() {
#ifdef _SC_SEM_VALUE_MAX
    const static int value = _SC_SEM_VALUE_MAX;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_SEMAPHORES() {
#ifdef _SC_SEMAPHORES
    const static int value = _SC_SEMAPHORES;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_SHARED_MEMORY_OBJECTS() {
#ifdef _SC_SHARED_MEMORY_OBJECTS
    const static int value = _SC_SHARED_MEMORY_OBJECTS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_SHELL() {
#ifdef _SC_SHELL
    const static int value = _SC_SHELL;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_SIGQUEUE_MAX() {
#ifdef _SC_SIGQUEUE_MAX
    const static int value = _SC_SIGQUEUE_MAX;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_SPAWN() {
#ifdef _SC_SPAWN
    const static int value = _SC_SPAWN;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_SPIN_LOCKS() {
#ifdef _SC_SPIN_LOCKS
    const static int value = _SC_SPIN_LOCKS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_SPORADIC_SERVER() {
#ifdef _SC_SPORADIC_SERVER
    const static int value = _SC_SPORADIC_SERVER;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_SS_REPL_MAX() {
#ifdef _SC_SS_REPL_MAX
    const static int value = _SC_SS_REPL_MAX;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_STREAM_MAX() {
#ifdef _SC_STREAM_MAX
    const static int value = _SC_STREAM_MAX;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_SYMLOOP_MAX() {
#ifdef _SC_SYMLOOP_MAX
    const static int value = _SC_SYMLOOP_MAX;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_SYNCHRONIZED_IO() {
#ifdef _SC_SYNCHRONIZED_IO
    const static int value = _SC_SYNCHRONIZED_IO;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_THREAD_ATTR_STACKADDR() {
#ifdef _SC_THREAD_ATTR_STACKADDR
    const static int value = _SC_THREAD_ATTR_STACKADDR;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_THREAD_ATTR_STACKSIZE() {
#ifdef _SC_THREAD_ATTR_STACKSIZE
    const static int value = _SC_THREAD_ATTR_STACKSIZE;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_THREAD_CPUTIME() {
#ifdef _SC_THREAD_CPUTIME
    const static int value = _SC_THREAD_CPUTIME;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_THREAD_DESTRUCTOR_ITERATIONS() {
#ifdef _SC_THREAD_DESTRUCTOR_ITERATIONS
    const static int value = _SC_THREAD_DESTRUCTOR_ITERATIONS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_THREAD_KEYS_MAX() {
#ifdef _SC_THREAD_KEYS_MAX
    const static int value = _SC_THREAD_KEYS_MAX;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_THREAD_PRIO_INHERIT() {
#ifdef _SC_THREAD_PRIO_INHERIT
    const static int value = _SC_THREAD_PRIO_INHERIT;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_THREAD_PRIO_PROTECT() {
#ifdef _SC_THREAD_PRIO_PROTECT
    const static int value = _SC_THREAD_PRIO_PROTECT;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_THREAD_PRIORITY_SCHEDULING() {
#ifdef _SC_THREAD_PRIORITY_SCHEDULING
    const static int value = _SC_THREAD_PRIORITY_SCHEDULING;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_THREAD_PROCESS_SHARED() {
#ifdef _SC_THREAD_PROCESS_SHARED
    const static int value = _SC_THREAD_PROCESS_SHARED;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_THREAD_ROBUST_PRIO_INHERIT() {
#ifdef _SC_THREAD_ROBUST_PRIO_INHERIT
    const static int value = _SC_THREAD_ROBUST_PRIO_INHERIT;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_THREAD_ROBUST_PRIO_PROTECT() {
#ifdef _SC_THREAD_ROBUST_PRIO_PROTECT
    const static int value = _SC_THREAD_ROBUST_PRIO_PROTECT;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_THREAD_SAFE_FUNCTIONS() {
#ifdef _SC_THREAD_SAFE_FUNCTIONS
    const static int value = _SC_THREAD_SAFE_FUNCTIONS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_THREAD_SPORADIC_SERVER() {
#ifdef _SC_THREAD_SPORADIC_SERVER
    const static int value = _SC_THREAD_SPORADIC_SERVER;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_THREAD_STACK_MIN() {
#ifdef _SC_THREAD_STACK_MIN
    const static int value = _SC_THREAD_STACK_MIN;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_THREAD_THREADS_MAX() {
#ifdef _SC_THREAD_THREADS_MAX
    const static int value = _SC_THREAD_THREADS_MAX;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_THREADS() {
#ifdef _SC_THREADS
    const static int value = _SC_THREADS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_TIMEOUTS() {
#ifdef _SC_TIMEOUTS
    const static int value = _SC_TIMEOUTS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_TIMER_MAX() {
#ifdef _SC_TIMER_MAX
    const static int value = _SC_TIMER_MAX;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_TIMERS() {
#ifdef _SC_TIMERS
    const static int value = _SC_TIMERS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_TRACE() {
#ifdef _SC_TRACE
    const static int value = _SC_TRACE;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_TRACE_EVENT_FILTER() {
#ifdef _SC_TRACE_EVENT_FILTER
    const static int value = _SC_TRACE_EVENT_FILTER;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_TRACE_EVENT_NAME_MAX() {
#ifdef _SC_TRACE_EVENT_NAME_MAX
    const static int value = _SC_TRACE_EVENT_NAME_MAX;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_TRACE_INHERIT() {
#ifdef _SC_TRACE_INHERIT
    const static int value = _SC_TRACE_INHERIT;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_TRACE_LOG() {
#ifdef _SC_TRACE_LOG
    const static int value = _SC_TRACE_LOG;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_TRACE_NAME_MAX() {
#ifdef _SC_TRACE_NAME_MAX
    const static int value = _SC_TRACE_NAME_MAX;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_TRACE_SYS_MAX() {
#ifdef _SC_TRACE_SYS_MAX
    const static int value = _SC_TRACE_SYS_MAX;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_TRACE_USER_EVENT_MAX() {
#ifdef _SC_TRACE_USER_EVENT_MAX
    const static int value = _SC_TRACE_USER_EVENT_MAX;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_TTY_NAME_MAX() {
#ifdef _SC_TTY_NAME_MAX
    const static int value = _SC_TTY_NAME_MAX;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_TYPED_MEMORY_OBJECTS() {
#ifdef _SC_TYPED_MEMORY_OBJECTS
    const static int value = _SC_TYPED_MEMORY_OBJECTS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_TZNAME_MAX() {
#ifdef _SC_TZNAME_MAX
    const static int value = _SC_TZNAME_MAX;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_V7_ILP32_OFF32() {
#ifdef _SC_V7_ILP32_OFF32
    const static int value = _SC_V7_ILP32_OFF32;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_V7_ILP32_OFFBIG() {
#ifdef _SC_V7_ILP32_OFFBIG
    const static int value = _SC_V7_ILP32_OFFBIG;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_V7_LP64_OFF64() {
#ifdef _SC_V7_LP64_OFF64
    const static int value = _SC_V7_LP64_OFF64;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_V7_LPBIG_OFFBIG() {
#ifdef _SC_V7_LPBIG_OFFBIG
    const static int value = _SC_V7_LPBIG_OFFBIG;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_V6_ILP32_OFF32() {
#ifdef _SC_V6_ILP32_OFF32
    const static int value = _SC_V6_ILP32_OFF32;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_V6_ILP32_OFFBIG() {
#ifdef _SC_V6_ILP32_OFFBIG
    const static int value = _SC_V6_ILP32_OFFBIG;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_V6_LP64_OFF64() {
#ifdef _SC_V6_LP64_OFF64
    const static int value = _SC_V6_LP64_OFF64;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_V6_LPBIG_OFFBIG() {
#ifdef _SC_V6_LPBIG_OFFBIG
    const static int value = _SC_V6_LPBIG_OFFBIG;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_VERSION() {
#ifdef _SC_VERSION
    const static int value = _SC_VERSION;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_XOPEN_CRYPT() {
#ifdef _SC_XOPEN_CRYPT
    const static int value = _SC_XOPEN_CRYPT;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_XOPEN_ENH_I18N() {
#ifdef _SC_XOPEN_ENH_I18N
    const static int value = _SC_XOPEN_ENH_I18N;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_XOPEN_REALTIME() {
#ifdef _SC_XOPEN_REALTIME
    const static int value = _SC_XOPEN_REALTIME;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_XOPEN_REALTIME_THREADS() {
#ifdef _SC_XOPEN_REALTIME_THREADS
    const static int value = _SC_XOPEN_REALTIME_THREADS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_XOPEN_SHM() {
#ifdef _SC_XOPEN_SHM
    const static int value = _SC_XOPEN_SHM;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_XOPEN_STREAMS() {
#ifdef _SC_XOPEN_STREAMS
    const static int value = _SC_XOPEN_STREAMS;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_XOPEN_UNIX() {
#ifdef _SC_XOPEN_UNIX
    const static int value = _SC_XOPEN_UNIX;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_XOPEN_UUCP() {
#ifdef _SC_XOPEN_UUCP
    const static int value = _SC_XOPEN_UUCP;
    return &value;
#else
    return NULL;
#endif
}

const int* SP_SC_XOPEN_VERSION() {
#ifdef _SC_XOPEN_VERSION
    const static int value = _SC_XOPEN_VERSION;
    return &value;
#else
    return NULL;
#endif
}

//MARK: Special Characters
const unsigned char* SP_POSIX_VDISABLE() {
#ifdef _POSIX_VDISABLE
    const static unsigned char value = _POSIX_VDISABLE;
    return &value;
#else
    return NULL;
#endif
}

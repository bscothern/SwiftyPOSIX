//
//  SP_unistd.h
//  SwiftyPOSIX
//
//  Created by Braden Scothern on 9/3/18.
//  Copyright © 2018 Braden Scothern. All rights reserved.
//

#ifndef SP_unistd_h
#define SP_unistd_h

// This file contains functions that act as shims for all the #dfines in <unistd.h>.
// Because the don't have to be defined and Swift is unable to detect them these functions are used to ensure all values are defined with an appropriate value.

//MARK:- Version Test Macros

long SP_POSIX_VERSION(void);
const long* SP_POSIX2_VERSION(void);
const int* SP_POSIX_SUBPROFILE(void);
const int* SP_XOPEN_VERSION(void);

//MARK:- Constants for Options and Option Groups

//MARK: _POSIX_ defines
const int* SP_POSIX_ADVISORY_INFO(void);
const int* SP_POSIX_ASYNCHRONOUS_IO(void);
const int* SP_POSIX_BARRIERS(void);
const int* SP_POSIX_CHOWN_RESTRICTED(void);
const int* SP_POSIX_CLOCK_SELECTION(void);
const int* SP_POSIX_CPUTIME(void);
const int* SP_POSIX_FSYNC(void);
const int* SP_POSIX_IPV6(void);
const int* SP_POSIX_JOB_CONTROL(void);
const int* SP_POSIX_MAPPED_FILES(void);
const int* SP_POSIX_MEMLOCK(void);
const int* SP_POSIX_MEMLOCK_RANGE(void);
const int* SP_POSIX_MEMORY_PROTECTION(void);
const int* SP_POSIX_MESSAGE_PASSING(void);
const int* SP_POSIX_MONOTONIC_CLOCK(void);
const int* SP_POSIX_NO_TRUNC(void);
const int* SP_POSIX_PRIORITIZED_IO(void);
const int* SP_POSIX_PRIORITY_SCHEDULING(void);
const int* SP_POSIX_RAW_SOCKETS(void);
const int* SP_POSIX_READER_WRITER_LOCKS(void);
const int* SP_POSIX_REALTIME_SIGNALS(void);
const int* SP_POSIX_REGEXP(void);
const int* SP_POSIX_SAVED_IDS(void);
const int* SP_POSIX_SEMAPHORES(void);
const int* SP_POSIX_SHARED_MEMORY_OBJECTS(void);
const int* SP_POSIX_SHELL(void);
const int* SP_POSIX_SPAWN(void);
const int* SP_POSIX_SPIN_LOCKS(void);
const int* SP_POSIX_SPORADIC_SERVER(void);
const int* SP_POSIX_SYNCHRONIZED_IO(void);
const int* SP_POSIX_THREAD_ATTR_STACKADDR(void);
const int* SP_POSIX_THREAD_ATTR_STACKSIZE(void);
const int* SP_POSIX_THREAD_CPUTIME(void);
const int* SP_POSIX_THREAD_PRIO_INHERIT(void);
const int* SP_POSIX_THREAD_PRIO_PROTECT(void);
const int* SP_POSIX_THREAD_PRIORITY_SCHEDULING(void);
const int* SP_POSIX_THREAD_PROCESS_SHARED(void);
const int* SP_POSIX_THREAD_ROBUST_PRIO_INHERIT(void);
const int* SP_POSIX_THREAD_ROBUST_PRIO_PROTECT(void);
const int* SP_POSIX_THREAD_SAFE_FUNCTIONS(void);
const int* SP_POSIX_THREAD_SPORADIC_SERVER(void);
const int* SP_POSIX_THREADS(void);
const int* SP_POSIX_TIMEOUTS(void);
const int* SP_POSIX_TIMERS(void);
const int* SP_POSIX_TRACE(void);
const int* SP_POSIX_TRACE_EVENT_FILTER(void);
const int* SP_POSIX_TRACE_INHERIT(void);
const int* SP_POSIX_TRACE_LOG(void);
const int* SP_POSIX_TYPED_MEMORY_OBJECTS(void);

//MARK: POSIX V6
const int* SP_POSIX_V6_ILP32_OFF32(void);
const int* SP_POSIX_V6_ILP32_OFFBIG(void);
const int* SP_POSIX_V6_LP64_OFF64(void);
const int* SP_POSIX_V6_LPBIG_OFFBIG(void);

//MARK: POSIX V7
const int* SP_POSIX_V7_ILP32_OFF32(void);
const int* SP_POSIX_V7_ILP32_OFFBIG(void);
const int* SP_POSIX_V7_LP64_OFF64(void);
const int* SP_POSIX_V7_LPBIG_OFFBIG(void);

//MARK: POSIX2
const int* SP_POSIX2_C_BIND(void);
const int* SP_POSIX2_C_DEV(void);
const int* SP_POSIX2_CHAR_TERM(void);
const int* SP_POSIX2_FORT_DEV(void);
const int* SP_POSIX2_FORT_RUN(void);
const int* SP_POSIX2_LOCALEDEF(void);
const int* SP_POSIX2_PBS(void);
const int* SP_POSIX2_PBS_ACCOUNTING(void);
const int* SP_POSIX2_PBS_CHECKPOINT(void);
const int* SP_POSIX2_PBS_LOCATE(void);
const int* SP_POSIX2_PBS_MESSAGE(void);
const int* SP_POSIX2_PBS_TRACK(void);
const int* SP_POSIX2_SW_DEV(void);
const int* SP_POSIX2_UPE(void);

//MARK: XOPEN
const int* SP_XOPEN_CRYPT(void);
const int* SP_XOPEN_ENH_I18N(void);
const int* SP_XOPEN_REALTIME(void);
const int* SP_XOPEN_REALTIME_THREADS(void);
const int* SP_XOPEN_SHM(void);
const int* SP_XOPEN_STREAMS(void);
const int* SP_XOPEN_UNIX(void);
const int* SP_XOPEN_UUCP(void);

//MARK:- Execution-Time Symbolic Constants
const int* SP_POSIX_ASYNC_IO(void);
const int* SP_POSIX_PRIO_IO(void);
const int* SP_POSIX_SYNC_IO(void);
const int* SP_POSIX_TIMESTAMP_RESOLUTION(void);
const int* SP_POSIX2_SYMLINKS(void);

//MARK:- Constants For Functions
const int* SP_CS_PATH(void);
const int* SP_CS_POSIX_V7_ILP32_OFF32_CFLAGS(void);
const int* SP_CS_POSIX_V7_ILP32_OFF32_LDFLAGS(void);
const int* SP_CS_POSIX_V7_ILP32_OFF32_LIBS(void);
const int* SP_CS_POSIX_V7_ILP32_OFFBIG_CFLAGS(void);
const int* SP_CS_POSIX_V7_ILP32_OFFBIG_LDFLAGS(void);
const int* SP_CS_POSIX_V7_ILP32_OFFBIG_LIBS(void);
const int* SP_CS_POSIX_V7_LP64_OFF64_CFLAGS(void);
const int* SP_CS_POSIX_V7_LP64_OFF64_LDFLAGS(void);
const int* SP_CS_POSIX_V7_LP64_OFF64_LIBS(void);
const int* SP_CS_POSIX_V7_LPBIG_OFFBIG_CFLAGS(void);
const int* SP_CS_POSIX_V7_LPBIG_OFFBIG_LDFLAGS(void);
const int* SP_CS_POSIX_V7_LPBIG_OFFBIG_LIBS(void);
const int* SP_CS_POSIX_V7_THREADS_CFLAGS(void);
const int* SP_CS_POSIX_V7_THREADS_LDFLAGS(void);
const int* SP_CS_POSIX_V7_WIDTH_RESTRICTED_ENVS(void);
const int* SP_CS_V7_ENV(void);

const int* SP_CS_POSIX_V6_ILP32_OFF32_CFLAGS(void);
const int* SP_CS_POSIX_V6_ILP32_OFF32_LDFLAGS(void);
const int* SP_CS_POSIX_V6_ILP32_OFF32_LIBS(void);
const int* SP_CS_POSIX_V6_ILP32_OFFBIG_CFLAGS(void);
const int* SP_CS_POSIX_V6_ILP32_OFFBIG_LDFLAGS(void);
const int* SP_CS_POSIX_V6_ILP32_OFFBIG_LIBS(void);
const int* SP_CS_POSIX_V6_LP64_OFF64_CFLAGS(void);
const int* SP_CS_POSIX_V6_LP64_OFF64_LDFLAGS(void);
const int* SP_CS_POSIX_V6_LP64_OFF64_LIBS(void);
const int* SP_CS_POSIX_V6_LPBIG_OFFBIG_CFLAGS(void);
const int* SP_CS_POSIX_V6_LPBIG_OFFBIG_LDFLAGS(void);
const int* SP_CS_POSIX_V6_LPBIG_OFFBIG_LIBS(void);
const int* SP_CS_POSIX_V6_WIDTH_RESTRICTED_ENVS(void);
const int* SP_CS_V6_ENV(void);

/*
const int* SP<#Description#>(void);
const int* SP<#Description#>(void);
const int* SP<#Description#>(void);
const int* SP<#Description#>(void);
const int* SP<#Description#>(void);
const int* SP<#Description#>(void);
 */

#endif /* SP_unistd_h */

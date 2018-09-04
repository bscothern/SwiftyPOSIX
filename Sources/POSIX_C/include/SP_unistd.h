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
const int* SP_POSIX_SUBPROFILE(void);
long SP_POSIX2_VERSION(void);
const int* SP_XOPEN_VERSION(void);

//MARK:- Constants for Options and Option Groups

//MARK: _POSIX_ defines
int SP_POSIX_ADVISORY_INFO(void);
int SP_POSIX_ASYNCHRONOUS_IO(void);
int SP_POSIX_BARRIERS(void);
int SP_POSIX_CHOWN_RESTRICTED(void);
int SP_POSIX_CLOCK_SELECTION(void);
int SP_POSIX_CPUTIME(void);
int SP_POSIX_FSYNC(void);
int SP_POSIX_IPV6(void);
int SP_POSIX_JOB_CONTROL(void);
int SP_POSIX_MAPPED_FILES(void);
int SP_POSIX_MEMLOCK(void);
int SP_POSIX_MEMLOCK_RANGE(void);
int SP_POSIX_MEMORY_PROTECTION(void);
int SP_POSIX_MESSAGE_PASSING(void);
int SP_POSIX_MONOTONIC_CLOCK(void);
int SP_POSIX_NO_TRUNC(void);
int SP_POSIX_PRIORITIZED_IO(void);
int SP_POSIX_PRIORITY_SCHEDULING(void);
int SP_POSIX_RAW_SOCKETS(void);
int SP_POSIX_READER_WRITER_LOCKS(void);
int SP_POSIX_REALTIME_SIGNALS(void);
int SP_POSIX_REGEXP(void);
int SP_POSIX_SAVED_IDS(void);
int SP_POSIX_SEMAPHORES(void);
int SP_POSIX_SHARED_MEMORY_OBJECTS(void);
int SP_POSIX_SHELL(void);
int SP_POSIX_SPAWN(void);
int SP_POSIX_SPIN_LOCKS(void);
int SP_POSIX_SPORADIC_SERVER(void);
int SP_POSIX_SYNCHRONIZED_IO(void);
int SP_POSIX_THREAD_ATTR_STACKADDR(void);
int SP_POSIX_THREAD_ATTR_STACKSIZE(void);
int SP_POSIX_THREAD_CPUTIME(void);
int SP_POSIX_THREAD_PRIO_INHERIT(void);
int SP_POSIX_THREAD_PRIO_PROTECT(void);
int SP_POSIX_THREAD_PRIORITY_SCHEDULING(void);
int SP_POSIX_THREAD_PROCESS_SHARED(void);
int SP_POSIX_THREAD_ROBUST_PRIO_INHERIT(void);
int SP_POSIX_THREAD_ROBUST_PRIO_PROTECT(void);
int SP_POSIX_THREAD_SAFE_FUNCTIONS(void);
int SP_POSIX_THREAD_SPORADIC_SERVER(void);
int SP_POSIX_THREADS(void);
int SP_POSIX_TIMEOUTS(void);
int SP_POSIX_TIMERS(void);
int SP_POSIX_TRACE(void);
int SP_POSIX_TRACE_EVENT_FILTER(void);
int SP_POSIX_TRACE_INHERIT(void);
int SP_POSIX_TRACE_LOG(void);
int SP_POSIX_TYPED_MEMORY_OBJECTS(void);

//MARK: POSIX V6
int SP_POSIX_V6_ILP32_OFF32(void);
int SP_POSIX_V6_ILP32_OFFBIG(void);
int SP_POSIX_V6_LP64_OFF64(void);
int SP_POSIX_V6_LPBIG_OFFBIG(void);

//MARK: POSIX V7
int SP_POSIX_V7_ILP32_OFF32(void);
int SP_POSIX_V7_ILP32_OFFBIG(void);
int SP_POSIX_V7_LP64_OFF64(void);
int SP_POSIX_V7_LPBIG_OFFBIG(void);

//MARK: POSIX2
int SP_POSIX2_C_BIND(void);
int SP_POSIX2_C_DEV(void);
int SP_POSIX2_CHAR_TERM(void);
int SP_POSIX2_FORT_DEV(void);
int SP_POSIX2_FORT_RUN(void);
int SP_POSIX2_LOCALEDEF(void);
int SP_POSIX2_PBS(void);
int SP_POSIX2_PBS_ACCOUNTING(void);
int SP_POSIX2_PBS_CHECKPOINT(void);
int SP_POSIX2_PBS_LOCATE(void);
int SP_POSIX2_PBS_MESSAGE(void);
int SP_POSIX2_PBS_TRACK(void);
int SP_POSIX2_SW_DEV(void);
int SP_POSIX2_UPE(void);

//MARK: XOPEN
int SP_XOPEN_CRYPT(void);
int SP_XOPEN_ENH_I18N(void);
int SP_XOPEN_REALTIME(void);
int SP_XOPEN_REALTIME_THREADS(void);
int SP_XOPEN_SHM(void);
int SP_XOPEN_STREAMS(void);
int SP_XOPEN_UNIX(void);
int SP_XOPEN_UUCP(void);

/*
int SP<#Description#>(void);
int SP<#Description#>(void);
int SP<#Description#>(void);
int SP<#Description#>(void);
int SP<#Description#>(void);
int SP<#Description#>(void);
 */

#endif /* SP_unistd_h */

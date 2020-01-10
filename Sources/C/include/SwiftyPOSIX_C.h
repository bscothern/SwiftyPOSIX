//
//  SwiftyPOSIX_C.h
//  SwiftyPOSIX
//
//  Created by Braden Scothern on 4/17/18.
//  Copyright © 2018-2020 Braden Scothern. All rights reserved.
//

#ifndef SwiftyPOSIX_C_h
#define SwiftyPOSIX_C_h

// Included first because it defines the flags that determine availablity of different components of the system
#include <unistd.h>

#include <aio.h>
#include <arpa/inet.h>
#include <assert.h>
#include <complex.h>
#include <cpio.h>
#include <ctype.h>
#include <dirent.h>
#include <dlfcn.h>
#include <errno.h>
#include <fcntl.h>
#include <fenv.h>
#include <float.h>
#include <fmtmsg.h>
#include <fnmatch.h>
#include <ftw.h>
#include <glob.h>
#include <grp.h>
#include <iconv.h>
//#include <inttypes.h>
#include <iso646.h>
#include <langinfo.h>
#include <libgen.h>
#include <limits.h>
#include <locale.h>
#include <math.h>
#include <monetary.h>
#if _POSIX_MESSAGE_PASSING >= 0
//#include <mqueue.h>
#endif
#ifndef __linux__
#include <ndbm.h>
#endif
#include <net/if.h>
#include <netdb.h>
#include <netinet/in.h>
#include <netinet/tcp.h>
#include <nl_types.h>
#include <poll.h>
#include <pthread.h>
#include <pwd.h>
#include <regex.h>
#include <sched.h>
#include <search.h>
#include <semaphore.h>
#include <setjmp.h>
#include <signal.h>
#include <spawn.h>
#include <stdarg.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <strings.h>
//#include <stropts.h>
#include <sys/ipc.h>
#include <sys/mman.h>
#include <sys/msg.h>
#include <sys/resource.h>
#include <sys/select.h>
#include <sys/sem.h>
#include <sys/shm.h>
#include <sys/socket.h>
#include <sys/stat.h>
#include <sys/statvfs.h>
#include <sys/time.h>
#include <sys/times.h>
#include <sys/types.h>
#include <sys/uio.h>
#include <sys/un.h>
#include <sys/utsname.h>
#include <sys/wait.h>
#include <syslog.h>
#include <tar.h>
#include <termios.h>
#include <tgmath.h>
#include <time.h>
//#include <trace.h>
#include <ulimit.h>
#include <utime.h>
#include <utmpx.h>
#include <wchar.h>
#include <wctype.h>
#include <wordexp.h>

#endif /* SwiftyPOSIX_C_h */

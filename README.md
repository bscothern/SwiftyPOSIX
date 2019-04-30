# SwiftyPOSIX

[![Build Status](https://travis-ci.org/bscothern/SwiftyPOSIX.svg?branch=master)](https://travis-ci.org/bscothern/SwiftyPOSIX)

A Swift wrapper around the C POSIX Standard.

A primary purpose of this library is to mke the POSIX functions feel like first class Swift objects.

## C Conventions
All Types and functions are prefixed with SP.

## POSIX Headers

These headers have been identified from the the downloaded version of standard which is included in `POSIX.1-2017/` and taken from [here](http://pubs.opengroup.org/onlinepubs/9699919799/).
To see the entire set of standards open `POSIX.1-2017/index.html`.

- [ ] aio.h
- [ ] arpa/inet.h
- [ ] assert
- [ ] complex.h
- [x] cpio.h
- [ ] ctype.h
- [ ] dirent.h
- [ ] dlfcn.h
- [x] errno.h <sup>1</sup>
- [ ] fcntl.h
- [ ] fenv.h
- [ ] float.h
- [ ] fmtmsg.h
- [ ] fnmatch.h
- [ ] ftw.h
- [ ] glob.h
- [ ] grp.h
- [ ] iconv.h
- [ ] inttypes.h
- [ ] iso646.h
- [ ] langinfo.h
- [ ] libgen.h
- [ ] limits.h
- [ ] locale.h
- [ ] math.h
- [ ] monetary.h
- [ ] mqueue.h
- [ ] ndbm.h
- [ ] net/if.h
- [ ] netdb.h
- [ ] netinet/in.h
- [ ] netinet/tcp.h
- [ ] nl_types.h
- [ ] poll.h
- [ ] pthread.h *
- [ ] pwd.h
- [ ] regex.h
- [ ] sched.h
- [ ] search.h
- [ ] semaphore.h
- [ ] setjmp.h
- [ ] signal.h
- [ ] spawn.h
- [ ] stdarg.h
- [ ] stdbool.h
- [ ] stddef.h
- [ ] stdint.h
- [ ] stdio.h
- [ ] stdlib.h
- [ ] string.h
- [ ] stropts.h
- [ ] sys/ipc.h
- [ ] sys/mman.h
- [ ] sys/msg.h
- [ ] sys/resource.h
- [ ] sys/select.h
- [ ] sys/sem.h
- [ ] sys/shm.h
- [ ] sys/socket.h
- [ ] sys/stat.h
- [ ] sys/statvfs.h
- [ ] sys/time.h
- [ ] sys/times.h
- [ ] sys/types.h
- [ ] sys/uio.h
- [ ] sys/utsname.h
- [ ] sys/wait.h
- [ ] syslog.h
- [ ] tar.h
- [ ] termios.h
- [ ] tgmath.h
- [ ] time.h
- [ ] trace.h
- [ ] ulimit.h
- [x] unistd.h <sup>2 3</sup>
- [ ] utime.h
- [ ] utmpx.h
- [ ] wchar.h
- [ ] wctype.h
- [ ] wordexp.h

### Superscript Key
* \* -- In Progress
* 1 -- Convenience TODOs are present and need more implementaiton before being finished.
* 2 -- Naming cleanup is needed.
* 3 -- Compile time expressions need to be marked when supported. [See](https://forums.swift.org/t/compile-time-constant-expressions-for-swift/12879)

//
//  Errno.swift
//  SwiftyPOSIX
//
//  Created by Braden Scothern on 3/26/18.
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

/// **System Error Numbers**
///
/// The value of errno should only be examined when it is indicated to be valid by a function's return value.
/// No function in this volume of POSIX.1-2017 shall set Errno.value to zero/nil.
/// For each thread of a process, Errno.value shall not be affected by function calls or assignments to Errno.value by other threads.
///
/// - Note: `<errno.h>`
public enum Errno: Int32, Error, Codable, CustomStringConvertible, CustomDebugStringConvertible {
    //MARK: POSIX error definitions
    case E2BIG
    case EACCES
    case EADDRINUSE
    case EADDRNOTAVAIL
    case EAFNOSUPPORT
    case EAGAIN
    case EALREADY
    case EBADF
    case EBADMSG
    case EBUSY
    case ECANCELED
    case ECHILD
    case ECONNABORTED
    case ECONNREFUSED
    case ECONNRESET
    case EDEADLK
    case EDESTADDRREQ
    case EDOM
    case EDQUOT
    case EEXIST
    case EFAULT
    case EFBIG
    case EHOSTUNREACH
    case EIDRM
    case EILSEQ
    case EINPROGRESS
    case EINTR
    case EINVAL
    case EIO
    case EISCONN
    case EISDIR
    case ELOOP
    case EMFILE
    case EMLINK
    case EMSGSIZE
    case EMULTIHOP
    case ENAMETOOLONG
    case ENETDOWN
    case ENETRESET
    case ENETUNREACH
    case ENFILE
    case ENOBUFS
    case ENODATA
    case ENODEV
    case ENOENT
    case ENOEXEC
    case ENOLCK
    case ENOLINK
    case ENOMEM
    case ENOMSG
    case ENOPROTOOPT
    case ENOSPC
    case ENOSR
    case ENOSTR
    case ENOSYS
    case ENOTCONN
    case ENOTDIR
    case ENOTEMPTY
    case ENOTRECOVERABLE
    case ENOTSOCK
    case ENOTSUP
    case ENOTTY
    case ENXIO
    case EOPNOTSUPP
    case EOVERFLOW
    case EOWNERDEAD
    case EPERM
    case EPIPE
    case EPROTO
    case EPROTONOSUPPORT
    case EPROTOTYPE
    case ERANGE
    case EROFS
    case ESPIPE
    case ESRCH
    case ESTALE
    case ETIME
    case ETIMEDOUT
    case ETXTBSY
    case EWOULDBLOCK
    case EXDEV

    //MARK: System definitions
    #if os(iOS) || os(macOS) || os(tvOS) || os(watchOS)
    case ENOTBLK
    case ESOCKTNOSUPPORT
    case EPFNOSUPPORT
    case ESHUTDOWN
    case ETOOMANYREFS
    case EHOSTDOWN
    case EPROCLIM
    case EUSERS
    case EREMOTE
    case EBADRPC
    case ERPCMISMATCH
    case EPROGUNAVAIL
    case EPROGMISMATCH
    case EPROCUNAVAIL
    case EFTYPE
    case EAUTH
    case ENEEDAUTH
    case EPWROFF
    case EDEVERR
    case EBADEXEC
    case EBADARCH
    case ESHLIBVERS
    case EBADMACHO
    case ENOATTR
    case ENOPOLICY
    case EQFULL
    case ELAST
    #endif

    //MARK:- Properties
    //MARK: Public Static
    public static var value: Errno? {
        set {
            errno = newValue?.rawValue ?? 0
        }
        get {
            return Errno()
        }
    }

    //MARK: Public
    public var rawValue: Int32 {
        return cValue(ofErrno: self)
    }

    public var isSystemDefined: Bool {
        switch self {
        #if os(iOS) || os(macOS) || os(tvOS) || os(watchOS)
        case .ENOTBLK,
             .ESOCKTNOSUPPORT,
             .EPFNOSUPPORT,
             .ESHUTDOWN,
             .ETOOMANYREFS,
             .EHOSTDOWN,
             .EPROCLIM,
             .EUSERS,
             .EREMOTE,
             .EBADRPC,
             .ERPCMISMATCH,
             .EPROGUNAVAIL,
             .EPROGMISMATCH,
             .EPROCUNAVAIL,
             .EFTYPE,
             .EAUTH,
             .ENEEDAUTH,
             .EPWROFF,
             .EDEVERR,
             .EBADEXEC,
             .EBADARCH,
             .ESHLIBVERS,
             .EBADMACHO,
             .ENOATTR,
             .ENOPOLICY,
             .EQFULL,
             .ELAST:
            return true
        #endif
        default:
            return false
        }
    }

    //TODO: Convert Errno to debug string via strerror()

    /// A textual representation of this instance, suitable for debugging.
    ///
    /// The resulting `String` describes the `Errno` value as documented in the POSIX standard if present otherwise the system header.
    public var description: String {
        switch self {
        case .E2BIG:
            return "Argument list too long."
        case .EACCES:
            return "Permission denied."
        case .EADDRINUSE:
            return "Address in use."
        case .EADDRNOTAVAIL:
            return "Address not available."
        case .EAFNOSUPPORT:
            return "Address family not supported."
        case .EAGAIN:
            return "Resource unavailable, try again (may be the same value as [EWOULDBLOCK])."
        case .EALREADY:
            return "Connection already in progress."
        case .EBADF:
            return "Bad file descriptor."
        case .EBADMSG:
            return "Bad message."
        case .EBUSY:
            return "Device or resource busy."
        case .ECANCELED:
            return "Operation canceled."
        case .ECHILD:
            return "No child processes."
        case .ECONNABORTED:
            return "Connection aborted."
        case .ECONNREFUSED:
            return "Connection refused."
        case .ECONNRESET:
            return "Connection reset."
        case .EDEADLK:
            return "Resource deadlock would occur."
        case .EDESTADDRREQ:
            return "Destination address required."
        case .EDOM:
            return "Mathematics argument out of domain of function."
        case .EDQUOT:
            return "Reserved."
        case .EEXIST:
            return "File exists."
        case .EFAULT:
            return "Bad address."
        case .EFBIG:
            return "File too large."
        case .EHOSTUNREACH:
            return "Host is unreachable."
        case .EIDRM:
            return "Identifier removed."
        case .EILSEQ:
            return "Illegal byte sequence."
        case .EINPROGRESS:
            return "Operation in progress."
        case .EINTR:
            return "Interrupted function."
        case .EINVAL:
            return "Invalid argument."
        case .EIO:
            return "I/O error."
        case .EISCONN:
            return "Socket is connected."
        case .EISDIR:
            return "Is a directory."
        case .ELOOP:
            return "Too many levels of symbolic links."
        case .EMFILE:
            return "File descriptor value too large."
        case .EMLINK:
            return "Too many links."
        case .EMSGSIZE:
            return "Message too large."
        case .EMULTIHOP:
            return "Reserved."
        case .ENAMETOOLONG:
            return "Filename too long."
        case .ENETDOWN:
            return "Network is down."
        case .ENETRESET:
            return "Connection aborted by network."
        case .ENETUNREACH:
            return "Network unreachable."
        case .ENFILE:
            return "Too many files open in system."
        case .ENOBUFS:
            return "No buffer space available."
        case .ENODATA:
            return "No message is available on the STREAM head read queue."
        case .ENODEV:
            return "No such device."
        case .ENOENT:
            return "No such file or directory."
        case .ENOEXEC:
            return "Executable file format error."
        case .ENOLCK:
            return "No locks available."
        case .ENOLINK:
            return "Reserved."
        case .ENOMEM:
            return "Not enough space."
        case .ENOMSG:
            return "No message of the desired type."
        case .ENOPROTOOPT:
            return "Protocol not available."
        case .ENOSPC:
            return "No space left on device."
        case .ENOSR:
            return "No STREAM resources."
        case .ENOSTR:
            return "Not a STREAM."
        case .ENOSYS:
            return "Functionality not supported."
        case .ENOTCONN:
            return "The socket is not connected."
        case .ENOTDIR:
            return "Not a directory or a symbolic link to a directory."
        case .ENOTEMPTY:
            return "Directory not empty."
        case .ENOTRECOVERABLE:
            return "State not recoverable."
        case .ENOTSOCK:
            return "Not a socket."
        case .ENOTSUP:
            return "Not supported (may be the same value as [EOPNOTSUPP])."
        case .ENOTTY:
            return "Inappropriate I/O control operation."
        case .ENXIO:
            return "No such device or address."
        case .EOPNOTSUPP:
            return "Operation not supported on socket (may be the same value as [ENOTSUP])."
        case .EOVERFLOW:
            return "Value too large to be stored in data type."
        case .EOWNERDEAD:
            return "Previous owner died."
        case .EPERM:
            return "Operation not permitted."
        case .EPIPE:
            return "Broken pipe."
        case .EPROTO:
            return "Protocol error."
        case .EPROTONOSUPPORT:
            return "Protocol not supported."
        case .EPROTOTYPE:
            return "Protocol wrong type for socket."
        case .ERANGE:
            return "Result too large."
        case .EROFS:
            return "Read-only file system."
        case .ESPIPE:
            return "Invalid seek."
        case .ESRCH:
            return "No such process."
        case .ESTALE:
            return "Reserved."
        case .ETIME:
            return "Stream ioctl() timeout."
        case .ETIMEDOUT:
            return "Connection timed out."
        case .ETXTBSY:
            return "Text file busy."
        case .EWOULDBLOCK:
            return "Operation would block (may be the same value as [EAGAIN])."
        case .EXDEV:
            return "Cross-device link."
        #if os(iOS) || os(macOS) || os(tvOS) || os(watchOS)
        case .ENOTBLK:
            return "Block device required."
        case .ESOCKTNOSUPPORT:
            return "Socket type not supported."
        case .EPFNOSUPPORT:
            return "Protocol family not supported."
        case .ESHUTDOWN:
            return "Can't send after socket shutdown."
        case .ETOOMANYREFS:
            return "Too many references: can't splice."
        case .EHOSTDOWN:
            return "Host is down."
        case .EPROCLIM:
            return "Too many processes."
        case .EUSERS:
            return "Too many users."
        case .EREMOTE:
            return "Too many levels of remote in path."
        case .EBADRPC:
            return "RPC struct is bad."
        case .ERPCMISMATCH:
            return "RPC version wrong."
        case .EPROGUNAVAIL:
            return "RPC prog. not avail."
        case .EPROGMISMATCH:
            return "Program version wrong."
        case .EPROCUNAVAIL:
            return "Bad procedure for program."
        case .EFTYPE:
            return "Inappropriate file type or format."
        case .EAUTH:
            return "Authentication error."
        case .ENEEDAUTH:
            return "Need authenticator."
        case .EPWROFF:
            return "Device power is off."
        case .EDEVERR:
            return "Device error, e.g. paper out."
        case .EBADEXEC:
            return "Bad executable."
        case .EBADARCH:
            return "Bad CPU type in executable."
        case .ESHLIBVERS:
            return "Shared library version mismatch."
        case .EBADMACHO:
            return "Malformed Macho file."
        case .ENOATTR:
            return "Attribute not found."
        case .ENOPOLICY:
            return "No such policy registered."
        case .EQFULL:
            return "Interface output queue is full."
        case .ELAST:
            return "Must be equal largest errno."
        #endif
        }
    }

    public var debugDescription: String {
        switch self {
        case .E2BIG:
            return """
            Argument list too long. The sum of the number of bytes used by the new process image's argument list and environment list is greater than the system-imposed limit of {ARG_MAX} bytes.

            or:

            Lack of space in an output buffer.

            or:

            Argument is greater than the system-imposed maximum.
            """
        case .EACCES:
            return "Permission denied. An attempt was made to access a file in a way forbidden by its file access permissions."
        case .EADDRINUSE:
            return "Address in use. The specified address is in use."
        case .EADDRNOTAVAIL:
            return "Address not available. The specified address is not available from the local system."
        case .EAFNOSUPPORT:
            return "Address family not supported. The implementation does not support the specified address family, or the specified address is not a valid address for the address family of the specified socket."
        case .EAGAIN:
            return "Resource temporarily unavailable. This is a temporary condition and later calls to the same routine may complete normally."
        case .EALREADY:
            return "Connection already in progress. A connection request is already in progress for the specified socket."
        case .EBADF:
            return "Bad file descriptor. A file descriptor argument is out of range, refers to no open file, or a read (write) request is made to a file that is only open for writing (reading)."
        case .EBADMSG:
            return """
            Bad message. During a read(), getmsg(), getpmsg(), or ioctl() I_RECVFD request to a STREAMS device, a message arrived at the head of the STREAM that is inappropriate for the function receiving the message.
            read()
            Message waiting to be read on a STREAM is not a data message.
            getmsg() or getpmsg()
            A file descriptor was received instead of a control message.
            ioctl()
            Control or data information was received instead of a file descriptor when I_RECVFD was specified. [Option End]
            or:

            Bad Message. The implementation has detected a corrupted message.
            """
        case .EBUSY:
            return "Resource busy. An attempt was made to make use of a system resource that is not currently available, as it is being used by another process in a manner that would have conflicted with the request being made by this process."
        case .ECANCELED:
            return "Resource busy. An attempt was made to make use of a system resource that is not currently available, as it is being used by another process in a manner that would have conflicted with the request being made by this process."
        case .ECHILD:
            return "No child process. A wait(), waitid(), or waitpid() function was executed by a process that had no existing or unwaited-for child process."
        case .ECONNABORTED:
            return "Connection aborted. The connection has been aborted."
        case .ECONNREFUSED:
            return "Connection refused. An attempt to connect to a socket was refused because there was no process listening or because the queue of connection requests was full and the underlying protocol does not support retransmissions."
        case .ECONNRESET:
            return "Connection reset. The connection was forcibly closed by the peer."
        case .EDEADLK:
            return "Resource deadlock would occur. An attempt was made to lock a system resource that would have resulted in a deadlock situation."
        case .EDESTADDRREQ:
            return "Destination address required. No bind address was established."
        case .EDOM:
            return "Domain error. An input argument is outside the defined domain of the mathematical function (defined in the ISO C standard)."
        case .EDQUOT:
            return "Reserved."
        case .EEXIST:
            return "File exists. An existing file was mentioned in an inappropriate context; for example, as a new link name in the link() function."
        case .EFAULT:
            return "Bad address. The system detected an invalid address in attempting to use an argument of a call. The reliable detection of this error cannot be guaranteed, and when not detected may result in the generation of a signal, indicating an address violation, which is sent to the process."
        case .EFBIG:
            return "File too large. The size of a file would exceed the maximum file size of an implementation or offset maximum established in the corresponding file description."
        case .EHOSTUNREACH:
            return "Host is unreachable. The destination host cannot be reached (probably because the host is down or a remote router cannot reach it)."
        case .EIDRM:
            return "Identifier removed. Returned during XSI interprocess communication if an identifier has been removed from the system."
        case .EILSEQ:
            return "Illegal byte sequence. A wide-character code has been detected that does not correspond to a valid character, or a byte sequence does not form a valid wide-character code (defined in the ISO C standard)."
        case .EINPROGRESS:
            return """
            Operation in progress. This code is used to indicate that an asynchronous operation has not yet completed.
            or:

            O_NONBLOCK is set for the socket file descriptor and the connection cannot be immediately established.
            """
        case .EINTR:
            return "Interrupted function call. An asynchronous signal was caught by the process during the execution of an interruptible function. If the signal handler performs a normal return, the interrupted function call may return this condition (see the Base Definitions volume of POSIX.1-2017, <signal.h>)."
        case .EINVAL:
            return "Invalid argument. Some invalid argument was supplied; for example, specifying an undefined signal in a signal() function or a kill() function."
        case .EIO:
            return "Input/output error. Some physical input or output error has occurred. This error may be reported on a subsequent operation on the same file descriptor. Any other error-causing operation on the same file descriptor may cause the [EIO] error indication to be lost."
        case .EISCONN:
            return "Socket is connected. The specified socket is already connected."
        case .EISDIR:
            return "Is a directory. An attempt was made to open a directory with write mode specified."
        case .ELOOP:
            return "Symbolic link loop. A loop exists in symbolic links encountered during pathname resolution. This error may also be returned if more than {SYMLOOP_MAX} symbolic links are encountered during pathname resolution."
        case .EMFILE:
            return "File descriptor value too large or too many open streams. An attempt was made to open a file descriptor with a value greater than or equal to {OPEN_MAX}, [XSI - Option Start]  or greater than or equal to the soft limit RLIMIT_NOFILE for the process (if smaller than {OPEN_MAX}); [XSI - Option End] or an attempt was made to open more than the maximum number of streams allowed in the process."
        case .EMLINK:
            return "Too many links. An attempt was made to have the link count of a single file exceed {LINK_MAX}."
        case .EMSGSIZE:
            return """
            Message too large. A message sent on a transport provider was larger than an internal message buffer or some other network limit.

            or:

            Inappropriate message buffer length.
            """
        case .EMULTIHOP:
            return "Reserved."
        case .ENAMETOOLONG:
            return "Filename too long. The length of a pathname exceeds {PATH_MAX} and the implementation considers this to be an error, or a pathname component is longer than {NAME_MAX}. This error may also occur when pathname substitution, as a result of encountering a symbolic link during pathname resolution, results in a pathname string the size of which exceeds {PATH_MAX}."
        case .ENETDOWN:
            return "Network is down. The local network interface used to reach the destination is down."
        case .ENETRESET:
            return "The connection was aborted by the network."
        case .ENETUNREACH:
            return "Network unreachable. No route to the network is present."
        case .ENFILE:
            return "Too many files open in system. Too many files are currently open in the system. The system has reached its predefined limit for simultaneously open files and temporarily cannot accept requests to open another one."
        case .ENOBUFS:
            return "No buffer space available. Insufficient buffer resources were available in the system to perform the socket operation."
        case .ENODATA:
            return "No message available. No message is available on the STREAM head read queue."
        case .ENODEV:
            return "No such device. An attempt was made to apply an inappropriate function to a device; for example, trying to read a write-only device such as a printer."
        case .ENOENT:
            return "No such file or directory. A component of a specified pathname does not exist, or the pathname is an empty string."
        case .ENOEXEC:
            return "Executable file format error. A request is made to execute a file that, although it has appropriate privileges, is not in the format required by the implementation for executable files."
        case .ENOLCK:
            return "No locks available. A system-imposed limit on the number of simultaneous file and record locks has been reached and no more are currently available."
        case .ENOLINK:
            return "Reserved."
        case .ENOMEM:
            return "Not enough space. The new process image requires more memory than is allowed by the hardware or system-imposed memory management constraints."
        case .ENOMSG:
            return "No message of the desired type. The message queue does not contain a message of the required type during XSI interprocess communication."
        case .ENOPROTOOPT:
            return "Protocol not available. The protocol option specified to setsockopt() is not supported by the implementation."
        case .ENOSPC:
            return "No space left on a device. During the write() function on a regular file or when extending a directory, there is no free space left on the device."
        case .ENOSR:
            return "No STREAM resources. Insufficient STREAMS memory resources are available to perform a STREAMS-related function. This is a temporary condition; it may be recovered from if other processes release resources."
        case .ENOSTR:
            return "Not a STREAM. A STREAM function was attempted on a file descriptor that was not associated with a STREAMS device."
        case .ENOSYS:
            return "Functionality not supported. An attempt was made to use optional functionality that is not supported in this implementation."
        case .ENOTCONN:
            return "Socket not connected. The socket is not connected."
        case .ENOTDIR:
            return "Not a directory. A component of the specified pathname exists, but it is not a directory, when a directory was expected; or an attempt was made to create a non-directory file, and the specified pathname contains at least one non- <slash> character and ends with one or more trailing <slash> characters."
        case .ENOTEMPTY:
            return "Directory not empty. A directory other than an empty directory was supplied when an empty directory was expected."
        case .ENOTRECOVERABLE:
            return "State not recoverable. The state protected by a robust mutex is not recoverable."
        case .ENOTSOCK:
            return "Not a socket. The file descriptor does not refer to a socket."
        case .ENOTSUP:
            return "Not supported. The implementation does not support the requested feature or value."
        case .ENOTTY:
            return "Inappropriate I/O control operation. A control function has been attempted for a file or special file for which the operation is inappropriate."
        case .ENXIO:
            return "No such device or address. Input or output on a special file refers to a device that does not exist, or makes a request beyond the capabilities of the device. It may also occur when, for example, a tape drive is not on-line."
        case .EOPNOTSUPP:
            return "Operation not supported on socket. The type of socket (address family or protocol) does not support the requested operation. A conforming implementation may assign the same values for [EOPNOTSUPP] and [ENOTSUP]."
        case .EOVERFLOW:
            return "Value too large to be stored in data type. An operation was attempted which would generate a value that is outside the range of values that can be represented in the relevant data type or that are allowed for a given data item."
        case .EOWNERDEAD:
            return "Previous owner died. The owner of a robust mutex terminated while holding the mutex lock."
        case .EPERM:
            return "Operation not permitted. An attempt was made to perform an operation limited to processes with appropriate privileges or to the owner of a file or other resource."
        case .EPIPE:
            return "Broken pipe. A write was attempted on a socket, pipe, or FIFO for which there is no process to read the data."
        case .EPROTO:
            return "Protocol error. Some protocol error occurred. This error is device-specific, but is generally not related to a hardware failure."
        case .EPROTONOSUPPORT:
            return "Protocol not supported. The protocol is not supported by the address family, or the protocol is not supported by the implementation."
        case .EPROTOTYPE:
            return "Protocol wrong type for socket. The socket type is not supported by the protocol."
        case .ERANGE:
            return "Result too large or too small. The result of the function is too large (overflow) or too small (underflow) to be represented in the available space (defined in the ISO C standard)."
        case .EROFS:
            return "Read-only file system. An attempt was made to modify a file or directory on a file system that is read-only."
        case .ESPIPE:
            return "Invalid seek. An attempt was made to access the file offset associated with a pipe or FIFO."
        case .ESRCH:
            return "No such process. No process can be found corresponding to that specified by the given process ID."
        case .ESTALE:
            return "Reserved."
        case .ETIME:
            return "[XSR - Option Start] STREAM ioctl() timeout. The timer set for a STREAMS ioctl() call has expired. The cause of this error is device-specific and could indicate either a hardware or software failure, or a timeout value that is too short for the specific operation. The status of the ioctl() operation is unspecified. [XSR - Option End]"
        case .ETIMEDOUT:
            return """
            Connection timed out. The connection to a remote machine has timed out. If the connection timed out during execution of the function that reported this error (as opposed to timing out prior to the function being called), it is unspecified whether the function has completed some or all of the documented behavior associated with a successful completion of the function.

            or:

            Operation timed out. The time limit associated with the operation was exceeded before the operation completed.
            """
        case .ETXTBSY:
            return "Text file busy. An attempt was made to execute a pure-procedure program that is currently open for writing, or an attempt has been made to open for writing a pure-procedure program that is being executed."
        case .EWOULDBLOCK:
            return """
            Operation would block. An operation on a socket marked as non-blocking has encountered a situation such as no data available that otherwise would have caused the function to suspend execution.

            A conforming implementation may assign the same values for [EWOULDBLOCK] and [EAGAIN].
            """
        case .EXDEV:
            return "Improper link. A link to a file on another file system was attempted."
        default:
            if isSystemDefined {
                return description
            } else {
                fatalError("Unable to determine debugDescription from POSIX standard.")
            }
        }
    }

    //MARK:- Init

    /// Attempts to create an `Errno` based on the current value of the `errno` property.
    public init?() {
        self.init(rawValue: errno)
    }

    public init?(rawValue: Int32) {
        //TODO: remove this when swift properly supports enum iteration
        for errno in iterateEnum(Errno.self) where errno.rawValue == rawValue {
            self = errno
            return
        }
        return nil
    }
}

/// This function is used in order to bypass naming conflicts that would result from this switch being inside of the actual `Errno` enum.
///
/// - Parameter errno: The `Errno` to convert to the C value.
/// - Returns: The C level representation of `errno`.
private func cValue(ofErrno errno: Errno) -> Int32 {
    switch errno {
    case .E2BIG:
        return E2BIG
    case .EACCES:
        return EACCES
    case .EADDRINUSE:
        return EADDRINUSE
    case .EADDRNOTAVAIL:
        return EADDRNOTAVAIL
    case .EAFNOSUPPORT:
        return EAFNOSUPPORT
    case .EAGAIN:
        return EAGAIN
    case .EALREADY:
        return EALREADY
    case .EBADF:
        return EBADF
    case .EBADMSG:
        return EBADMSG
    case .EBUSY:
        return EBUSY
    case .ECANCELED:
        return ECANCELED
    case .ECHILD:
        return ECHILD
    case .ECONNABORTED:
        return ECONNABORTED
    case .ECONNREFUSED:
        return ECONNREFUSED
    case .ECONNRESET:
        return ECONNRESET
    case .EDEADLK:
        return EDEADLK
    case .EDESTADDRREQ:
        return EDESTADDRREQ
    case .EDOM:
        return EDOM
    case .EDQUOT:
        return EDQUOT
    case .EEXIST:
        return EEXIST
    case .EFAULT:
        return EFAULT
    case .EFBIG:
        return EFBIG
    case .EHOSTUNREACH:
        return EHOSTUNREACH
    case .EIDRM:
        return EIDRM
    case .EILSEQ:
        return EILSEQ
    case .EINPROGRESS:
        return EINPROGRESS
    case .EINTR:
        return EINTR
    case .EINVAL:
        return EINVAL
    case .EIO:
        return EIO
    case .EISCONN:
        return EISCONN
    case .EISDIR:
        return EISDIR
    case .ELOOP:
        return ELOOP
    case .EMFILE:
        return EMFILE
    case .EMLINK:
        return EMLINK
    case .EMSGSIZE:
        return EMSGSIZE
    case .EMULTIHOP:
        return EMULTIHOP
    case .ENAMETOOLONG:
        return ENAMETOOLONG
    case .ENETDOWN:
        return ENETDOWN
    case .ENETRESET:
        return ENETRESET
    case .ENETUNREACH:
        return ENETUNREACH
    case .ENFILE:
        return ENFILE
    case .ENOBUFS:
        return ENOBUFS
    case .ENODATA:
        return ENODATA
    case .ENODEV:
        return ENODEV
    case .ENOENT:
        return ENOENT
    case .ENOEXEC:
        return ENOEXEC
    case .ENOLCK:
        return ENOLCK
    case .ENOLINK:
        return ENOLINK
    case .ENOMEM:
        return ENOMEM
    case .ENOMSG:
        return ENOMSG
    case .ENOPROTOOPT:
        return ENOPROTOOPT
    case .ENOSPC:
        return ENOSPC
    case .ENOSR:
        return ENOSR
    case .ENOSTR:
        return ENOSTR
    case .ENOSYS:
        return ENOSYS
    case .ENOTCONN:
        return ENOTCONN
    case .ENOTDIR:
        return ENOTDIR
    case .ENOTEMPTY:
        return ENOTEMPTY
    case .ENOTRECOVERABLE:
        return ENOTRECOVERABLE
    case .ENOTSOCK:
        return ENOTSOCK
    case .ENOTSUP:
        return ENOTSUP
    case .ENOTTY:
        return ENOTTY
    case .ENXIO:
        return ENXIO
    case .EOPNOTSUPP:
        return EOPNOTSUPP
    case .EOVERFLOW:
        return EOVERFLOW
    case .EOWNERDEAD:
        return EOWNERDEAD
    case .EPERM:
        return EPERM
    case .EPIPE:
        return EPIPE
    case .EPROTO:
        return EPROTO
    case .EPROTONOSUPPORT:
        return EPROTONOSUPPORT
    case .EPROTOTYPE:
        return EPROTOTYPE
    case .ERANGE:
        return ERANGE
    case .EROFS:
        return EROFS
    case .ESPIPE:
        return ESPIPE
    case .ESRCH:
        return ESRCH
    case .ESTALE:
        return ESTALE
    case .ETIME:
        return ETIME
    case .ETIMEDOUT:
        return ETIMEDOUT
    case .ETXTBSY:
        return ETXTBSY
    case .EWOULDBLOCK:
        return EWOULDBLOCK
    case .EXDEV:
        return EXDEV
    #if os(iOS) || os(macOS) || os(tvOS) || os(watchOS)
    case .ENOTBLK:
        return ENOTBLK
    case .ESOCKTNOSUPPORT:
        return ESOCKTNOSUPPORT
    case .EPFNOSUPPORT:
        return EPFNOSUPPORT
    case .ESHUTDOWN:
        return ESHUTDOWN
    case .ETOOMANYREFS:
        return ETOOMANYREFS
    case .EHOSTDOWN:
        return EHOSTDOWN
    case .EPROCLIM:
        return EPROCLIM
    case .EUSERS:
        return EUSERS
    case .EREMOTE:
        return EREMOTE
    case .EBADRPC:
        return EBADRPC
    case .ERPCMISMATCH:
        return ERPCMISMATCH
    case .EPROGUNAVAIL:
        return EPROGUNAVAIL
    case .EPROGMISMATCH:
        return EPROGMISMATCH
    case .EPROCUNAVAIL:
        return EPROCUNAVAIL
    case .EFTYPE:
        return EFTYPE
    case .EAUTH:
        return EAUTH
    case .ENEEDAUTH:
        return ENEEDAUTH
    case .EPWROFF:
        return EPWROFF
    case .EDEVERR:
        return EDEVERR
    case .EBADEXEC:
        return EBADEXEC
    case .EBADARCH:
        return EBADARCH
    case .ESHLIBVERS:
        return ESHLIBVERS
    case .EBADMACHO:
        return EBADMACHO
    case .ENOATTR:
        return ENOATTR
    case .ENOPOLICY:
        return ENOPOLICY
    case .EQFULL:
        return EQFULL
    case .ELAST:
        return ELAST
    #endif
    }
}

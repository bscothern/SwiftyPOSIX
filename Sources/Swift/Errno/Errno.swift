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

import Foundation

public enum Errno: Int32, Error, Codable {
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

    //MARK:- Properties
    public var rawValue: Int32 {
        return cValue(ofErrno: self)
    }

    //TODO: Convert Errno to debug string via strerror()

    /// A `String` describing the `Errno` value as documented in the POSIX standard.
    public var posixDefinition: String {
        switch self {
        case .E2BIG:
            return "Argument list too long."
        case .EACCES:
            return "Permissiondenied."
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
            return "Fileexists."
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
            return "Function not supported."
        case .ENOTCONN:
            return "The socket is not connected."
        case .ENOTDIR:
            return "Not a directory."
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
        }
    }

    //MAKR:- Init

    /// Attempts to create an `Errno` based on the current value of the `errno` property.
    public init?() {
        self.init(rawValue: errno)
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
    }
}

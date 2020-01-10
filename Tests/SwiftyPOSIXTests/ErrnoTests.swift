//
//  ErrnoTests.swift
//  SwiftyPOSIX
//
//  Created by Braden Scothern on 10/19/18.
//  Copyright © 2018-2020 Braden Scothern. All rights reserved.
//

@testable import SwiftyPOSIX
import XCTest

class ErrnoTests: XCTestCase {
    let errnoMap = createErrnoMap()

    func testErrno() {
        // Manually check that we get back nil when cleared
        errno = 0
        XCTAssert(Errno() == nil)

        for pair in errnoMap {
            // Check conversion and creation
            XCTAssert(pair.key.rawValue == pair.value)
            XCTAssert(pair.key == Errno(rawValue: pair.value), "\(pair.key) -- \(String(describing: Errno(rawValue: pair.value)))")

            // Check Errno() from errno being set directly
            errno = pair.value
            XCTAssert(pair.key == Errno())

            // Change errno so it is different from what it was for the last test
            errno = 0

            // Check Errno() from Errno.value being set
            Errno.value = pair.key
            XCTAssert(pair.key == Errno())
        }

        // Check that we can assign nil to set it as 0
        Errno.value = nil
        XCTAssert(Errno() == nil)
    }

    func testELAST() {
        #if os(iOS) || os(macOS) || os(tvOS) || os(watchOS)
        XCTAssert(errnoMap.keys.contains(Errno.ELAST))
        #endif
    }

    func testEAGAIN_IS_EWOULDBLOCK() {
        #if EAGAIN_IS_EWOULDBLOCK
        XCTAssert(Errno.EAGAIN == Errno.EWOULDBLOCK)
        #endif
    }

    func testENOTSUP_IS_EOPNOTSUPP() {
        #if ENOTSUP_IS_EOPNOTSUPP
        XCTAssert(Errno.ENOTSUP == Errno.EOPNOTSUPP)
        #endif
    }
}

// MARK: - Private Helper Funcs
private func createErrnoMap() -> [Errno: Int32] {
    var errnoMap: [Errno: Int32] = [
        Errno.E2BIG: E2BIG,
        Errno.EACCES: EACCES,
        Errno.EADDRINUSE: EADDRINUSE,
        Errno.EADDRNOTAVAIL: EADDRNOTAVAIL,
        Errno.EAFNOSUPPORT: EAFNOSUPPORT,
        Errno.EALREADY: EALREADY,
        Errno.EBADF: EBADF,
        Errno.EBADMSG: EBADMSG,
        Errno.EBUSY: EBUSY,
        Errno.ECANCELED: ECANCELED,
        Errno.ECHILD: ECHILD,
        Errno.ECONNABORTED: ECONNABORTED,
        Errno.ECONNREFUSED: ECONNREFUSED,
        Errno.ECONNRESET: ECONNRESET,
        Errno.EDEADLK: EDEADLK,
        Errno.EDESTADDRREQ: EDESTADDRREQ,
        Errno.EDOM: EDOM,
        Errno.EDQUOT: EDQUOT,
        Errno.EEXIST: EEXIST,
        Errno.EFAULT: EFAULT,
        Errno.EFBIG: EFBIG,
        Errno.EHOSTUNREACH: EHOSTUNREACH,
        Errno.EIDRM: EIDRM,
        Errno.EILSEQ: EILSEQ,
        Errno.EINPROGRESS: EINPROGRESS,
        Errno.EINTR: EINTR,
        Errno.EINVAL: EINVAL,
        Errno.EIO: EIO,
        Errno.EISCONN: EISCONN,
        Errno.EISDIR: EISDIR,
        Errno.ELOOP: ELOOP,
        Errno.EMFILE: EMFILE,
        Errno.EMLINK: EMLINK,
        Errno.EMSGSIZE: EMSGSIZE,
        Errno.EMULTIHOP: EMULTIHOP,
        Errno.ENAMETOOLONG: ENAMETOOLONG,
        Errno.ENETDOWN: ENETDOWN,
        Errno.ENETRESET: ENETRESET,
        Errno.ENETUNREACH: ENETUNREACH,
        Errno.ENFILE: ENFILE,
        Errno.ENOBUFS: ENOBUFS,
        Errno.ENODATA: ENODATA,
        Errno.ENODEV: ENODEV,
        Errno.ENOENT: ENOENT,
        Errno.ENOEXEC: ENOEXEC,
        Errno.ENOLCK: ENOLCK,
        Errno.ENOLINK: ENOLINK,
        Errno.ENOMEM: ENOMEM,
        Errno.ENOMSG: ENOMSG,
        Errno.ENOPROTOOPT: ENOPROTOOPT,
        Errno.ENOSPC: ENOSPC,
        Errno.ENOSR: ENOSR,
        Errno.ENOSTR: ENOSTR,
        Errno.ENOSYS: ENOSYS,
        Errno.ENOTCONN: ENOTCONN,
        Errno.ENOTDIR: ENOTDIR,
        Errno.ENOTEMPTY: ENOTEMPTY,
        Errno.ENOTRECOVERABLE: ENOTRECOVERABLE,
        Errno.ENOTSOCK: ENOTSOCK,
        Errno.ENOTSUP: ENOTSUP,
        Errno.ENOTTY: ENOTTY,
        Errno.ENXIO: ENXIO,
    ]
    #if ENOTSUP_IS_EOPNOTSUPP
    #else
    errnoMap[Errno.EOPNOTSUPP] = EOPNOTSUPP
    #endif
    errnoMap.merge([
        Errno.EOVERFLOW: EOVERFLOW,
        Errno.EOWNERDEAD: EOWNERDEAD,
        Errno.EPERM: EPERM,
        Errno.EPIPE: EPIPE,
        Errno.EPROTO: EPROTO,
        Errno.EPROTONOSUPPORT: EPROTONOSUPPORT,
        Errno.EPROTOTYPE: EPROTOTYPE,
        Errno.ERANGE: ERANGE,
        Errno.EROFS: EROFS,
        Errno.ESPIPE: ESPIPE,
        Errno.ESRCH: ESRCH,
        Errno.ESTALE: ESTALE,
        Errno.ETIME: ETIME,
        Errno.ETIMEDOUT: ETIMEDOUT,
        Errno.ETXTBSY: ETXTBSY
    ]) { _, _ in fatalError("Keys must be unique so this must never be called") }
    #if EAGAIN_IS_EWOULDBLOCK
    #else
    errnoMap[Errno.EWOULDBLOCK] = EWOULDBLOCK
    #endif
    errnoMap.merge([
        Errno.EXDEV: EXDEV,
    ]) { _, _ in fatalError("Keys must be unique so this must never be called") }

    #if os(iOS) || os(macOS) || os(tvOS) || os(watchOS)
    errnoMap.merge([
        Errno.ENOTBLK: ENOTBLK,
        Errno.ESOCKTNOSUPPORT: ESOCKTNOSUPPORT,
        Errno.EPFNOSUPPORT: EPFNOSUPPORT,
        Errno.ESHUTDOWN: ESHUTDOWN,
        Errno.ETOOMANYREFS: ETOOMANYREFS,
        Errno.EHOSTDOWN: EHOSTDOWN,
        Errno.EPROCLIM: EPROCLIM,
        Errno.EUSERS: EUSERS,
        Errno.EREMOTE: EREMOTE,
        Errno.EBADRPC: EBADRPC,
        Errno.ERPCMISMATCH: ERPCMISMATCH,
        Errno.EPROGUNAVAIL: EPROGUNAVAIL,
        Errno.EPROGMISMATCH: EPROGMISMATCH,
        Errno.EPROCUNAVAIL: EPROCUNAVAIL,
        Errno.EFTYPE: EFTYPE,
        Errno.EAUTH: EAUTH,
        Errno.ENEEDAUTH: ENEEDAUTH,
        Errno.EPWROFF: EPWROFF,
        Errno.EDEVERR: EDEVERR,
        Errno.EBADEXEC: EBADEXEC,
        Errno.EBADARCH: EBADARCH,
        Errno.ESHLIBVERS: ESHLIBVERS,
        Errno.EBADMACHO: EBADMACHO,
        Errno.ENOATTR: ENOATTR,
        Errno.ENOPOLICY: ENOPOLICY,
        Errno.EQFULL: EQFULL,
    ]) { _, _ in fatalError("Keys must be unique so this must never be called") }
    #endif

    return errnoMap
}

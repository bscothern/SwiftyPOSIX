//
//  CPIO.swift
//  SwiftyPOSIX
//
//  Created by Braden Scothern on 1/10/19.
//  Copyright © 2019 Braden Scothern. All rights reserved.
//

import Foundation

/// cpio Archive Values
///
/// Defines the constants needed by the `c_mode` field of the cpio archive format
///
/// - Note: <cpio.h>
public enum CPIO: Int32, CaseIterable {

    /// A `String` with the value "070707"
    ///
    /// - Note: `MAGIC`
    static let magic: String = MAGIC

    /// - Note: Octal value: 0000400
    /// - Note: `C_IRUSR`
    case readByOwner

    /// - Note: Octal value: 0000200
    /// - Note: `C_IWUSR`
    case writeByOwner

    /// - Note: Octal value: 0000100
    /// - Note: `C_IXUSR`
    case executeByOwner

    /// - Note: Octal value: 0000040
    /// - Note: `C_IRGRP`
    case readByGroup

    /// - Note: Octal value: 0000020
    /// - Note: `C_IWGRP`
    case writeByGroup

    /// - Note: Octal value: 0000010
    /// - Note: `C_IXGRP`
    case executeByGroup

    /// - Note: Octal value: 0000004
    /// - Note: `C_IROTH`
    case readByOthers

    /// - Note: Octal value: 0000002
    /// - Note: `C_IWOTH`
    case writeByOthers

    /// - Note: Octal value: 0000001
    /// - Note: `C_IXOTH`
    case executeByOthers

    /// - Note: Octal value: 0004000
    /// - Note: `C_ISUID`
    case setUserID

    /// - Note: Octal value: 0002000
    /// - Note: `C_ISGID`
    case setGroupID

    /// - Note: Octal value: 0001000
    /// - Note: `C_ISVTX`
    case onDirectoriesRestrictDeletion

    /// - Note: Octal value: 0040000
    /// - Note: `C_ISDIR`
    case directory

    /// - Note: Octal value: 0010000
    /// - Note: `C_ISFIFO`
    case FIFO

    /// - Note: Octal value: 0100000
    /// - Note: `C_ISREG`
    case regularFile

    /// - Note: Octal value: 0060000
    /// - Note: `C_ISBLK`
    case blockSpecial

    /// - Note: Octal value: 0020000
    /// - Note: `C_ISCHR`
    case characterSpecial

    /// - Note: Octal value: 0110000
    /// - Note: `C_ISCTG`
    case reserved

    /// - Note: Octal value: 0120000
    /// - Note: `C_ISLNK`
    case symbolicLink

    /// - Note: Octal value: 0140000
    /// - Note: `C_ISSOCK`
    case socket

    public init?(rawValue: RawValue) {
        guard let value = CPIO.allCases.first(where: { $0.rawValue == rawValue }) else {
            return nil
        }
        self = value
    }

    public var rawValue: Int32 {
        switch self {
        case .readByOwner:
            return C_IRUSR
        case .writeByOwner:
            return C_IWUSR
        case .executeByOwner:
            return C_IXUSR
        case .readByGroup:
            return C_IRGRP
        case .writeByGroup:
            return C_IWGRP
        case .executeByGroup:
            return C_IXGRP
        case .readByOthers:
            return C_IROTH
        case .writeByOthers:
            return C_IWOTH
        case .executeByOthers:
            return C_IXOTH
        case .setUserID:
            return C_ISUID
        case .setGroupID:
            return C_ISGID
        case .onDirectoriesRestrictDeletion:
            return C_ISVTX
        case .directory:
            return C_ISDIR
        case .FIFO:
            return C_ISFIFO
        case .regularFile:
            return C_ISREG
        case .blockSpecial:
            return C_ISBLK
        case .characterSpecial:
            return C_ISCHR
        case .reserved:
            return C_ISCTG
        case .symbolicLink:
            return C_ISLNK
        case .socket:
            return C_ISSOCK
        }
    }
}

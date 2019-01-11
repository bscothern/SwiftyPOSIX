//
//  CPIOTests.swift
//  SwiftyPOSIX
//
//  Created by Braden Scothern on 1/10/19.
//  Copyright © 2019 Braden Scothern. All rights reserved.
//

import XCTest
@testable import SwiftyPOSIX

class CPIOTests: XCTestCase {
    func testCPIO() {
        let cpioMap = createCPIOMap()
        
        for pair in cpioMap {
            XCTAssert(pair.key.rawValue == pair.value)
            XCTAssert(pair.key == CPIO(rawValue: pair.value), "\(pair.key) -- \(String(describing: CPIO(rawValue: pair.value)))")
        }
    }
    
    func testMagic() {
        XCTAssert(CPIO.magic == MAGIC)
    }
}

private func createCPIOMap() -> [CPIO: Int32] {
    return [
        CPIO.readByOwner: C_IRUSR,
        CPIO.writeByOwner: C_IWUSR,
        CPIO.executeByOwner: C_IXUSR,
        CPIO.readByGroup: C_IRGRP,
        CPIO.writeByGroup: C_IWGRP,
        CPIO.executeByGroup: C_IXGRP,
        CPIO.readByOthers: C_IROTH,
        CPIO.writeByOthers: C_IWOTH,
        CPIO.executeByOthers: C_IXOTH,
        CPIO.setUserID: C_ISUID,
        CPIO.setGroupID: C_ISGID,
        CPIO.onDirectoriesRestrictDeletion: C_ISVTX,
        CPIO.directory: C_ISDIR,
        CPIO.FIFO: C_ISFIFO,
        CPIO.regularFile: C_ISREG,
        CPIO.blockSpecial: C_ISBLK,
        CPIO.characterSpecial: C_ISCHR,
        CPIO.reserved: C_ISCTG,
        CPIO.symbolicLink: C_ISLNK,
        CPIO.socket: C_ISSOCK
    ]
}

//
//  PThreadSpecificTests.swift
//  SwiftyPOSIX
//
//  Created by Braden Scothern on 10/19/18.
//  Copyright © 2018 Braden Scothern. All rights reserved.
//

@testable import SwiftyPOSIX
import XCTest

class PThreadSpecificTests: XCTestCase {
    func testPThreadSpecificMax() {
        var keys: [PThreadSpecificKey<Any>] = []

        // Hit the max number of keys
        while let key = PThreadSpecificKey<Any>() {
            keys.append(key)
            XCTAssert(keys.count < PThreadSpecificKey<Any>.max)
        }

        // These are the acceptable values of Errno when a PThreadSpecificKey cannot be created.
        XCTAssert(Errno() == Errno.EAGAIN || Errno() == Errno.ENOMEM)

        // Clean up keys to make sure we can create more
        keys.removeAll()

        // Clear Errno
        Errno.value = nil

        // Make sure we can make a new key after hitting the max
        let key = PThreadSpecificKey<Any>()
        XCTAssert(key != nil)
        XCTAssert(Errno() == nil)
    }
}

//
//  AssertTests.swift
//  SwiftyPOSIX
//
//  Created by Braden Scothern on 4/30/19.
//  Copyright © 2019 Braden Scothern. All rights reserved.
//

@testable import SwiftyPOSIX
import XCTest

class AssertTests: XCTestCase {
    func testAssertTrue() {
        Assert.assert(true)
    }
    
    func testAssertFalse() {
        #if TEST_ASSERT_FAILURES
        Assert.assert(false)
        #endif
    }
    
    func testAssert0() {
        #if TEST_ASSERT_FAILURES
        Assert.assert(0)
        #endif
    }
    
    func testAssert1() {
        Assert.assert(1)
    }
    
    func testString() {
        Assert.assert("Test")
    }
    
    func testNilString() {
        #if TEST_ASSERT_FAILURES
        Assert.assert(String?.none)
        #endif
    }
}

//
//  ComplexTests.swift
//  SwiftyPOSIX
//
//  Created by Braden Scothern on 1/9/20.
//  Copyright © 2018-2020 Braden Scothern. All rights reserved.
//

@testable import SwiftyPOSIX
import XCTest

class ComplexTests: XCTestCase {
    
    override func setUp() {
        continueAfterFailure = true
    }
    
    func testCDouble() {
        Complex<CDouble>.testFuncs.forEach { $0() }
    }
    
    func testCFloat() {
        Complex<CFloat>.testFuncs.forEach { $0() }
    }
    
    func testCLongDouble() {
        Complex<CLongDouble>.testFuncs.forEach { $0() }
    }
}

private extension Complex {
    static var testFuncs: [() -> Void] {
        [
            testInit,
            testAbs,
            testACos,
            testACosH,
            testArg,
            testASin,
            testASinH,
            testATan,
            testATanH,
            testCos,
            testCosH,
            testExp,
            testLog,
            testConjugate,
            testProjection,
            testSin,
            testSinH,
            testSqrt,
            testTan,
            testTanH,
            testPow
        ]
    }
    
    enum TestValues {
        static var real: T { 4.2 }
        static var imaginary: T { 2.4 }
        static var accuracy: T { 0.000001 }
    }
    
    // Hack around XCTAssertEqual not working with Float80
    static func assertEqual(_ first: T, _ second: T, accuracy: T = TestValues.accuracy, line: UInt = #line) {
        let difference = first - second
        XCTAssert(difference.isLessThanOrEqualTo(accuracy), "\(first) is not equal to \(second)", line: line)
    }
    
    static func testInit() {
        let c = Self(real: TestValues.real, imaginary: TestValues.imaginary)
        assertEqual(c.real, TestValues.real)
        assertEqual(c.imaginary, TestValues.imaginary)
    }

    static func testAbs() {
        let c = Self(real: TestValues.real, imaginary: TestValues.imaginary)
        let expected: T = Foundation.sqrt(TestValues.real * TestValues.real + TestValues.imaginary * TestValues.imaginary)
        assertEqual(c.abs, expected)
    }

    static func testACos() {
        let c = Self(real: TestValues.real, imaginary: TestValues.imaginary)
        let expected: T = 0.52850044
        assertEqual(c.acos, expected)
    }
    
    static func testACosH() {
        let c = Self(real: TestValues.real, imaginary: TestValues.imaginary)
        let expected: T = 0
        assertEqual(c.acosh, expected)
    }
    
    static func testArg() {
        let c = Self(real: TestValues.real, imaginary: TestValues.imaginary)
        let expected: T = 0.51914614
        assertEqual(c.arg, expected)
    }
    
    static func testASin() {
        let c = Self(real: TestValues.real, imaginary: TestValues.imaginary)
        let expected: T = 1.0422959
        assertEqual(c.asin, expected)
    }
    
    static func testASinH() {
        let c = Self(real: TestValues.real, imaginary: TestValues.imaginary)
        let expected: T = 2.2750182
        assertEqual(c.asinh, expected)
    }
    
    static func testATan() {
        let c = Self(real: TestValues.real, imaginary: TestValues.imaginary)
        let expected: T = 1.391411
        assertEqual(c.atan, expected)
    }
    
    static func testATanH() {
        let c = Self(real: TestValues.real, imaginary: TestValues.imaginary)
        let expected: T = 0.17945996
        assertEqual(c.atanh, expected)
    }
    
    static func testCos() {
        let c = Self(real: TestValues.real, imaginary: TestValues.imaginary)
        let expected: T = 0
        assertEqual(c.cos, expected)
    }
    
    static func testCosH() {
        let c = Self(real: TestValues.real, imaginary: TestValues.imaginary)
        let expected: T = 0
        assertEqual(c.cosh, expected)
    }
    
    static func testExp() {
        let c = Self(real: TestValues.real, imaginary: TestValues.imaginary)
        let expected: T = 0
        assertEqual(c.exp, expected)
    }
    
    static func testLog() {
        let c = Self(real: TestValues.real, imaginary: TestValues.imaginary)
        let expected: T = 1.576368
        assertEqual(c.log, expected)
    }
    
    static func testConjugate() {
        let c = Self(real: TestValues.real, imaginary: TestValues.imaginary)
        let expected: T = 4.2
        assertEqual(c.conjugate, expected)
    }
    
    static func testProjection() {
        let c = Self(real: TestValues.real, imaginary: TestValues.imaginary)
        let expected: T = 4.2
        assertEqual(c.projection, expected)
    }
    
    static func testSin() {
        let c = Self(real: TestValues.real, imaginary: TestValues.imaginary)
        let expected: T = 0
        assertEqual(c.sin, expected)
    }
    
    static func testSinH() {
        let c = Self(real: TestValues.real, imaginary: TestValues.imaginary)
        let expected: T = 0
        assertEqual(c.sinh, expected)
    }
    
    static func testSqrt() {
        let c = Self(real: TestValues.real, imaginary: TestValues.imaginary)
        let expected: T = 2.1257179
        assertEqual(c.sqrt, expected)
    }
    
    static func testTan() {
        let c = Self(real: TestValues.real, imaginary: TestValues.imaginary)
        let expected: T = 0.014186562
        assertEqual(c.tan, expected)
    }
    
    static func testTanH() {
        let c = Self(real: TestValues.real, imaginary: TestValues.imaginary)
        let expected: T = 0.99996054
        assertEqual(c.tanh, expected)
    }
    
    static func testPow() {
        let c1 = Self(real: TestValues.real, imaginary: TestValues.imaginary)
        let c2 = c1
        let expected = Self(real: 204.970, imaginary: -67.808)
        let result = c1.pow(c2)
        assertEqual(result.real, expected.real, accuracy: 0.001)
        assertEqual(result.imaginary, expected.imaginary, accuracy: 0.001)
    }
}

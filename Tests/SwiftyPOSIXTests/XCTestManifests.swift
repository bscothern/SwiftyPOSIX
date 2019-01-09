import XCTest

extension ErrnoTests {
    static let __allTests = [
        ("testErrno", testErrno),
    ]
}

extension PThreadSpecificTests {
    static let __allTests = [
        ("testPThreadSpecificMax", testPThreadSpecificMax),
    ]
}

extension SwiftyPOSIXTests {
    static let __allTests = [
        ("test", test),
    ]
}

extension UnistdFunctionConstantsPathconfNameTests {
    static let __allTests = [
        ("testPathconfNameCount", testPathconfNameCount),
    ]
}

#if !os(macOS)
public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(ErrnoTests.__allTests),
        testCase(PThreadSpecificTests.__allTests),
        testCase(SwiftyPOSIXTests.__allTests),
        testCase(UnistdFunctionConstantsPathconfNameTests.__allTests),
    ]
}
#endif

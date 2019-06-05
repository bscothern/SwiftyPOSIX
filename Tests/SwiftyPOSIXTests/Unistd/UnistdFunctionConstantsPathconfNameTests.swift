//
//  PathconfName.swift
//  SwiftyPOSIX
//
//  Created by Braden Scothern on 1/6/19.
//  Copyright © 2019 Braden Scothern. All rights reserved.
//

@testable import SwiftyPOSIX
import XCTest

class UnistdFunctionConstantsPathconfNameTests: XCTestCase {
    func testPathconfNameCount() {
        typealias PathconfName = Unistd.FunctionConstants.PathconfName

        let expectedCount = PathconfName.allCases.count
        var found: Set<PathconfName> = []

        func staticAccessible(pathconfName: PathconfName?) {
            guard let pathconfName = pathconfName else {
                return
            }
            found.insert(pathconfName)
        }

        staticAccessible(pathconfName: .symlinks)
        staticAccessible(pathconfName: .allocSizeMin)
        staticAccessible(pathconfName: .asyncIO)
        staticAccessible(pathconfName: .chownRestricted)
        staticAccessible(pathconfName: .fileSizeBits)
        staticAccessible(pathconfName: .linkMax)
        staticAccessible(pathconfName: .maxCanon)
        staticAccessible(pathconfName: .maxInput)
        staticAccessible(pathconfName: .nameMax)
        staticAccessible(pathconfName: .noTrunc)
        staticAccessible(pathconfName: .pathMax)
        staticAccessible(pathconfName: .pipeBuf)
        staticAccessible(pathconfName: .prioIO)
        staticAccessible(pathconfName: .recIncrXferSize)
        staticAccessible(pathconfName: .recMaxXferSize)
        staticAccessible(pathconfName: .recMinXferSize)
        staticAccessible(pathconfName: .recXferAlign)
        staticAccessible(pathconfName: .symlinkMax)
        staticAccessible(pathconfName: .syncIO)
        staticAccessible(pathconfName: .timestampResolution)
        staticAccessible(pathconfName: .vDisable)

        XCTAssert(found.count == expectedCount)
    }
}

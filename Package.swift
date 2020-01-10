// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.
//
//  Package.swift
//  SwiftyPOSIX
//
//  Created by Braden Scothern on 2/9/18.
//  Copyright © 2018-2020 Braden Scothern. All rights reserved.
//

import PackageDescription
#if os(Linux)
import Glibc
#else
import Darwin.C
#endif

enum DefineOption: String {
    case EAGAIN_IS_EWOULDBLOCK
    case ENOTSUP_IS_EOPNOTSUPP

    private func valueForDefines<E: Equatable>(_ a: E, _ b: E) -> String {
        return (a == b ? "" : "NO_") + self.rawValue
    }

    func value() -> String {
        switch self {
        case .EAGAIN_IS_EWOULDBLOCK:
            return valueForDefines(EAGAIN, EWOULDBLOCK)
        case .ENOTSUP_IS_EOPNOTSUPP:
            return valueForDefines(ENOTSUP, EOPNOTSUPP)
        }
    }
}

let swiftSettings: [SwiftSetting] = [
    .define(DefineOption.EAGAIN_IS_EWOULDBLOCK.value(), .when(platforms: [.linux])),
    .define(DefineOption.ENOTSUP_IS_EOPNOTSUPP.value(), .when(platforms: [.linux])),
]

let package = Package(
    name: "SwiftyPOSIX",
    products: [
        .library(
            name: "SwiftyPOSIX",
            targets: ["SwiftyPOSIX_C", "SwiftyPOSIX"]
        ),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "SwiftyPOSIX_C",
            dependencies: [],
            path: "Sources/C"
        ),
        .target(
            name: "SwiftyPOSIX",
            dependencies: ["SwiftyPOSIX_C"],
            path: "Sources/Swift",
            swiftSettings: swiftSettings
        ),
        .testTarget(
            name: "SwiftyPOSIXTests",
            dependencies: ["SwiftyPOSIX"],
            swiftSettings: swiftSettings
        ),
    ],
    swiftLanguageVersions: [.v5],
    cLanguageStandard: .c11,
    cxxLanguageStandard: .cxx11
)

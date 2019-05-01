// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.
//
//  Package.swift
//  SwiftyPOSIX
//
//  Created by Braden Scothern on 2/9/18.
//  Copyright © 2017 Braden Scothern. All rights reserved.
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

import PackageDescription
#if os(Linux)
import Glibc
#else
import Darwin.C
#endif

enum DefineOption: String {
    case EAGAIN_IS_EWOULDBLOCK
    case ENOTSUP_IS_EOPNOTSUPP

    private func valueFor<E: Equatable>(_ a: E, _ b: E) -> String {
        return (a == b ? "" : "NO_") + self.rawValue
    }

    func value() -> String {
        switch self {
        case .EAGAIN_IS_EWOULDBLOCK:
            return valueFor(EAGAIN, EWOULDBLOCK)
        case .ENOTSUP_IS_EOPNOTSUPP:
            return valueFor(ENOTSUP, EOPNOTSUPP)
        @unknown default:
            return ""
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
            targets: ["SwiftyPOSIX_C", "SwiftyPOSIX"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "SwiftyPOSIX_C",
            dependencies: [],
            path: "Sources/C"),
        .target(
            name: "SwiftyPOSIX",
            dependencies: ["SwiftyPOSIX_C"],
            path: "Sources/Swift",
            swiftSettings: swiftSettings),
        .testTarget(
            name: "SwiftyPOSIXTests",
            dependencies: ["SwiftyPOSIX"],
            swiftSettings: swiftSettings),
    ],
    swiftLanguageVersions: [.v5]
)

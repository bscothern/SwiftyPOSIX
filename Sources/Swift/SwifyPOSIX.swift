//
//  SwifyPOSIX.swift
//  SwiftyPOSIX
//
//  Created by Braden Scothern on 3/26/18.
//  Copyright © 2018-2020 Braden Scothern. All rights reserved.
//

#if SWIFT_PACKAGE
@_exported import SwiftyPOSIX_C
#endif

#if os(Linux)
@_exported import Glibc
#else
@_exported import Darwin.C
#endif

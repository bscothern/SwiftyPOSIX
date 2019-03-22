//
//  PosixValueRepresentable.swift
//  SwiftyPOSIX
//
//  Created by Braden Scothern on 1/15/19.
//  Copyright © 2019 Braden Scothern. All rights reserved.
//

import Foundation

internal protocol PosixValueRepresentable {
    associatedtype PosixValue

    var posixValue: PosixValue { get }
    init?(posixValue: PosixValue)
}

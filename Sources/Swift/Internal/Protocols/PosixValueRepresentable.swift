//
//  PosixValueRepresentable.swift
//  SwiftyPOSIX
//
//  Created by Braden Scothern on 1/15/19.
//  Copyright © 2018-2020 Braden Scothern. All rights reserved.
//

@usableFromInline
internal protocol PosixValueRepresentable {
    associatedtype PosixValue

    var posixValue: PosixValue { get }
    init?(posixValue: PosixValue)
}

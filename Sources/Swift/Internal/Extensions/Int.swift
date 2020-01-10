//
//  Int.swift
//  SwiftyPOSIX
//
//  Created by Braden Scothern on 9/6/18.
//  Copyright © 2018-2020 Braden Scothern. All rights reserved.
//

internal extension Int {
    @inlinable
    init?(valuePointer: UnsafePointer<Int32>?) {
        guard let valuePointer = valuePointer else {
            return nil
        }
        self = Int(valuePointer.pointee)
    }

    @inlinable
    init?(valuePointer: UnsafePointer<CLong>?) {
        guard let valuePointer = valuePointer else {
            return nil
        }
        self = Int(valuePointer.pointee)
    }
}

//
//  Int.swift
//  SwiftyPOSIX
//
//  Created by Braden Scothern on 9/6/18.
//  Copyright © 2018 Braden Scothern. All rights reserved.
//

import Foundation

internal extension Int {
    init?(valuePointer: UnsafePointer<Int32>?) {
        guard let valuePointer = valuePointer else {
            return nil
        }
        self = Int(valuePointer.pointee)
    }

    init?(valuePointer: UnsafePointer<CLong>?) {
        guard let valuePointer = valuePointer else {
            return nil
        }
        self = Int(valuePointer.pointee)
    }
}

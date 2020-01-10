//
//  PThreadMutex.swift
//  SwiftyPOSIX
//
//  Created by Braden Scothern on 2/9/18.
//  Copyright © 2018-2020 Braden Scothern. All rights reserved.
//

public class PThreadMutex {
    public func lock() {
    }

    public func unlock() {
    }
}

#if canImport(Foundation)
import Foundation

extension PThreadMutex: NSLocking {
}

#endif

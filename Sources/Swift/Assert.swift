//
//  Assert.swift
//  SwiftyPOSIX
//
//  Created by Braden Scothern on 4/29/19.
//  Copyright © 2019 Braden Scothern. All rights reserved.
//

#if SWIFT_PACKAGE
import SwiftyPOSIX_C.Shims
#else
import SwiftyPOSIX.SwiftyPOSIX_C.Shims
#endif

public enum Assert {
    @inlinable
    public static func assert<N: Numeric>(_ numeric: N?) {
        SP_assert(numeric != nil && numeric!.magnitude != 0)
    }
    
    @inlinable
    public static func assert(_ expression: Bool?) {
        SP_assert(expression != nil && expression!)
    }

    @inlinable
    public static func assert(_ expression: Any?) {
        SP_assert(expression != nil)
    }
}

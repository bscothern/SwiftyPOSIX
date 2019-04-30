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
    public func assert(_ expression: Bool) {
        SP_assert(expression)
    }

    @inlinable
    public func assert(_ expression: CSignedChar) {
        SP_assert(expression != 0)
    }

    @inlinable
    public func assert(_ expression: CUnsignedChar) {
        SP_assert(expression != 0)
    }

    @inlinable
    public func assert(_ expression: CChar16) {
        SP_assert(expression != 0)
    }

    @inlinable
    public func assert(_ expression: CChar32) {
        SP_assert(expression != Unicode.Scalar(0))
    }

    @inlinable
    public func assert(_ expression: CInt) {
        SP_assert(expression != 0)
    }

    @inlinable
    public func assert(_ expression: CUnsignedInt) {
        SP_assert(expression != 0)
    }

    @inlinable
    public func assert(_ expression: CLong) {
        SP_assert(expression != 0)
    }

    @inlinable
    public func assert(_ expression: CUnsignedLong) {
        SP_assert(expression != 0)
    }

    @inlinable
    public func assert(_ expression: CShort) {
        SP_assert(expression != 0)
    }

    @inlinable
    public func assert(_ expression: CLongLong) {
        SP_assert(expression != 0)
    }

    @inlinable
    public func assert(_ expression: CUnsignedLongLong) {
        SP_assert(expression != 0)
    }

    @inlinable
    public func assert(_ expression: CFloat) {
        SP_assert(expression != 0)
    }

    @inlinable
    public func assert(_ expression: CDouble) {
        SP_assert(expression != 0)
    }

    @inlinable
    public func assert(_ expression: CLongDouble) {
        SP_assert(expression != 0)
    }
}

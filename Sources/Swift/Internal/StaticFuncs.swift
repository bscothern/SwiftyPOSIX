//
//  StaticFuncs.swift
//  SwiftyPOSIX
//
//  Created by Braden Scothern on 4/15/18.
//  Copyright © 2018 Braden Scothern. All rights reserved.
//

//TODO: remove iterateEnum(_:) when proper enum iteration is part of Swift

/// Allows the iteration over an enum's cases.
///
/// Common usage:
///
///     for enumValue in iterateEnum(EnumType.self) {
///         // Do Something
///     }
///
/// - Parameter type: The Type that should be iterated over.
///    If this is not an enum, this has undefined behavior and will likely crash.
/// - Returns: An `Itererator` that will go over all the cases within the specified enum type.
internal func iterateEnum<T: Hashable>(_ type: T.Type) -> AnyIterator<T> {
    var i = 0
    return AnyIterator {
        let next = withUnsafePointer(to: &i) {
            $0.withMemoryRebound(to: T.self, capacity: 1) { $0.pointee }
        }
        if next.hashValue != i { return nil }
        i += 1
        return next
    }
}

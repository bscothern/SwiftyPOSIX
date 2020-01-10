//
//  Complex.swift
//  SwiftyPOSIX
//
//  Created by Braden Scothern on 6/6/19.
//  Copyright © 2018-2020 Braden Scothern. All rights reserved.
//

public struct Complex<T: ComplexCompatible> {
    // MARK: - Properties
    // MARK: Public Static
    @inlinable public static var i: T { T._complexI(); }
    
    // MARK: Public
    @inlinable public var real: T { T._complexReal(cComplex) }
    
    @inlinable public var imaginary: T { T._complexImaginary(cComplex) }
    
    @inlinable public var abs: T { T._complexAbs(cComplex) }
    
    @inlinable public var acos: T { T._complexACos(cComplex) }
    
    @inlinable public var acosh: T { T._complexACosH(cComplex) }
    
    @inlinable public var arg: T { T._complexArg(cComplex) }
    
    @inlinable public var asin: T { T._complexASin(cComplex) }
    
    @inlinable public var asinh: T { T._complexASinH(cComplex) }
    
    @inlinable public var atan: T { T._complexATan(cComplex) }
    
    @inlinable public var atanh: T { T._complexATanH(cComplex) }
    
    @inlinable public var cos: T { T._complexCos(cComplex) }
    
    @inlinable public var cosh: T { T._complexCosH(cComplex) }
    
    @inlinable public var exp: T { T._complexExp(cComplex) }
    
    @inlinable public var log: T { T._complexLog(cComplex) }
    
    @inlinable public var conjugate: T { T._complexConjugate(cComplex) }
    
    @inlinable public var projection: T { T._complexProjection(cComplex) }
    
    @inlinable public var sin: T { T._complexSin(cComplex) }
    
    @inlinable public var sinh: T { T._complexSinH(cComplex) }
    
    @inlinable public var sqrt: T { T._complexSqrt(cComplex) }
    
    @inlinable public var tan: T { T._complexTan(cComplex) }
    
    @inlinable public var tanh: T { T._complexTanH(cComplex) }
    
    // MARK: Internal
    @usableFromInline internal var cComplex: SP_Complex
    
    // MARK: - Init
    
    /// Creaes a `Complex<T>` with its `real` and `imaginary` components.
    ///
    /// - Note: `CMPLX()`, `CMPLXF()`, and `CMPLXL()`
    ///
    /// - parameters:
    ///     - real: The real component of the complex number.
    ///     - imaginary: The imaginary component of the complex number.
    @inlinable
    public init(real: T, imaginary: T) {
        self.init(T._complexMake(real, imaginary))
    }
    
    @usableFromInline
    internal init(_ cComplex: SP_Complex) {
        self.cComplex = cComplex
    }
    
    // MARK: - Funcs
    @inlinable
    public func pow(_ power: Self) -> Self {
        Self(T._complexPow(cComplex, power.cComplex))
    }
}

extension Complex: Equatable {
    @inlinable
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.real == rhs.real && lhs.imaginary == rhs.imaginary
    }
}

extension Complex: Hashable {
    @inlinable
    public func hash(into hasher: inout Hasher) {
        hasher.combine(real)
        hasher.combine(imaginary)
    }
}

extension Complex: CustomStringConvertible {
    @inlinable
    public var description: String {
        "\(real) + \(imaginary) * i"
    }
}

public protocol ComplexCompatible: FloatingPoint, ExpressibleByFloatLiteral {
    typealias _ValueGetterFunction = (SP_Complex) -> Self
    
    static var _complexMake: (_ real: Self, _ imaginary: Self) -> SP_Complex { get }
    static var _complexI: () -> Self { get }
    static var _complexPow: (SP_Complex, SP_Complex) -> SP_Complex { get }

    static var _complexReal: _ValueGetterFunction { get }
    static var _complexImaginary: _ValueGetterFunction { get }
    static var _complexAbs: _ValueGetterFunction { get }
    static var _complexACos: _ValueGetterFunction { get }
    static var _complexACosH: _ValueGetterFunction { get }
    static var _complexArg: _ValueGetterFunction { get }
    static var _complexASin: _ValueGetterFunction { get }
    static var _complexASinH: _ValueGetterFunction { get }
    static var _complexATan: _ValueGetterFunction { get }
    static var _complexATanH: _ValueGetterFunction { get }
    static var _complexCos: _ValueGetterFunction { get }
    static var _complexCosH: _ValueGetterFunction { get }
    static var _complexExp: _ValueGetterFunction { get }
    static var _complexLog: _ValueGetterFunction { get }
    static var _complexConjugate: _ValueGetterFunction { get }
    static var _complexProjection: _ValueGetterFunction { get }
    static var _complexSin: _ValueGetterFunction { get }
    static var _complexSinH: _ValueGetterFunction { get }
    static var _complexSqrt: _ValueGetterFunction { get }
    static var _complexTan: _ValueGetterFunction { get }
    static var _complexTanH: _ValueGetterFunction { get }
}

extension CDouble: ComplexCompatible {
    @inlinable public static var _complexMake: (CDouble, CDouble) -> SP_Complex { SP_ComplexMakeWithDoubles }
    @inlinable public static var _complexI: () -> CDouble { SP_ComplexIDouble }
    @inlinable public static var _complexPow: (SP_Complex, SP_Complex) -> SP_Complex { SP_ComplexPowDouble }
    
    @inlinable public static var _complexReal: _ValueGetterFunction { SP_ComplexGetRealDouble }
    @inlinable public static var _complexImaginary: _ValueGetterFunction { SP_ComplexGetImaginaryDouble }
    @inlinable public static var _complexAbs: _ValueGetterFunction { SP_ComplexGetAbsDouble }
    @inlinable public static var _complexACos: _ValueGetterFunction { SP_ComplexGetACosDouble }
    @inlinable public static var _complexACosH: _ValueGetterFunction { SP_ComplexGetACosHDouble }
    @inlinable public static var _complexArg: _ValueGetterFunction { SP_ComplexGetArgDouble }
    @inlinable public static var _complexASin: _ValueGetterFunction { SP_ComplexGetASinDouble }
    @inlinable public static var _complexASinH: _ValueGetterFunction { SP_ComplexGetASinHDouble }
    @inlinable public static var _complexATan: _ValueGetterFunction { SP_ComplexGetATanDouble }
    @inlinable public static var _complexATanH: _ValueGetterFunction { SP_ComplexGetATanHDouble }
    @inlinable public static var _complexCos: _ValueGetterFunction { SP_ComplexGetCosDouble }
    @inlinable public static var _complexCosH: _ValueGetterFunction { SP_ComplexGetCosHDouble }
    @inlinable public static var _complexExp: _ValueGetterFunction { SP_ComplexGetExpDouble }
    @inlinable public static var _complexLog: _ValueGetterFunction { SP_ComplexGetLogDouble }
    @inlinable public static var _complexConjugate: _ValueGetterFunction { SP_ComplexGetConjugateDouble }
    @inlinable public static var _complexProjection: _ValueGetterFunction { SP_ComplexGetProjectionDouble }
    @inlinable public static var _complexSin: _ValueGetterFunction { SP_ComplexGetSinDouble }
    @inlinable public static var _complexSinH: _ValueGetterFunction { SP_ComplexGetSinHDouble }
    @inlinable public static var _complexSqrt: _ValueGetterFunction { SP_ComplexGetSqrtDouble }
    @inlinable public static var _complexTan: _ValueGetterFunction { SP_ComplexGetTanDouble }
    @inlinable public static var _complexTanH: _ValueGetterFunction { SP_ComplexGetTanHDouble }
}

extension CFloat: ComplexCompatible {
    @inlinable public static var _complexMake: (_ real: CFloat, _ imaginary: CFloat) -> SP_Complex { SP_ComplexMakeWithFloats }
    @inlinable public static var _complexI: () -> CFloat { SP_ComplexIFloat }
    @inlinable public static var _complexPow: (SP_Complex, SP_Complex) -> SP_Complex { SP_ComplexPowFloat }
    
    @inlinable public static var _complexReal: _ValueGetterFunction { SP_ComplexGetRealFloat }
    @inlinable public static var _complexImaginary: _ValueGetterFunction { SP_ComplexGetImaginaryFloat }
    @inlinable public static var _complexAbs: _ValueGetterFunction { SP_ComplexGetAbsFloat }
    @inlinable public static var _complexACos: _ValueGetterFunction { SP_ComplexGetACosFloat }
    @inlinable public static var _complexACosH: _ValueGetterFunction { SP_ComplexGetACosHFloat }
    @inlinable public static var _complexArg: _ValueGetterFunction { SP_ComplexGetArgFloat }
    @inlinable public static var _complexASin: _ValueGetterFunction { SP_ComplexGetASinFloat }
    @inlinable public static var _complexASinH: _ValueGetterFunction { SP_ComplexGetASinHFloat }
    @inlinable public static var _complexATan: _ValueGetterFunction { SP_ComplexGetATanFloat }
    @inlinable public static var _complexATanH: _ValueGetterFunction { SP_ComplexGetATanHFloat }
    @inlinable public static var _complexCos: _ValueGetterFunction { SP_ComplexGetCosFloat }
    @inlinable public static var _complexCosH: _ValueGetterFunction { SP_ComplexGetCosHFloat }
    @inlinable public static var _complexExp: _ValueGetterFunction { SP_ComplexGetExpFloat }
    @inlinable public static var _complexLog: _ValueGetterFunction { SP_ComplexGetLogFloat }
    @inlinable public static var _complexConjugate: _ValueGetterFunction { SP_ComplexGetConjugateFloat }
    @inlinable public static var _complexProjection: _ValueGetterFunction { SP_ComplexGetProjectionFloat }
    @inlinable public static var _complexSin: _ValueGetterFunction { SP_ComplexGetSinFloat }
    @inlinable public static var _complexSinH: _ValueGetterFunction { SP_ComplexGetSinHFloat }
    @inlinable public static var _complexSqrt: _ValueGetterFunction { SP_ComplexGetSqrtFloat }
    @inlinable public static var _complexTan: _ValueGetterFunction { SP_ComplexGetTanFloat }
    @inlinable public static var _complexTanH: _ValueGetterFunction { SP_ComplexGetTanHFloat }
}

#if os(macOS)
extension CLongDouble: ComplexCompatible {
    @inlinable public static var _complexMake: (CLongDouble, CLongDouble) -> SP_Complex { SP_ComplexMakeWithLongDoubles }
    @inlinable public static var _complexI: () -> CLongDouble { SP_ComplexILongDouble }
    @inlinable public static var _complexPow: (SP_Complex, SP_Complex) -> SP_Complex { SP_ComplexPowLongDouble }
    
    @inlinable public static var _complexReal: _ValueGetterFunction { SP_ComplexGetRealLongDouble }
    @inlinable public static var _complexImaginary: _ValueGetterFunction { SP_ComplexGetImaginaryLongDouble }
    @inlinable public static var _complexAbs: _ValueGetterFunction { SP_ComplexGetAbsLongDouble }
    @inlinable public static var _complexACos: _ValueGetterFunction { SP_ComplexGetACosLongDouble }
    @inlinable public static var _complexACosH: _ValueGetterFunction { SP_ComplexGetACosHLongDouble }
    @inlinable public static var _complexArg: _ValueGetterFunction { SP_ComplexGetArgLongDouble }
    @inlinable public static var _complexASin: _ValueGetterFunction { SP_ComplexGetASinLongDouble }
    @inlinable public static var _complexASinH: _ValueGetterFunction { SP_ComplexGetASinHLongDouble }
    @inlinable public static var _complexATan: _ValueGetterFunction { SP_ComplexGetATanLongDouble }
    @inlinable public static var _complexATanH: _ValueGetterFunction { SP_ComplexGetATanHLongDouble }
    @inlinable public static var _complexCos: _ValueGetterFunction { SP_ComplexGetCosLongDouble }
    @inlinable public static var _complexCosH: _ValueGetterFunction { SP_ComplexGetCosHLongDouble }
    @inlinable public static var _complexExp: _ValueGetterFunction { SP_ComplexGetExpLongDouble }
    @inlinable public static var _complexLog: _ValueGetterFunction { SP_ComplexGetLogLongDouble }
    @inlinable public static var _complexConjugate: _ValueGetterFunction { SP_ComplexGetConjugateLongDouble }
    @inlinable public static var _complexProjection: _ValueGetterFunction { SP_ComplexGetProjectionLongDouble }
    @inlinable public static var _complexSin: _ValueGetterFunction { SP_ComplexGetSinLongDouble }
    @inlinable public static var _complexSinH: _ValueGetterFunction { SP_ComplexGetSinHLongDouble }
    @inlinable public static var _complexSqrt: _ValueGetterFunction { SP_ComplexGetSqrtLongDouble }
    @inlinable public static var _complexTan: _ValueGetterFunction { SP_ComplexGetTanLongDouble }
    @inlinable public static var _complexTanH: _ValueGetterFunction { SP_ComplexGetTanHLongDouble }
}
#endif

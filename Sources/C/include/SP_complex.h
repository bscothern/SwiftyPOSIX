//
//  SP_complex.h
//  SwiftyPOSIX
//
//  Created by Braden Scothern on 6/6/19.
//  Copyright © 2018-2020 Braden Scothern. All rights reserved.
//

#ifndef SP_complex_h
#define SP_complex_h

#import <complex.h>

typedef union SP_Complex {
    complex double d;
    complex float f;
    complex long double l;
} SP_Complex;

// MARK: - Construction
SP_Complex SP_ComplexMakeWithDoubles(double real, double imag);
SP_Complex SP_ComplexMakeWithFloats(float real, float imag);
SP_Complex SP_ComplexMakeWithLongDoubles(long double real, long double imag);

// MARK: - I
double SP_ComplexIDouble();
float SP_ComplexIFloat();
long double SP_ComplexILongDouble();

// MARK: - Pow
SP_Complex SP_ComplexPowDouble(SP_Complex spComplex, SP_Complex other);
SP_Complex SP_ComplexPowFloat(SP_Complex spComplex, SP_Complex other);
SP_Complex SP_ComplexPowLongDouble(SP_Complex spComplex, SP_Complex other);

// MARK: - Properties

#define SP_COMPLEX_DECLARE(NAME) \
double SP_ComplexGet##NAME##Double(SP_Complex spComplex); \
float SP_ComplexGet##NAME##Float(SP_Complex spComplex); \
long double SP_ComplexGet##NAME##LongDouble(SP_Complex spComplex);

SP_COMPLEX_DECLARE(Real)
SP_COMPLEX_DECLARE(Imaginary)
SP_COMPLEX_DECLARE(Abs)
SP_COMPLEX_DECLARE(ACos)
SP_COMPLEX_DECLARE(ACosH)
SP_COMPLEX_DECLARE(Arg)
SP_COMPLEX_DECLARE(ASin)
SP_COMPLEX_DECLARE(ASinH)
SP_COMPLEX_DECLARE(ATan)
SP_COMPLEX_DECLARE(ATanH)
SP_COMPLEX_DECLARE(Cos)
SP_COMPLEX_DECLARE(CosH)
SP_COMPLEX_DECLARE(Exp)
SP_COMPLEX_DECLARE(Log)
SP_COMPLEX_DECLARE(Conjugate)
SP_COMPLEX_DECLARE(Projection)
SP_COMPLEX_DECLARE(Sin)
SP_COMPLEX_DECLARE(SinH)
SP_COMPLEX_DECLARE(Sqrt)
SP_COMPLEX_DECLARE(Tan)
SP_COMPLEX_DECLARE(TanH)

#undef SP_COMPLEX_DECLARE

#endif

//
//  SP_complex.c
//  SwiftyPOSIX
//
//  Created by Braden Scothern on 6/6/19.
//  Copyright © 2018-2020 Braden Scothern. All rights reserved.
//

#import "../include/SP_complex.h"

#ifndef CMPLX
#define CMPLX(x, y) ((double complex)((double)(x) + _Imaginary_I * (double)(y)))
#define CMPLXF(x, y) ((float complex)((float)(x) + _Imaginary_I * (float)(y)))
#define CMPLXL(x, y) ((long double complex)((long double)(x) + _Imaginary_I * (long double)(y)))
#endif

// MARK: - Construction
SP_Complex SP_ComplexMakeWithDoubles(double real, double imag) {
    return (SP_Complex){
        .d = CMPLX(real, imag),
    };
}

SP_Complex SP_ComplexMakeWithFloats(float real, float imag) {
    return (SP_Complex){
        .f = CMPLXF(real, imag),
    };
}

SP_Complex SP_ComplexMakeWithLongDoubles(long double real, long double imag) {
    return (SP_Complex){
        .l = CMPLXL(real, imag),
    };
}

// MARK: - I
double SP_ComplexIDouble() {
    return (double)I;
}

float SP_ComplexIFloat() {
    return (float)I;
}

long double SP_ComplexILongDouble() {
    return (long double)I;
}

// MARK: - Pow
SP_Complex SP_ComplexPowDouble(SP_Complex spComplex, SP_Complex other) {
    return (SP_Complex){
        .d = cpow(spComplex.d, other.d)
    };
}

SP_Complex SP_ComplexPowFloat(SP_Complex spComplex, SP_Complex other) {
    return (SP_Complex){
        .f = cpowf(spComplex.f, other.f)
    };
}

SP_Complex SP_ComplexPowLongDouble(SP_Complex spComplex, SP_Complex other) {
    return (SP_Complex){
        .l = cpowl(spComplex.l, other.l)
    };
}


// MARK: - Properties

#define SP_COMPLEX_FUNCS(NAME,FUNC) \
double SP_ComplexGet##NAME##Double(SP_Complex spComplex) { \
    return FUNC(spComplex.d); \
} \
\
float SP_ComplexGet##NAME##Float(SP_Complex spComplex) { \
    return FUNC##f(spComplex.f); \
} \
\
long double SP_ComplexGet##NAME##LongDouble(SP_Complex spComplex) { \
    return FUNC##l(spComplex.l); \
}

SP_COMPLEX_FUNCS(Real, creal)
SP_COMPLEX_FUNCS(Imaginary, cimag)
SP_COMPLEX_FUNCS(Abs, cabs)
SP_COMPLEX_FUNCS(ACos, cacos)
SP_COMPLEX_FUNCS(ACosH, ccosh)
SP_COMPLEX_FUNCS(Arg, carg)
SP_COMPLEX_FUNCS(ASin, casin)
SP_COMPLEX_FUNCS(ASinH, casinh)
SP_COMPLEX_FUNCS(ATan, catan)
SP_COMPLEX_FUNCS(ATanH, catanh)
SP_COMPLEX_FUNCS(Cos, ccos)
SP_COMPLEX_FUNCS(CosH, ccosh)
SP_COMPLEX_FUNCS(Exp, cexp)
SP_COMPLEX_FUNCS(Log, clog)
SP_COMPLEX_FUNCS(Conjugate, conj)
SP_COMPLEX_FUNCS(Projection, cproj)
SP_COMPLEX_FUNCS(Sin, csin)
SP_COMPLEX_FUNCS(SinH, csinh)
SP_COMPLEX_FUNCS(Sqrt, csqrt)
SP_COMPLEX_FUNCS(Tan, ctan)
SP_COMPLEX_FUNCS(TanH, ctanh)

#undef  SP_COMPLEX_FUNCS

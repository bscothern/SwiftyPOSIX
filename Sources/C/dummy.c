//
//  dummy.c
//  SwiftyPOSIX
//
//  Created by Braden Scothern on 3/26/18.
//  Copyright © 2018 Braden Scothern. All rights reserved.
//

#ifdef XCODE_FRAMEWORK
#include "dummy.h"
#else
#include <SwiftyPOSIX_C/dummy.h>
#endif

const int dummyC = 0;

//
//  SP_assert.c
//  SwiftyPOSIX
//
//  Created by Braden Scothern on 4/29/19.
//  Copyright © 2018-2020 Braden Scothern. All rights reserved.
//

#include "SP_assert.h"
#include <assert.h>

void SP_assert(bool expression) {
    assert(expression);
}

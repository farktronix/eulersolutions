//
//  Util.m
//  Euler
//
//  Created by Jacob Farkas on 1/10/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "Util.h"

#include <math.h>

BOOL isPrime (uint64 n)
{
    uint64 i = 1;
    uint64 limit = (uint64)sqrtf((long double)n);
    while (++i < limit) {
        if (n % i == 0) return NO;
    }
    return YES;
}
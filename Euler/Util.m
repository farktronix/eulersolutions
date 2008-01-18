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
//    if (n == 1) return NO;
    uint64 i = 1;
    uint64 limit = (uint64)sqrtf((long double)n) + 1;
    while (++i < limit) {
        if (n % i == 0) return NO;
    }
    return YES;
}
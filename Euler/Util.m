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

// zero indexed. in the number 1234, 4 is the 0th digit, 3 is the 1st digit, etc...
int nthDigit (uint number, int digit)
{
    int above = pow(10, digit+1);
    int below = pow(10, digit);
    return ((number % above)/below);
}

static uint64_t sMaxTriangleIndex = 0;
static uint64_t sMaxTriangleValue = 0;
static NSMutableSet *sTriangleNumbers = nil;
BOOL isTriangleNumber(uint64_t n)
{
    if (sTriangleNumbers == nil) sTriangleNumbers = [[NSMutableSet alloc] init];
    while (sMaxTriangleValue < n) {
        sMaxTriangleIndex++;
        sMaxTriangleValue = (uint64_t)((0.5 * sMaxTriangleIndex) * (sMaxTriangleIndex + 1));
        [sTriangleNumbers addObject:[NSNumber numberWithLongLong:sMaxTriangleValue]];
    }
    return [sTriangleNumbers containsObject:[NSNumber numberWithLongLong:n]];
}

static uint64_t sMaxPentagonalIndex = 0;
static uint64_t sMaxPentagonalValue = 0;
static NSMutableSet *sPentagonalNumbers = nil;
BOOL isPentagonalNumber(uint64_t n)
{
    if (sPentagonalNumbers == nil) sPentagonalNumbers = [[NSMutableSet alloc] init];
    while (sMaxPentagonalValue < n) {
        sMaxPentagonalIndex++;
        sMaxPentagonalValue = (uint64_t)((sMaxPentagonalIndex * (3 * sMaxPentagonalIndex - 1))/2);
        [sPentagonalNumbers addObject:[NSNumber numberWithLongLong:sMaxPentagonalValue]];
    }
    return [sPentagonalNumbers containsObject:[NSNumber numberWithLongLong:n]];
}

static uint64_t sMaxHexagonalIndex = 0;
static uint64_t sMaxHexagonalValue = 0;
static NSMutableSet *sHexagonalNumbers = nil;
BOOL isHexagonalNumber(uint64_t n)
{
    if (sHexagonalNumbers == nil) sHexagonalNumbers = [[NSMutableSet alloc] init];
    while (sMaxHexagonalValue < n) {
        sMaxHexagonalIndex++;
        sMaxHexagonalValue = (uint)(sMaxHexagonalIndex * (2 * sMaxHexagonalIndex - 1));
        [sHexagonalNumbers addObject:[NSNumber numberWithLongLong:sMaxHexagonalValue]];
    }
    return [sHexagonalNumbers containsObject:[NSNumber numberWithLongLong:n]];
}

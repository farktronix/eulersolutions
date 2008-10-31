//
//  Util.h
//  Euler
//
//  Created by Jacob Farkas on 1/10/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <openssl/bn.h>

BOOL isPrime (uint64 n);
int nthDigit (uint number, int digit);

BOOL isTriangleNumber(uint64_t n);
BOOL isPentagonalNumber(uint64_t n);
BOOL isHexagonalNumber(uint64_t n);
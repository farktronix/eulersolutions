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

uint64_t iPow(int x, int n);
int iLog(uint64_t n);

BOOL isTriangleNumber(uint64_t n);
BOOL isPentagonalNumber(uint64_t n);
BOOL isHexagonalNumber(uint64_t n);
BOOL isPalindrome(uint64_t n);

uint64_t fact(int n);
uint64_t choose(int n, int m);

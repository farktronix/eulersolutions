//
//  Problem35.m
//  Euler
//
//  Created by Jacob Farkas on 1/18/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PEProblem.h"
#import "Util.h"

/*
The number, 197, is called a circular prime because all rotations of the digits: 197, 971, and 719, are themselves prime.

There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.

How many circular primes are there below one million?
*/

@interface Problem35 : PEProblem {
}
@end

static BOOL isCircular (uint64 num)
{
    int exp = (int)log10(num);
    uint64 curNum = num;
    int ii = 0;
    for (ii = 0; ii < exp; ii++) {
        int lastDigit = curNum % 10;
        curNum /= 10;
        curNum += lastDigit * pow(10, exp);
        if (!isPrime(curNum)) return NO;
    }
    return YES;
}

@implementation Problem35
- (NSString *) runSolution
{
    uint64 curnum;
    int numCircularPrimes = 0;
    for (curnum = 2; curnum < 1000000; curnum++) {
        if (isPrime(curnum)) {
            if (isCircular(curnum)) {
                numCircularPrimes++;
            }
        }
    } 
    return [NSString stringWithFormat:@"%d", numCircularPrimes];
}

- (NSString *) realAnswer { return @"55"; }
@end

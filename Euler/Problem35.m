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
    if (num < 10) {
        return YES;
    }
    else if (num < 100) {
        uint64 digit1 = num / 10;
        uint64 digit2 = num % 10;
        return isPrime(digit2 * 10 + digit1);
    }
    else if (num < 1000) {
        uint64 digit1 = num / 100;
        uint64 digit2 = (num % 100) / 10;
        uint64 digit3 = num % 10;
        return isPrime(digit2 * 100 + digit3 * 10 + digit1) && 
               isPrime(digit3 * 100 + digit1 * 10 + digit2);
    }
    else if (num < 10000) {
        uint64 digit1 = num / 1000;
        uint64 hundreds = num % 1000;
        uint64 digit2 = hundreds / 100;
        uint64 digit3 = (hundreds % 100) / 10;
        uint64 digit4 = num % 10;
        return isPrime(digit2 * 1000 + digit3 * 100 + digit4 * 10 + digit1) && 
               isPrime(digit3 * 1000 + digit4 * 100 + digit1 * 10 + digit2) && 
               isPrime(digit4 * 1000 + digit1 * 100 + digit2 * 10 + digit3);
    } else if (num < 100000) {
//        uint64 digit1 = num / 10000;
//        uint64 thousands = num % 10000;
//        uint64 digit2 = (thousands / 1000);
//        uint64 hundreds = thousands % 1000;
//        uint64 digit2 = hundreds / 100;
//        uint64 digit3 = (hundreds % 100) / 10;
//        uint64 digit4 = num % 10;
//        return isPrime(digit2 * 1000 + digit3 * 100 + digit4 * 10 + digit1) && 
//               isPrime(digit3 * 1000 + digit4 * 100 + digit1 * 10 + digit2) && 
//               isPrime(digit4 * 1000 + digit1 * 100 + digit2 * 10 + digit3);
    }
    return NO;
}

@implementation Problem35
- (NSString *) runSolution
{
    uint64 curnum;
    int numCircularPrimes = 0;
    for (curnum = 2; curnum < 1000; curnum++) {
        if (isPrime(curnum) && isCircular(curnum)) {
            numCircularPrimes++;
        }
    } 
    printf("\n");
    return [NSString stringWithFormat:@"%d", numCircularPrimes];
}

- (NSString *) realAnswer { return nil; }
@end

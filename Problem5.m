//
//  Problem5.m
//  Euler
//
//  Created by Jacob Farkas on 12/19/11.
//  Copyright (c) 2011 Apple, Inc. All rights reserved.
//

#import "PEProblem.h"

/*
 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
 
 What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20? 
*/

@interface Problem5 : PEProblem

@end

@implementation Problem5
- (NSString *) runSolution
{
    uint64_t bignum = 1;
    int i;
    while (1) {
        for (i = 20; i >= 0; i--) {
            if (i == 0) goto done;
            if (bignum % i != 0) {
                bignum += i - (bignum % i);
                break;
            }
        }
    }
done:
    return [NSString stringWithFormat:@"%d", bignum];
}

- (NSString *)realAnswer { return @"232792560"; }
@end

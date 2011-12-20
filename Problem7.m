//
//  Problem7.m
//  Euler
//
//  Created by Jacob Farkas on 12/19/11.
//  Copyright (c) 2011 Apple, Inc. All rights reserved.
//

#import "PEProblem.h"
#import "FUNumber.h"

/*
 By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
 
 What is the 10 001st prime number?
*/

@interface Problem7 : PEProblem

@end

@implementation Problem7
- (NSString *) runSolution
{
    FUNumber *curPrime = [FUNumber numberWithInt:2];
    int i;
    for (i = 1; i < 10001; i++) {
        [curPrime nextPrime];
    }
    
    return [curPrime description];
}

- (NSString *)realAnswer { return @"104743"; }
@end

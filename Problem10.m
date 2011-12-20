//
//  Problem10.m
//  Euler
//
//  Created by Jacob Farkas on 12/19/11.
//  Copyright (c) 2011 Apple, Inc. All rights reserved.
//

#import "PEProblem.h"
#import "FUNumber.h"

/*
 The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
 
 Find the sum of all the primes below two million.
*/

@interface Problem10 : PEProblem

@end

@implementation Problem10
- (NSString *) runSolution
{
    FUNumber *result = [FUNumber number];
    FUNumber *curPrime = [FUNumber numberWithInt:2];
    FUNumber *limit = [FUNumber numberWithInt:2000000];
    
    while ([curPrime compare:limit] == NSOrderedAscending) {
        [result add:curPrime];
        [curPrime nextPrime];
    }
    
    return [result description];
}

- (NSString *)realAnswer { return @"142913828922"; }
@end

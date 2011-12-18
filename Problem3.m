//
//  Problem3.m
//  Euler
//
//  Created by Jacob Farkas on 1/10/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PEProblem.h"
#import "Util.h"

/*
The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 317584931803?
*/

@interface Problem3 : PEProblem {
}
@end

@implementation Problem3
- (NSString *) runSolution
{
    uint64 largest = 0;
    uint64 i;
    uint64 sq = (uint64)sqrtf(317584931803.0);
    for (i = 2; i < sq; i++) {
        if (isPrime(i) && ((uint64)317584931803) % i == 0) {
            if (self.verbose) printf("%d ", i);
            largest = i;
        }
    }
    return [NSString stringWithFormat:@"%u", largest];
}
- (NSString *) realAnswer { return @"3919"; }
@end

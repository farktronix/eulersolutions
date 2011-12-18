//
//  Problem23.m
//  Euler
//
//  Created by Jacob Farkas on 9/25/08.
//  Copyright 2008 Apple Computer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PEProblem.h"

@interface Problem23 : PEProblem {
}
@end
 

@implementation Problem23

BOOL isAbundant (uint x)
{
    uint sum = 1;
    uint i;
    for (i = 2; i < x; i++) {
        if (x % i == 0) {
            sum += i;
        }
    }
    return sum > x;
}

- (NSString *) runSolution
{
    uint abundants[28124] = {0};
    uint goodNums[28124] = {0};
    uint abtPtr = 0;
    int sum = 0;
    int i, j;
    for (i = 1; i < 28124; i++) {
        goodNums[i] = i;
        if (isAbundant(i)) {
            abundants[abtPtr++] = i;
        }
    }
    
    for (i = 0; i < abtPtr; i++) {
        for (j = i; j < abtPtr; j++) {
            int curSum = abundants[i] + abundants[j];
            if (curSum < 28124) goodNums[curSum] = 0;
        }
    }
    
    for (i = 0; i < 28124; i++) sum += goodNums[i];
    
    return [NSString stringWithFormat:@"%d", sum];
}

- (NSString *) realAnswer { return @"4179871"; }

@end

//
//  Problem85.m
//  Euler
//
//  Created by Jacob Farkas on 10/31/08.
//  Copyright 2008 Apple Computer. All rights reserved.
//

#import "PEProblem.h"

@interface Problem85 : PEProblem {
}
@end

@implementation Problem85
static uint64_t rectsInRect (uint64_t x, uint64_t y)
{
    uint64_t sum = 0;
    int ii;
    int jj;
    for (ii = 1; ii < x + 1; ii++) {
        for (jj = 1; jj < y + 1; jj++) {
            uint64_t curSum = choose(x, ii) * choose(y, jj);
            NSLog(@"Adding %llu to %llu", curSum, sum);
            sum += curSum;
        }
    }
    return sum;
}

- (NSString *) runSolution 
{
    NSLog(@"%llu", rectsInRect(3, 2));
    return nil;
}

- (NSString *) realAnswer { return nil; }
@end
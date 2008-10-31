//
//  Problem40.m
//  Euler
//
//  Created by Jacob Farkas on 10/27/08.
//  Copyright 2008 Apple Computer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PEProblem.h"

@interface Problem40 : PEProblem {
}
@end

@implementation Problem40
- (int) getDigit:(int)x
{
    if (x < 10) return x;
    int p = 1;
    int numNums = 1;
    while (numNums < x) {
        int step = (pow(10, p) - pow(10, p - 1)) * p;
        if (numNums + step > x) break;
        numNums += step;
        p++;
    }
    int diff = x - numNums;
    int incNum = (diff / p) + pow(10, p - 1);
    int digit = diff % p;
    return nthDigit(incNum, p - 1 - digit);
}

- (NSString *) runSolution 
{
    int product = 1;
    int ii;
    for (ii = 1; ii < 1000001; ii *= 10) {
        int value = [self getDigit:ii];
        product *= value;
        NSLog(@"(%d) Value: %d, Product: %d", ii, value, product);
    }
    return [NSString stringWithFormat:@"%d", product];
}

- (NSString *) realAnswer { return @"210"; }
@end

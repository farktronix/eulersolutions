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
    int base = 0;
    int p = 0;
    while (base < x) {
        int t = (pow(10, p + 1) - base - 1) * (p + 1);
        if (t > x) break;
        p++;
        base = t;
    }
    int off = x - base;
    int num = off / (int)pow(10, p);
    int digit = off % (int)pow(10, p);
    return nthDigit(num, digit);
}

- (NSString *) runSolution 
{
    int ii;
    for (ii = 1; ii < 50; ii++) {
        NSLog(@"%d: %d", ii, [self getDigit:ii]);
    }
    return nil;
}

- (NSString *) realAnswer { return nil; }
@end

//
//  Problem1.m
//  Euler
//
//  Created by Jacob Farkas on 1/9/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PEProblem.h"

/*
If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.
*/

@interface Problem1 : PEProblem {
}
@end

@implementation Problem1
- (NSString *) runSolution
{
    int i;
    int sum = 0;
    for (i = 0; i < 1000; i++) {
        if (i % 3 == 0 || i % 5 == 0) sum += i;
    }
    return [NSString stringWithFormat:@"%d", sum];
}

- (NSString *) realAnswer { return @"233168"; }
@end

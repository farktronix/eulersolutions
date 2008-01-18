//
//  Problem28.m
//  Euler
//
//  Created by Jacob Farkas on 1/18/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "PEProblem.h"

/*

Starting with the number 1 and moving to the right in a clockwise direction a 5 by 5 spiral is formed as follows:

21 22 23 24 25
20  7  8  9 10
19  6  1  2 11
18  5  4  3 12
17 16 15 14 13

It can be verified that the sum of both diagonals is 101.

What is the sum of both diagonals in a 1001 by 1001 spiral formed in the same way?

*/

@interface Problem28 : PEProblem {
}
@end

@implementation Problem28
- (NSString *) runSolution 
{
    uint64 sum = 1;
    int curnum = 1;
    int increment = 2;
    while (increment < 1002) {
        int fourtimes;
        for (fourtimes = 0; fourtimes < 4; fourtimes++) {
            curnum += increment;
            sum += curnum;
        }
        increment += 2;
    }
    return [NSString stringWithFormat:@"%d", sum];
}

- (NSString *) realAnswer { return @"669171001"; }

@end

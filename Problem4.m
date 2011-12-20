//
//  Problem4.m
//  Euler
//
//  Created by Jacob Farkas on 12/19/11.
//  Copyright (c) 2011 Apple, Inc. All rights reserved.
//

#import "PEProblem.h"
#import "Util.h"

/*
 A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 99.
 
 Find the largest palindrome made from the product of two 3-digit numbers.
*/

@interface Problem4 : PEProblem {
}
@end

@implementation Problem4

- (NSString *) runSolution
{
    int best = 0;
    int i, j;
    for (i = 999; i > 0; i--) {
        if ((i*i) < best) break;
        for (j = i; j > 0; j--) {
            int prod = j*i;
            if (isPalindrome(prod) && (prod > best)) {
                best = prod;
            }
        }
    }
    return [NSString stringWithFormat:@"%d", best];
}

- (NSString *) realAnswer { return @"906609"; }
@end

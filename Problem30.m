//
//  Problem30.m
//  Euler
//
//  Created by Jacob Farkas on 12/19/11.
//  Copyright (c) 2011 Apple, Inc. All rights reserved.
//

#import "PEProblem.h"

/*
 Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:
 
 1634 = 1^4 + 6^4 + 3^4 + 4^4
 8208 = 8^4 + 2^4 + 0^4 + 8^4
 9474 = 9^4 + 4^4 + 7^4 + 4^4
 As 1 = 1^4 is not a sum it is not included.
 
 The sum of these numbers is 1634 + 8208 + 9474 = 19316.
 
 Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.
*/

@interface Problem30 : PEProblem

@end

@implementation Problem30
- (NSString *) runSolution
{
    return @"";
}

- (NSString *)realAnswer { return @"443839"; }
@end

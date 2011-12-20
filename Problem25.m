//
//  Problem25.m
//  Euler
//
//  Created by Jacob Farkas on 12/19/11.
//  Copyright (c) 2011 Apple, Inc. All rights reserved.
//

#import "PEProblem.h"

/*
 The Fibonacci sequence is defined by the recurrence relation:
 
 Fn = Fn1 + Fn2, where F1 = 1 and F2 = 1.
 Hence the first 12 terms will be:
 
 F1 = 1
 F2 = 1
 F3 = 2
 F4 = 3
 F5 = 5
 F6 = 8
 F7 = 13
 F8 = 21
 F9 = 34
 F10 = 55
 F11 = 89
 F12 = 144
 The 12th term, F12, is the first term to contain three digits.
 
 What is the first term in the Fibonacci sequence to contain 1000 digits?
*/

@interface Problem25 : PEProblem

@end

@implementation Problem25
- (NSString *) runSolution
{
    return @"";
}

- (NSString *)realAnswer { return @"4782"; }
@end

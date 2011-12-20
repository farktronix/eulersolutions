//
//  Problem9.m
//  Euler
//
//  Created by Jacob Farkas on 12/19/11.
//  Copyright (c) 2011 Apple, Inc. All rights reserved.
//

#import "PEProblem.h"

/*
 A Pythagorean triplet is a set of three natural numbers, a  b  c, for which,
 
 a^2 + b^2 = c^2
 For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
 
 There exists exactly one Pythagorean triplet for which a + b + c = 1000.
 Find the product abc.
*/

@interface Problem9 : PEProblem

@end

@implementation Problem9
- (NSString *) runSolution
{
    int a, b, c;
    for (c = 1; c < 999; c++) {
        for (a = 1; a < (1000 - c); a++) {
            b = 1000 - c - a;
            if ((a * a) + (b * b) == (c * c)) return [NSString stringWithFormat:@"%d", a * b * c];
        }
    }
    
    return nil;
}

- (NSString *)realAnswer { return @"31875000"; }
@end

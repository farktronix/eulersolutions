//
//  Problem6.m
//  Euler
//
//  Created by Jacob Farkas on 12/19/11.
//  Copyright (c) 2011 Apple, Inc. All rights reserved.
//

#import "PEProblem.h"
#import "FUNumber.h"

/*
 The sum of the squares of the first ten natural numbers is,
 
 1^2 + 2^2 + ... + 10^2 = 385
 The square of the sum of the first ten natural numbers is,
 
 (1 + 2 + ... + 10)^2 = 55^2 = 3025
 Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 - 385 = 2640.
 
 Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum. 
*/

@interface Problem6 : PEProblem

@end

@implementation Problem6
- (NSString *) runSolution
{
    FUNumber *sumSquares = [FUNumber number];
    uint64_t i;
    for (i = 1; i < 101; i++) {
        [sumSquares addInt:i*i];
    }
    
    FUNumber *squareSums = [FUNumber numberWithInt:(100 * 50) + 50];
    [squareSums multiply:squareSums];
    
    [squareSums subtract:sumSquares];
    
    return [squareSums description];
}

- (NSString *)realAnswer { return @"25164150"; }
@end

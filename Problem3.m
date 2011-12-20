//
//  Problem3.m
//  Euler
//
//  Created by Jacob Farkas on 1/10/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PEProblem.h"
#import "FUNumber.h"
#import "Util.h"

/*
The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 317584931803?
*/

@interface Problem3 : PEProblem {
}
@end

@implementation Problem3
- (NSString *) runSolution
{
    FUNumber *num = [FUNumber numberWithString:@"317584931803"];
    FUNumber *numLimit = [num sqrt];
    FUNumber *i = [FUNumber numberWithInt:2];
    FUNumber *largest = nil;
    
    while ([i compare:numLimit] == NSOrderedAscending) {
        if ([[num mod:i] intValue] == 0) {
            [largest release];
            largest = [i copy];
        }
        [i nextPrime];
    }
    return [largest description];
}
- (NSString *) realAnswer { return @"3919"; }
@end

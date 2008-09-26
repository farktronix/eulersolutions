//
//  Problem23.m
//  Euler
//
//  Created by Jacob Farkas on 9/25/08.
//  Copyright 2008 Apple Computer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PEProblem.h"

@interface Problem23 : PEProblem {
}
@end
 

@implementation Problem23

BOOL isAbundant (uint x)
{
    uint sum = 1;
    uint i;
    for (i = 2; i < x; i++) {
        if (x % i == 0) sum += i;
    }
    return sum > x;
}

- (NSString *) runSolution
{
    NSMutableArray *abundantNumbers = [[NSMutableArray alloc] init];
    int sum = 0;
    int i;
    for (i = 1; i < 28124; i++) {
        if (isAbundant(i)) {
            sum += i;
        }
    }
    [abundantNumbers release];
    return [NSString stringWithFormat:@"%d", sum];
}

- (NSString *) realAnswer { return nil; }

@end

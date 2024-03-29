//
//  PEProblem.m
//  Euler
//
//  Created by Jacob Farkas on 1/9/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "PEProblem.h"

#import <mach/mach_time.h>

@implementation PEProblem

@synthesize showResult = _showResult;
@synthesize showTiming = _showTiming;
@synthesize verbose = _verbose;
@synthesize solveTime = _solveTime;

- (id) init
{
    if ((self = [super init])) {
        _verbose = NO;
        _showResult = YES;
        _showTiming = NO;
        _solveTime = 0;
    }
    return self;
}

- (NSString *) solveProblem
{
    static mach_timebase_info_data_t sTimebaseInfo;
    if (sTimebaseInfo.denom == 0) {
        (void) mach_timebase_info(&sTimebaseInfo);
    }
    
    uint64_t starttime = mach_absolute_time();
    NSString *solution = [self runSolution];
    uint64_t endtime = mach_absolute_time();
    _solveTime = endtime - starttime;
    
    dispatch_sync(dispatch_get_main_queue(), ^{
        printf("Problem #%03d %s", [self _problemNumber], [solution isEqualToString:[self realAnswer]] ? "succeeded" : "failed");
        
        if (self.showResult) printf(": %s", [solution UTF8String]);
        if (self.showTiming) {
            printf(" in %0.4fms", (_solveTime * sTimebaseInfo.numer / sTimebaseInfo.denom) / 1000000.0);
        }
        
        printf("\n");
    });
    
    return solution;
}

- (int) _problemNumber
{
    int num = 0;
    if ([[self className] length] > 7) {
        num = [[[self className] substringFromIndex:7] intValue];
    }
    return num;
}

- (NSString *) runSolution
{
    NSAssert(0, @"runSolution called on the superclass. This shouldn't happen");
    return @"";
}

- (NSString *) realAnswer
{
    return @"";
}

@end

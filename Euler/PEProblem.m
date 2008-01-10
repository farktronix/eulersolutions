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

- (id) init
{
    if ((self = [super init])) {
        _verbose = NO;
        _showResult = YES;
        _showTiming = NO;
    }
    return self;
}

- (NSString *) solveProblem
{
    static mach_timebase_info_data_t sTimebaseInfo;
    if (sTimebaseInfo.denom == 0) {
        (void) mach_timebase_info(&sTimebaseInfo);
    }
    
    printf("Solving Problem #%03d ... ", [self _problemNumber]);
    uint64_t starttime = mach_absolute_time();
    NSString *solution = [self _runSolution];
    uint64_t endtime = mach_absolute_time();
    uint64_t duration = endtime - starttime;
    printf("Done", _showResult);
    
    if (self.showResult) printf(":\t%s", [solution UTF8String]);
    if (self.showTiming) {
        printf("\t\t(%0.4fms)", (duration * sTimebaseInfo.numer / sTimebaseInfo.denom) / 1000000.0);
    }
    
    printf("\n");
    
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

- (NSString *) _runSolution
{
    NSAssert(0, @"_runSolution called on the superclass. This shouldn't happen");
    return @"";
}

- (NSString *) _realAnswer
{
    return @"";
}
@end

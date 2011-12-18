//
//  Problem42.m
//  Euler
//
//  Created by Jacob Farkas on 10/28/08.
//  Copyright 2008 Apple Computer. All rights reserved.
//

#import "Problem42.h"
#import "PEProblem.h"

@interface Problem42 : PEProblem {
}
@end

@implementation Problem42
static uint sMaxTriangleIndex = 0;
static uint sMaxTriangleValue = 0;
static NSMutableSet *sTriangleNumbers = nil;
- (BOOL) isTriangleNumber:(uint)n
{
    if (sTriangleNumbers == nil) sTriangleNumbers = [[NSMutableSet alloc] init];
    while (sMaxTriangleValue < n) {
        sMaxTriangleIndex++;
        sMaxTriangleValue = (int)((0.5 * sMaxTriangleIndex) * (sMaxTriangleIndex + 1));
        [sTriangleNumbers addObject:[NSNumber numberWithInt:sMaxTriangleValue]];
    }
    return [sTriangleNumbers containsObject:[NSNumber numberWithInt:n]];
}

- (int) letterSumForWord:(NSString *)word
{
    int sum = 0;
    int ii;
    for (ii = 0; ii < [word length]; ii++) {
        sum += [word characterAtIndex:ii] - 'A' + 1;
    }
    return sum;
}

- (NSString *) runSolution 
{
    int count = 0;
    int ii;
    for (ii = 0; sAllWords[ii]; ii++) {
        int sum = [self letterSumForWord:sAllWords[ii]];
        if ([self isTriangleNumber:sum]) count++;
    }
    return [NSString stringWithFormat:@"%d", count];
}

- (NSString *) realAnswer { return @"162"; }
@end

//
//  Problem40.m
//  Euler
//
//  Created by Jacob Farkas on 10/27/08.
//  Copyright 2008 Apple Computer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PEProblem.h"

@interface Problem40 : PEProblem {
}
@end

@implementation Problem40
- (int) getDigit:(int)x
{
    int digits = 1;
    
}

- (NSString *) runSolution 
{
    int ii;
    for (ii = 1; ii < 150; ii++) {
        NSLog(@"Digit %d is %d", ii, [self getDigit:ii]);
    }
    return nil;
}

- (NSString *) realAnswer { return nil; }
@end

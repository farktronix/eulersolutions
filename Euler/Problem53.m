//
//  Problem53.m
//  Euler
//
//  Created by Jacob Farkas on 11/2/08.
//  Copyright 2008 Apple Computer. All rights reserved.
//

#import "PEProblem.h"

@interface Problem53 : PEProblem {
}
@end

@implementation Problem53
- (NSString *) runSolution 
{
    int n,m;
    int sum = 0;
    for (n = 1; n < 101; n++) {
        for (m = 1; m <= n; m++) {
            if (choose(n, m)) sum++;
        }
    }
    return [NSString stringWithFormat:@"%d", sum];
}

- (NSString *) realAnswer { return nil; }
@end

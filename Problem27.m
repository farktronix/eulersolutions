//
//  Problem27.m
//  Euler
//
//  Created by Jacob Farkas on 12/16/08.
//  Copyright 2008 Apple Computer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PEProblem.h"

@interface Problem27 : PEProblem {
}
@end


@implementation Problem27
int checkCoefficients (int a, int b)
{
    int n = 0;
    int result = 0;
    do {
        n++;
        result = (n*n) + (a*n) + b;
    } while (isPrime((uint64)ABS(result)));
    return n;
}

- (NSString *) runSolution
{
    int a, b;
    int maxn = 0;
    int maxa, maxb;
    for (a = -1000; a < 1000; a++) {
        if (a == 0 || !isPrime((uint64)ABS(a))) continue;
        for (b = -1000; b < 1000; b++) {
            if (b == 0 || !isPrime((uint64)ABS(b))) continue;
            int curn = checkCoefficients(a, b);
            if (curn > maxn) {
                maxa = a;
                maxb = b;
                maxn = curn;
            }
        }
    }
    
    return [NSString stringWithFormat:@"%d", maxa * maxb];
}

- (NSString *) realAnswer { return @"-59231"; }
@end
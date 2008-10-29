//
//  Problem52.m
//  Euler
//
//  Created by Jacob Farkas on 10/28/08.
//  Copyright 2008 Apple Computer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PEProblem.h"

@interface Problem52 : PEProblem {
}
@end

@implementation Problem52

int bitmaskForDigits (int digits)
{
    int bitmask = 0;
    while (digits) {
        int curmask = 1 << (digits % 10);
        if (bitmask & curmask) return 0;
        bitmask |= curmask;
        digits = (int)(digits / 10);
    }
    return bitmask;
}

- (NSString *) runSolution 
{
    int ii = 0;
    while (ii < INT_MAX) {
        if ((int)log10(ii) != (int)log10(6 * ii)) {
            ii = pow(10, (int)log10(ii) + 1);
            continue;
        }
    
        int b1 = bitmaskForDigits(ii);
        if (b1) {
            int jj;
            int curBitmask = 0;
            for (jj = 2; jj < 7; jj++) {
                curBitmask = bitmaskForDigits(ii * jj);
                if (curBitmask != b1) break;
            }
            if (jj >= 6 && b1 == curBitmask) return [NSString stringWithFormat:@"%d", ii];
        }
        ii++;
    }
    return nil;
}

- (NSString *) realAnswer { return @"142857"; }
@end

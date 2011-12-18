//
//  Problem45.m
//  Euler
//
//  Created by Jacob Farkas on 10/31/08.
//  Copyright 2008 Apple Computer. All rights reserved.
//

#import "PEProblem.h"
#import "Util.h"

/*
 Triangle, pentagonal, and hexagonal numbers are generated by the following formulae:
 
 Triangle	 	Tn=n(n+1)/2	 	1, 3, 6, 10, 15, ...
 Pentagonal	 	Pn=n(3n1)/2	 	1, 5, 12, 22, 35, ...
 Hexagonal	 	Hn=n(2n1)	 	1, 6, 15, 28, 45, ...
 It can be verified that T285 = P165 = H143 = 40755.
 
 Find the next triangle number that is also pentagonal and hexagonal.
 */

@interface Problem45 : PEProblem {
}
@end

@implementation Problem45

- (NSString *) runSolution
{
    uint64_t ii = 285;
    while (ii++) {
        uint64_t tri = ii * (ii + 1)/2;
        if (isPentagonalNumber(tri) && isHexagonalNumber(tri))
            return [NSString stringWithFormat:@"%d", tri];
    }
    return nil;
}

- (NSString *) realAnswer { return @"1533776805"; }
@end


//
//  Problem81.m
//  Euler
//
//  Created by Jacob Farkas on 1/23/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "Problem82.h"
#import "PEProblem.h"

/*
In the 5 by 5 matrix below, the minimal path sum from the top left to the bottom right, by only moving to the right and down, is indicated in red and is equal to 2427.


131	673	234	103	18
201	96	342	965	150
630	803	746	422	111
537	699	497	121	956
805	732	524	37	331

Find the minimal path sum, in matrix.txt (right click and 'Save Link/Target As...'), a 31K text file containing a 80 by 80 matrix, from the top left to the bottom right by only moving right and down.
*/

@interface Problem81 : PEProblem {
}
@end

@implementation Problem81
- (NSString *) runSolution 
{
    int i, j;
    int best[kMatrixSize][kMatrixSize];
    
    for (i = 0; i < kMatrixSize; i++) {
        for (j = 0; j < kMatrixSize; j++) {
            best[i][j] = INT_MAX;
        }
    } 
    
    for (i = 0; i < kMatrixSize; i++) {
        j = kMatrixSize - 2;
        best[i][j] = matrix[i][j] + matrix[i][j + 1];
    }
    
    for (j = kMatrixSize - 2; j >= 0; j--) {
        best[i][j] = matrix[kMatrixSize - 1][j] + best[kMatrixSize - 1][j + 1];
    }


    int lowest = INT_MAX;
    for (i = 0; i < kMatrixSize; i++) {
        lowest = MIN(best[i][0], lowest);
    }
    
    return [NSString stringWithFormat:@"%d", lowest];
}

- (NSString *) realAnswer { return @""; }
@end
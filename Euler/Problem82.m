//
//  Problem82.m
//  Euler
//
//  Created by Jacob Farkas on 1/23/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "Problem82.h"
#import "PEProblem.h"

/*
The minimal path sum in the 5 by 5 matrix below, by starting in any cell in the left column and finishing in any cell in the right column, and only moving up, down, and right, is indicated in red; the sum is equal to 994.


131	673	234	103	18
201	96	342	965	150
630	803	746	422	111
537	699	497	121	956
805	732	524	37	331

Find the minimal path sum, in matrix.txt (right click and 'Save Link/Target As...'), a 31K text file containing a 80 by 80 matrix, from the left column to the right column.
*/

@interface Problem82 : PEProblem {
}
@end

@implementation Problem82
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
    
    for (j = kMatrixSize - 3; j >= 0; j--) {
        for (i = 0; i < kMatrixSize; i++) {
            best[i][j] = MIN(matrix[i][j] + best[i][j + 1], best[i][j]);
        }
        
        for (i = 1; i < kMatrixSize; i++) {
            best[i][j] = MIN(matrix[i][j] + best[i - 1][j], best[i][j]);
        }
        
        for (i = kMatrixSize - 2; i >= 0; i--) {
            best[i][j] = MIN(matrix[i][j] + best[i + 1][j], best[i][j]);
        }        
    }
    
//    printf("\n\n");
//    for (i = 0; i < kMatrixSize; i++) {
//        for (j = 0; j < kMatrixSize; j++) {
//            printf("%03d ", best[i][j]);
//        }
//        printf("\n");
//    } 

    int lowest = INT_MAX;
    for (i = 0; i < kMatrixSize; i++) {
        lowest = MIN(best[i][0], lowest);
    }
    
    return [NSString stringWithFormat:@"%d", lowest];
}

- (NSString *) realAnswer { return @"260324"; }

@end

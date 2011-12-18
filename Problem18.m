//
//  Problem18.m
//  Euler
//
//  Created by Jacob Farkas on 1/10/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Problem18.h"
#import "PEProblem.h"

/*
By starting at the top of the triangle below and moving to adjacent numbers on the row below, the maximum total from top to bottom is 23.

3
7 5
2 4 6
8 5 9 3

That is, 3 + 7 + 4 + 9 = 23.

Find the maximum total from top to bottom in triangle.txt (right click and 'Save Link/Target As...'), a 15K text file containing a triangle with one-hundred rows.
*/

@interface Problem18 : PEProblem {
}
@end

@implementation Problem18
- (NSString *) runSolution
{
    int i, j;
    for (i = kTreeHeight - 2; i >= 0; i--) {
        for (j = 0; j < i + 1; j++) {
            tree[i][j] += MAX(tree[i+1][j], tree[i+1][j+1]);
        }
    }
    
    return [NSString stringWithFormat:@"%d", tree[0][0]];
}

- (NSString *) realAnswer { return @"1074"; }
@end

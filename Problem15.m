//
//  Problem15.m
//  Euler
//
//  Created by Jacob Farkas on 12/19/11.
//  Copyright (c) 2011 Apple, Inc. All rights reserved.
//

#import "PEProblem.h"

/*
 Starting in the top left corner of a 22 grid, there are 6 routes (without backtracking) to the bottom right corner.
 
     == ==      == --      == --
    |  |  #    |  #  |    |  #  |
     -- --      -- ==      -- --
    |  |  #    |  |  #    |  #  |
     -- --*     -- --*     -- ==*
 
     -- --      -- --      -- --
    #  |  |    #  |  |    #  |  |
     == ==      == --      -- --
    |  |  #    |  #  |    #  |  |
     -- --*     -- ==*     == ==*
 
 
 How many routes are there through a 2020 grid?
*/

@interface Problem15 : PEProblem

@end

@implementation Problem15
- (NSString *) runSolution
{
    return @"";
}

- (NSString *)realAnswer { return @"137846528820"; }
@end

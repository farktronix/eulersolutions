//
//  PEProblem.h
//  Euler
//
//  Created by Jacob Farkas on 1/9/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PEProblem : NSObject {
    BOOL _showResult;
    BOOL _showTiming;
    BOOL _verbose;
}
- (NSString *) solveProblem;

@property BOOL showResult;
@property BOOL showTiming;
@property BOOL verbose;

@end

@interface PEProblem (InternalGoo)
- (int) _problemNumber;
- (NSString *) runSolution;
- (NSString *) realAnswer;
@end
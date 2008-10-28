//
//  Problem102.m
//  Euler
//
//  Created by Jacob Farkas on 10/28/08.
//  Copyright 2008 Apple Computer. All rights reserved.
//

#import "Problem102.h"
#import "PEProblem.h"

/*
Three distinct points are plotted at random on a Cartesian plane, for which -1000  x, y  1000, such that a triangle is formed.

Consider the following two triangles:

A(-340,495), B(-153,-910), C(835,-947)

X(-175,41), Y(-421,-714), Z(574,-645)

It can be verified that triangle ABC contains the origin, whereas triangle XYZ does not.

Using triangles.txt (right click and 'Save Link/Target As...'), a 27K text file containing the co-ordinates of one thousand "random" triangles, find the number of triangles for which the interior contains the origin.

NOTE: The first two examples in the file represent the triangles in the example given above.
*/

@interface Problem102 : PEProblem {
}
@end

#define xpos 0x01
#define xneg 0x02
#define ypos 0x04
#define yneg 0x08

@implementation Problem102

static char _axesForLine (NSPoint p1, NSPoint p2)
{
    char axes = 0;
    double m = (p1.y - p2.y)/(p1.x - p2.x);
    double b = p1.y - (m * p1.x);

    double yint = b;
    double xint = -b / m;
    
    if (yint <= p1.y && yint >= p2.y ||
        yint >= p1.y && yint <= p2.y) {
        axes |= (yint > 0) ? ypos : yneg;
    }
    
    if (xint <= p1.x && xint >= p2.x ||
        xint >= p1.x && xint <= p2.x) {
        axes |= (xint > 0) ? xpos : xneg;
    }
    return axes;
}

static BOOL _containsOrigin (NSPoint p1, NSPoint p2, NSPoint p3)
{
    unsigned char axes = 0;
    axes |= _axesForLine(p1, p2);
    axes |= _axesForLine(p2, p3);
    axes |= _axesForLine(p1, p3);
    return (axes == (xpos + xneg + ypos + yneg));
}

- (NSString *) runSolution
{
    int matches = 0;
    int ii;
    for (ii = 0; ii < 1000; ii++) {
        if (_containsOrigin(NSMakePoint(triangles[ii][0], triangles[ii][1]), 
                            NSMakePoint(triangles[ii][2], triangles[ii][3]), 
                            NSMakePoint(triangles[ii][4], triangles[ii][5]))) {
            matches++;
        }
    }
    return [NSString stringWithFormat:@"%d", matches];
}

- (NSString *) realAnswer { return nil; }
@end

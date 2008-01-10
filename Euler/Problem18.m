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

@class TreeNode;
@interface TreeNode : NSObject {
    int _value;
    TreeNode *_left;
    TreeNode *_right;
    int _sWeight;
}
- (id) initWithValue:(int)value;
- (int) weight;

@property int value;
@property(retain) TreeNode *left;
@property(retain) TreeNode *right;
@end

@implementation TreeNode
@synthesize value = _value;
@synthesize left = _left;
@synthesize right = _right;

- (id) initWithValue:(int)value
{
    if ((self = [super init])) {
        _value = value;
        _sWeight = -1;
    }
    return self;
}

- (int) weight
{
    if (_sWeight == -1) {
        _sWeight = _value;
        int lw = [_left weight];
        int rw = [_right weight];
        if (lw > rw) 
            _sWeight += lw;
        else
            _sWeight += rw;
    }
    return _sWeight;
}
@end

@implementation Problem18
- (TreeNode *) _buildNodeFromTree:(int[][100])tree treeHeight:(int)height row:(int)row col:(int)col
{
    TreeNode *node = [[TreeNode alloc] initWithValue:tree[row][col]];
    if (row < height - 1) {
        node.left = [self _buildNodeFromTree:tree treeHeight:height row:row+1 col:col];
        node.right = [self _buildNodeFromTree:tree treeHeight:height row:row+1 col:col + 1];
    }
    return [node autorelease];
}

- (NSString *) runSolution
{
    int sum = 0;
    
//    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
//    TreeNode *root = [self _buildNodeFromTree:hugeTree treeHeight:100 row:0 col:0];
//    TreeNode *curNode = root;
//    while (curNode != nil) {
//        sum += curNode.value;
//        if ([curNode.right weight] > [curNode.left weight])
//            curNode = curNode.right;
//        else
//            curNode = curNode.left;
//    }
//    [pool drain];
    
    return [NSString stringWithFormat:@"%d", sum];
}
@end

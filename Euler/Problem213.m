//
//  Problem213.m
//  Euler
//
//  Created by Jacob Farkas on 10/23/08.
//  Copyright 2008 Apple Computer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PEProblem.h"

#define GRID_SIZE 30
#define gp(g, i, j) (*(g + (i * GRID_SIZE) + j))
static double sProb[GRID_SIZE][GRID_SIZE];

@interface Problem213 : PEProblem {
}
@end

void initGrid (double *grid, double num)
{
    char ii;
    for (ii = 0; ii < GRID_SIZE; ii++) {
        char jj;
        for (jj = 0; jj < GRID_SIZE; jj++) {
            gp(grid, ii, jj) = num;
        }
    }
}

void copyGrid (double *dst, double *src)
{
    char ii;
    for (ii = 0; ii < GRID_SIZE; ii++) {
        char jj;
        for (jj = 0; jj < GRID_SIZE; jj++) {
            gp(dst, ii, jj) = gp(src, ii, jj);
        }
    }
}

double combineProbs (double *prob, double *grids[GRID_SIZE * GRID_SIZE]) 
{
    int ii;
    int jj;
    int mm;
    double sum = 0.0;
//    printf("Combining probabilities... -");
//    fflush(stdout);
    for (ii = 0; ii < GRID_SIZE; ii++) {
        for (jj = 0; jj < GRID_SIZE; jj++) {
            for (mm = 0; mm < GRID_SIZE * GRID_SIZE; mm++) {
                gp(prob, ii, jj) *= (1 - gp(grids[mm], ii, jj));
            }
            sum += gp(prob, ii, jj);
        }
//        printf("\b%c", nextChar());
//        fflush(stdout);
    }
//    printf("\nSum is %0.08f\n", sum);
    return sum;
}

double fleaProb (double *grid, int ii, int jj) {
    if (ii < 0 || jj < 0 || ii >= GRID_SIZE || jj >= GRID_SIZE) return 0;
    return gp(grid, ii, jj) * sProb[ii][jj];
}

void makeGridMap (double *grid)
{
    int iter;
    double *newGrid = malloc(GRID_SIZE * GRID_SIZE * sizeof(double));
    for (iter = 0; iter < 50; iter++) {
        initGrid(newGrid, 0.0);
        int ii;
        int jj;
        for (ii = 0; ii < GRID_SIZE; ii++) {
            for (jj = 0; jj < GRID_SIZE; jj++) {
                gp(newGrid, ii, jj) = fleaProb(grid, ii - 1, jj) + fleaProb(grid, ii, jj - 1) + fleaProb(grid, ii + 1, jj) + fleaProb(grid, ii, jj + 1); 
            }
        }
        copyGrid(grid, newGrid);
        //printGrid(grid);
    }
    free(newGrid);
}

void initSquareProb (double prob[GRID_SIZE][GRID_SIZE])
{
    int jj;
    int ii;
    
    // corners
    prob[0][0] = 1.0/2.0;
    prob[GRID_SIZE - 1][0] = 1.0/2.0;
    prob[GRID_SIZE - 1][GRID_SIZE - 1] = 1.0/2.0;
    prob[0][GRID_SIZE - 1] = 1.0/2.0;
    
    // sides
    for (jj = 1; jj < GRID_SIZE - 1; jj++) { // top side
        prob[0][jj] = 1.0/3.0;
    }
    for (jj = 1; jj < GRID_SIZE - 1; jj++) { // bottom side
        prob[GRID_SIZE - 1][jj] = 1.0/3.0;
    }
    for (ii = 1; ii < GRID_SIZE - 1; ii++) { // left side
        prob[ii][0] = 1.0/3.0;
    }
    for (ii = 1; ii < GRID_SIZE - 1; ii++) { // right side
        prob[ii][GRID_SIZE - 1] = 1.0/3.0;
    }
    
    // inside
    for (ii = 1; ii < GRID_SIZE - 1; ii++) {
        for (jj = 1; jj < GRID_SIZE - 1; jj++) {
            prob[ii][jj] = 1.0/4.0;
        }
    }   
}


@implementation Problem213 
- (NSString *) runSolution 
{
    double *grids[GRID_SIZE * GRID_SIZE];
    initSquareProb(sProb);
    int ii = 0;
    int jj = 0;
    for (ii = 0; ii < GRID_SIZE; ii++) {
        for (jj = 0; jj < GRID_SIZE; jj++) {
            double *curGrid = malloc(GRID_SIZE * GRID_SIZE * sizeof(double));
            gp(grids, ii, jj) = curGrid;
            initGrid(curGrid, 0.0);
            gp(curGrid, ii, jj) = 1.0;
            makeGridMap(curGrid);
            fflush(stdout);
        }
//        printf("\b%c", nextChar());
    }
//    printf("\n");
    
//    printf("Grids initialized. Calculating probability...\n");
    
    double *prob = malloc(GRID_SIZE * GRID_SIZE * sizeof(double));
    initGrid(prob, 1.0);
    double answer = combineProbs(prob, grids);
    return [NSString stringWithFormat:@"%0.6f", answer];
}

- (NSString *) realAnswer { return @"330.721154"; }

@end

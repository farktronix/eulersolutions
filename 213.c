#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdint.h>
#include <pthread.h>
#include <fcntl.h>
#include <sys/errno.h>
#include <unistd.h>

#define GRID_SIZE 30
static double sProb[GRID_SIZE][GRID_SIZE];

void printGrid (double grid[GRID_SIZE][GRID_SIZE])
{
    char ii;
    for (ii = 0; ii < GRID_SIZE; ii++) {
        char jj;
        printf("\t[ ");
        for (jj = 0; jj < GRID_SIZE; jj++) {
            double curFleas = grid[ii][jj];
            printf("%0.4f ", curFleas);
        }
        printf("]\n");
    }
    printf("\n\n\n");
}

void initGrid (double grid[GRID_SIZE][GRID_SIZE], double num)
{
    char ii;
    for (ii = 0; ii < GRID_SIZE; ii++) {
        char jj;
        for (jj = 0; jj < GRID_SIZE; jj++) {
            grid[ii][jj] = num;
        }
    }
}

void copyGrid (double dst[GRID_SIZE][GRID_SIZE], double src[GRID_SIZE][GRID_SIZE])
{
    char ii;
    for (ii = 0; ii < GRID_SIZE; ii++) {
        char jj;
        for (jj = 0; jj < GRID_SIZE; jj++) {
            dst[ii][jj] = src[ii][jj];
        }
    }
}

double unoccupiedSquares (double grid[GRID_SIZE][GRID_SIZE])
{
    double total = 0.0;
    char ii;
    for (ii = 0; ii < GRID_SIZE; ii++) {
        char jj;
        for (jj = 0; jj < GRID_SIZE; jj++) {
            total += grid[ii][jj];
        }
    }

    return total;
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

double expectedFleas (double grid[GRID_SIZE][GRID_SIZE], int ii, int jj) {
    if (ii < 0 || jj < 0 || ii >= GRID_SIZE || jj >= GRID_SIZE) return 0;
    return grid[ii][jj] * sProb[ii][jj];
}

double emptyProb (double grid[GRID_SIZE][GRID_SIZE], int ii, int jj) {
    if (ii < 0 || jj < 0 || ii >= GRID_SIZE || jj >= GRID_SIZE) return 0;
    return grid[ii][jj] * (1.0 / sProb[ii][jj]);
}

void ringBell (double grid[GRID_SIZE][GRID_SIZE])
{
    int jj;
    int ii;
    double nextGrid[GRID_SIZE][GRID_SIZE];
    initGrid(nextGrid, 0.0);

    for (ii = 0; ii < GRID_SIZE; ii++) {
        for (jj = 0; jj < GRID_SIZE; jj++) {
            nextGrid[ii][jj] = gridProb(grid, ii - 1, jj) * gridProb(grid, ii, jj - 1) * gridProb(grid, ii + 1, jj) * gridProb(grid, ii, jj + 1);
        }
    }

    copyGrid(grid, nextGrid);
}

int main (int argc, char *argv[]) 
{
    double grid[GRID_SIZE][GRID_SIZE];
    initGrid(grid, 1.0);
    initSquareProb(sProb);

    int iteration = 0;
    while (iteration < 50) {
        printGrid(grid);
        ringBell(grid);         
        iteration++;
    }

    printf("Number of unoccupied squares: %0.07f \n", unoccupiedSquares(grid));

    return 0;
}

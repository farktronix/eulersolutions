#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdint.h>
#include <pthread.h>
#include <fcntl.h>
#include <sys/errno.h>
#include <unistd.h>

#define GRID_SIZE 30

typedef enum {
    up = 0,
    down,
    left,
    right
} direction;

void printGrid (short grid[GRID_SIZE][GRID_SIZE])
{
    short empty = 0;
    short fleas = 0;
    char ii;
    for (ii = 0; ii < GRID_SIZE; ii++) {
        char jj;
        printf("\t[ ");
        for (jj = 0; jj < GRID_SIZE; jj++) {
            short curFleas = grid[ii][jj];
            if (curFleas == 0) empty++;
            fleas += curFleas;
            printf("%03d ", curFleas);
        }
        printf("]\n");
    }
    printf("Total fleas: %d. Empty squares: %d\n\n", fleas, empty);
}

short numEmpty (short grid[GRID_SIZE][GRID_SIZE])
{
    short empty = 0;
    char ii;
    for (ii = 0; ii < GRID_SIZE; ii++) {
        char jj;
        for (jj = 0; jj < GRID_SIZE; jj++) {
            if (grid[ii][jj] == 0) empty++;
        }
    }
    return empty;
}

void initGrid (short grid[GRID_SIZE][GRID_SIZE], short num)
{
    char ii;
    for (ii = 0; ii < GRID_SIZE; ii++) {
        char jj;
        for (jj = 0; jj < GRID_SIZE; jj++) {
            grid[ii][jj] = num;
        }
    }
}

void copyGrid (short dst[GRID_SIZE][GRID_SIZE], short src[GRID_SIZE][GRID_SIZE])
{
    char ii;
    for (ii = 0; ii < GRID_SIZE; ii++) {
        char jj;
        for (jj = 0; jj < GRID_SIZE; jj++) {
            dst[ii][jj] = src[ii][jj];
        }
    }
}

static inline char isValidJump (short ii, short jj, direction dir)
{
    switch (dir) {
        case -1:
            return 0;
        case up:
            return ii != 0;
        case down:
            return ii != (GRID_SIZE - 1);
        case left:
            return jj != 0; 
        case right:
            return jj != (GRID_SIZE - 1);
    }
    return 0;
}

void jumpFleas (short grid[GRID_SIZE][GRID_SIZE])
{
    short newGrid[GRID_SIZE][GRID_SIZE];
    initGrid(newGrid, 0);
    char ii;
    for (ii = 0; ii < GRID_SIZE; ii++) {
        char jj;
        for (jj = 0; jj < GRID_SIZE; jj++) {
            short numFleas = grid[ii][jj];
            while (numFleas--) {
                direction dir = -1;
                do {
                    //dir = arc4random() % 5;
                    dir = rand() % 5;
                } while (!isValidJump(ii, jj, dir));
                switch (dir) {
                    case up:
                        newGrid[ii-1][jj]++;
                        break;
                    case down:
                        newGrid[ii+1][jj]++;
                        break;
                    case left:
                        newGrid[ii][jj-1]++;
                        break;
                    case right:
                        newGrid[ii][jj+1]++;
                        break;
                }
            }
        }
    }
    copyGrid(grid, newGrid);
}

static uint64_t avgEmpty = 0;
static uint64_t numRuns = 0;
static pthread_mutex_t avgLock;

// returns number of empty squares
short doOneRun (void)
{
    short grid[GRID_SIZE][GRID_SIZE];
    initGrid(grid, 1);
    char ii;
    for (ii = 0; ii < 50; ii++) {
        jumpFleas(grid);
    }
    return numEmpty(grid);
}

void *threadRunner (void *arg)
{
    printf("Thread %p starting up...\n", pthread_self());
    int reportInterval = 2000 + (rand() % 3000);
    while (1) {
        int curNumRuns = 0;
        int curAvgEmpty = 0; 
        while (curNumRuns < reportInterval) {
            curAvgEmpty += doOneRun(); 
            curNumRuns++;
        }
        pthread_mutex_lock(&avgLock);
        avgEmpty += curAvgEmpty;
        numRuns += curNumRuns;
        pthread_mutex_unlock(&avgLock);
    }
    return NULL;
}

int main (int argc, char *argv[]) 
{
    sranddev();
    pthread_mutex_init(&avgLock, NULL);

    int fd = open("/tmp/runstats", O_RDWR | O_CREAT, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
    uint64_t buf = 0;
    if (read(fd, &buf, sizeof(uint64_t))) {
        avgEmpty = buf;
    }
    if (read(fd, &buf, sizeof(uint64_t))) {
        numRuns = buf;
    }
    printf("Starting with %llu total empties and %llu runs\n", avgEmpty, numRuns);

    pthread_t thread = NULL;
    pthread_create(&thread, NULL, threadRunner, NULL);
    pthread_create(&thread, NULL, threadRunner, NULL);
    pthread_create(&thread, NULL, threadRunner, NULL);
    pthread_create(&thread, NULL, threadRunner, NULL);


    uint64_t lastRuns = 0;
    while (1) {
        sleep(5);
        pthread_mutex_lock(&avgLock);
        printf("Average empties: %0.07f (%llu/%llu). %0.1f runs per second\n", (double)avgEmpty/(double)numRuns, avgEmpty, numRuns, (numRuns - lastRuns)/3.0);
        lastRuns = numRuns;
        lseek(fd, 0, SEEK_SET);
        write(fd, &avgEmpty, sizeof(uint64_t));
        write(fd, &numRuns, sizeof(uint64_t));
        pthread_mutex_unlock(&avgLock);
    }

    close(fd);

    return 0;
}

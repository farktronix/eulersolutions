//
//  Euler.m
//  Euler
//
//  Created by Jacob Farkas on 1/9/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <getopt.h>
#import <mach/mach_time.h>

#import "PEProblem.h"

static NSInteger _problemSortFunction (id this, id that, void *context)
{
    Class sPEProblemClass = [PEProblem class];
    if ([this superclass] != sPEProblemClass) return 1;
    if ([that superclass] != sPEProblemClass) return -1;
    
    int thisNum = [(PEProblem*)this _problemNumber];
    int thatNum = [(PEProblem *)that _problemNumber];
    if (thisNum == thatNum) return 0;
    if (thisNum > thatNum) return 1;
    return -1;
}

static NSArray *getProblemClasses (void)
{
    int numClasses;
    Class * classes = NULL;
    Class PEProblemClass = [PEProblem class];
    NSMutableArray *problemClasses = [[NSMutableArray alloc] init];
    
    classes = NULL;
    numClasses = objc_getClassList(NULL, 0);
    if( numClasses > 0 ) {
        classes = calloc(1, sizeof(Class) * (numClasses  + 1));
        (void) objc_getClassList( classes, numClasses );   
        Class *curClass = classes;
        while (*curClass != NULL) {
            if (class_getSuperclass(*curClass) == PEProblemClass) {
                id problem = class_createInstance(*curClass, 0);
                [problem init];
                [problemClasses addObject:problem];
            }
            curClass++;
        }
        free(classes);
    }
    
    [problemClasses sortUsingFunction:_problemSortFunction context:NULL];
    return [problemClasses autorelease];
}

static struct option longopts[] = { 
	{ "problem",        required_argument,  NULL,   'p' },
	{ "noresult",       no_argument,        NULL,   'r' },
	{ "timing",         no_argument,        NULL,   't' },
	{ "verbose",        no_argument,        NULL,   'v' }, 
	{ NULL,				0,					NULL,    0  }
};

int main (int argc, char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    
    BOOL showResult = YES;
    BOOL showTiming = NO;
    BOOL verbose = NO;
    int pnum = -1;

    static mach_timebase_info_data_t sTimebaseInfo;
    mach_timebase_info(&sTimebaseInfo);
    
    opterr = 0; // suppress getopt output
    int ch;
    while ((ch = getopt_long(argc, argv, "p:rtv", longopts, NULL)) != -1) {
        switch(ch) {
          case 'p':
            pnum = strtol(optarg, NULL, 10);
            break;
          case 'r':
            showResult = YES;
            break;
          case 't':
            showTiming = YES;
            break;
          case 'v':
            verbose = YES;
            break;
          default:
            break;
        }
    }
    if (argc == 2 && *argv[1] != '-') {
        pnum = strtol(argv[1], NULL, 10);
    }
    
    NSArray *problemClasses = getProblemClasses();
    
    NSLock *counterLock = [[NSLock alloc] init];
    __block uint64 totalTime = 0;
    __block int attemptedProblems = 0;
    __block int correctProblems = 0;
    
    dispatch_queue_t problemQueue = dispatch_queue_create("com.farktronix.euler.problemQueue", DISPATCH_QUEUE_CONCURRENT);
    
    for (PEProblem *problem in problemClasses) {
        //if (pnum != -1 && [problem _problemNumber] != pnum) continue;
        if ([problem _problemNumber] > 10) continue;
        problem.showResult = showResult;
        problem.showTiming = showTiming;
        problem.verbose = verbose;
        
        dispatch_async(problemQueue, ^{
            NSAutoreleasePool *problemPool = [[NSAutoreleasePool alloc] init];
            NSString *solution = [problem solveProblem];
            [counterLock lock];
            attemptedProblems++;
            totalTime += problem.solveTime;
            if ([solution isEqualToString:problem.realAnswer]) {
                correctProblems++;
            }
            [counterLock unlock];
            [problemPool drain];
        });
    }
    
    dispatch_barrier_async(problemQueue, ^{
        printf("\n==========\n");
        printf("Solved %d out of %d problems\n", correctProblems, attemptedProblems);
        if (showTiming) {
            printf("Total Time: %0.4fms\n", (totalTime * sTimebaseInfo.numer / sTimebaseInfo.denom) / 1000000.0);
        }
        printf("==========\n");
        
        exit(0);
    });
    
    dispatch_main();
    
    [counterLock release];
    
    [pool drain];
    return 0;
}

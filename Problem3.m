//
//  Problem3.m
//  Euler
//
//  Created by Jacob Farkas on 1/10/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <gmp.h>
#import "PEProblem.h"
#import "Util.h"

/*
The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 317584931803?
*/

@interface Problem3 : PEProblem {
}
@end

@implementation Problem3
- (NSString *) runSolution
{
    mpz_t bignum;
    mpz_init_set_str(bignum, "317584931803", 10);
    mpz_t numLimit;
    mpz_sqrt(numLimit, bignum);
    mpz_t i;
    mpz_init_set_si(i, 2);
    mpz_t largest;
    
    while (mpz_cmp(i, numLimit) > 0) {
        if (mpz_probab_prime_p(i, 1) > 0) {
            mpz_t modResult;
            mpz_mod(modResult, bignum, i);
            if (mpz_cmp_si(modResult, 0)) {
                mpz_swap(largest, modResult);
            }
            
            mpz_clear(modResult);
        }
    }
    
    mpz_clear(bignum);
    mpz_clear(numLimit);
    mpz_clear(i);
    char *retstr = mpz_get_str(NULL, 10, largest);
    NSString *retNSStr = [NSString stringWithUTF8String:retstr];
    free(retstr);
    return retNSStr;
}
- (NSString *) realAnswer { return @"3919"; }
@end

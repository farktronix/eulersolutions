//
//  FUNumber.m
//  Euler
//
//  Created by Jacob Farkas on 12/18/11.
//  Copyright (c) 2011 Apple, Inc. All rights reserved.
//

#import "FUNumber.h"

@implementation FUNumber
- (id) _initWithGMP:(mpz_t)bignum
{
    if ((self = [super init])) {
        mpz_init_set(_baseNum, bignum);
    }
    return self;
}

- (id) initWithString:(NSString*)value base:(int)base
{
    if ((self = [super init])) {
        mpz_init_set_str(_baseNum, [value UTF8String], base);
    }
    return self;
}

- (id) initWithString:(NSString*)value
{
    return [self initWithString:value base:10];
}

- (id) initWithInt:(unsigned long int)value
{
    if ((self = [super init])) {
        mpz_init_set_si(_baseNum, value);
    }
    return self;    
}

+ (FUNumber *) numberWithString:(NSString *)value
{
    return [[[FUNumber alloc] initWithString:value base:10] autorelease];
}

+ (FUNumber *) numberWithString:(NSString *)value base:(int)base
{
    return [[[FUNumber alloc] initWithString:value base:base] autorelease];
}

+ (FUNumber *) numberWithInt:(unsigned long int)value
{
    return [[[FUNumber alloc] initWithInt:value] autorelease];
}

+ (FUNumber *) number
{
    return [[[FUNumber alloc] initWithInt:0] autorelease];
}

- (void) dealloc
{
    mpz_clear(_baseNum);
    [super dealloc];
}

- (mpz_t*) _getBaseNum { return &_baseNum; }

- (id) copy
{
    return [[FUNumber alloc] _initWithGMP:_baseNum];
}

#pragma mark -
#pragma mark Conversion

- (NSString *) description
{
    char *retCStr = mpz_get_str(NULL, 10, _baseNum);
    NSString *retval = [NSString stringWithUTF8String:retCStr];
    free(retCStr);
    return retval;
}

- (unsigned long int) intValue
{
    return mpz_get_ui(_baseNum);
}

#pragma mark -
#pragma mark Arithmetic

- (void) addInt:(unsigned long int)value
{
    mpz_add_ui(_baseNum, _baseNum, value);
}

- (void) add:(FUNumber *)value
{
    mpz_add(_baseNum, _baseNum, *[value _getBaseNum]);
}

- (void) subtractInt:(unsigned long int)value
{
    mpz_sub_ui(_baseNum, _baseNum, value);
}

- (void) subtract:(FUNumber *)value
{
    mpz_sub(_baseNum, _baseNum, *[value _getBaseNum]);
}

- (void) multiplyInt:(unsigned long int)value
{
    mpz_mul_ui(_baseNum, _baseNum, value);
}

- (void) multiply:(FUNumber *)value
{
    mpz_mul(_baseNum, _baseNum, *[value _getBaseNum]);
}

- (void) divideInt:(unsigned long int)value
{
    mpz_div_ui(_baseNum, _baseNum, value);
}

- (void) divide:(FUNumber *)value
{
    mpz_div(_baseNum, _baseNum, *[value _getBaseNum]);
}

#pragma mark -
#pragma mark 
- (FUNumber *) sqrt
{
    FUNumber *retval = [FUNumber number];
    mpz_sqrt(*[retval _getBaseNum], _baseNum);
    return retval;
}

- (FUNumber *) mod:(FUNumber *)other
{
    FUNumber *retval = [FUNumber number];
    mpz_mod(*[retval _getBaseNum], _baseNum, *[other _getBaseNum]);
    return retval;
}

#pragma mark -
#pragma mark Operations

- (int) isPrime
{
    return mpz_probab_prime_p(_baseNum, 1);
}

- (FUNumber *) getNextPrime
{
    FUNumber *retval = [FUNumber number];
    mpz_nextprime(*[retval _getBaseNum], _baseNum);
    return retval;
}

- (void) nextPrime
{
    mpz_nextprime(_baseNum, _baseNum);
}

- (FUNumber *) gcd:(FUNumber *)other
{
    FUNumber *retval = [FUNumber number];
    mpz_gcd(*[retval _getBaseNum], _baseNum, *[other _getBaseNum]);
    return retval;
}

- (FUNumber *) lcm:(FUNumber *)other
{
    FUNumber *retval = [FUNumber number];
    mpz_lcm(*[retval _getBaseNum], _baseNum, *[other _getBaseNum]);
    return retval;
}

- (NSComparisonResult) compare:(FUNumber *)other
{
    int ret = mpz_cmp(_baseNum, *[other _getBaseNum]);
    if (ret < 0) {
        return NSOrderedAscending;
    } else if (ret == 0) {
        return NSOrderedSame;
    } else {
        return NSOrderedDescending;
    }
}

@end

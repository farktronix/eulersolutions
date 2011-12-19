//
//  FUNumber.h
//  Euler
//
//  Created by Jacob Farkas on 12/18/11.
//  Copyright (c) 2011 Apple, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <gmp.h>

@interface FUNumber : NSObject {
@private
    mpz_t _baseNum;
}

+ (FUNumber *) numberWithString:(NSString *)value;
+ (FUNumber *) numberWithString:(NSString *)value base:(int)base;
+ (FUNumber *) numberWithInt:(unsigned long int)value;
+ (FUNumber *) number;

- (id) initWithString:(NSString*)value;
- (id) initWithString:(NSString*)value base:(int)base;
- (id) initWithInt:(unsigned long int)value;

- (NSString *) description;
- (unsigned long int) intValue;

- (void) addInt:(unsigned long int)value;
- (void) add:(FUNumber *)value;

- (void) subtractInt:(unsigned long int)value;
- (void) subtract:(FUNumber *)value;

- (void) multiplyInt:(unsigned long int)value;
- (void) multiply:(FUNumber *)value;

- (void) divideInt:(unsigned long int)value;
- (void) divide:(FUNumber *)value;

- (FUNumber *) sqrt;
- (FUNumber *) mod:(FUNumber *)other;

// 0: not prime, 1: probably, 2: definitely
- (int) isPrime;
- (FUNumber *) nextPrime;
- (FUNumber *) gcd:(FUNumber *)other;

// TODO: Not working.
//- (FUNumber *) lcm:(FUNumber *)other;

- (NSComparisonResult) compare:(FUNumber *)other;

@end

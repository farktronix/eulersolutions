//
//  FUNumberTests.m
//  EulerUnitTests
//
//  Created by Jacob Farkas on 12/19/11.
//  Copyright (c) 2011 Apple, Inc. All rights reserved.
//

#import "FUNumberTests.h"
#import "FUNumber.h"

@implementation FUNumberTests

- (void)testInits
{
    FUNumber *intNumber = [FUNumber numberWithInt:42];
    FUNumber *stringNumber = [FUNumber numberWithString:@"42"];
    STAssertTrue([intNumber compare:stringNumber] == NSOrderedSame, @"The two numbers are not equal");
    STAssertTrue([[intNumber description] isEqualToString:@"42"], @"The description is not correct");
    STAssertTrue([intNumber intValue] == 42LU, @"The integer value doesn't match");
}

- (void)testCompare
{
    FUNumber *numberOne = [FUNumber numberWithInt:1];
    FUNumber *numberTwo = [FUNumber numberWithInt:2];
    STAssertTrue([numberOne compare:numberOne] == NSOrderedSame, @"Compare isn't returning the correct value");
    STAssertTrue([numberOne compare:numberTwo] == NSOrderedAscending, @"Compare isn't returning the correct value");
    STAssertTrue([numberTwo compare:numberOne] == NSOrderedDescending, @"Compare isn't returning the correct value");
}

- (void)testCopy
{
    FUNumber *original = [FUNumber numberWithString:@"4242424242424242424242424242"];
    FUNumber *myCopy = [original copy];
    STAssertTrue([original compare:myCopy] == NSOrderedSame, @"Copy isn't working");
    [original addInt:42];
    STAssertTrue([original compare:myCopy] == NSOrderedDescending, @"Copy isn't actually making a copy");
    [myCopy release];
    myCopy = [original copy];
    [myCopy addInt:42];
    STAssertTrue([original compare:myCopy] == NSOrderedAscending, @"Copy isn't actually making a copy");
    [myCopy release];
}

- (void)testMod
{
    FUNumber *testNum = [FUNumber numberWithInt:42];
    FUNumber *modNum = [FUNumber numberWithInt:42];
    STAssertTrue([[testNum mod:modNum] intValue] == 0, @"The numbers should be the same");
    testNum = [FUNumber numberWithInt:43];
    STAssertTrue([[testNum mod:modNum] intValue] == 1, @"The remainder should be 1");
    
    testNum = [FUNumber numberWithString:@"4242424242424242424242424242"];
    modNum = [FUNumber numberWithString:@"4242424242424242424242424242"];
    STAssertTrue([[testNum mod:modNum] intValue] == 0, @"Mod doesn't work for large numbers");
    testNum = [FUNumber numberWithString:@"8484848484848484848484848484"];
    STAssertTrue([[testNum mod:modNum] intValue] == 0, @"Mod doesn't work for large numbers");
    testNum = [FUNumber numberWithString:@"8484848484848484848484848485"];
    STAssertTrue([[testNum mod:modNum] intValue] == 1, @"Mod doesn't work for large numbers");
}

- (void)testSqrt
{
    FUNumber *testNum = [FUNumber numberWithInt:4];
    STAssertTrue([[testNum sqrt] intValue] == 2, @"square root doesn't work");
    testNum = [FUNumber numberWithString:@"17998163452708907254361799812745638200183654729109274564"];
    FUNumber *expectedResult = [FUNumber numberWithString:@"4242424242424242424242424242"];
    STAssertTrue([[testNum sqrt] compare:expectedResult] == NSOrderedSame, @"Square root doesn't work for large numbers");
}

- (void)testAdd
{
    FUNumber *testNum = [FUNumber numberWithString:@"4242424242424242424242424242"];
    FUNumber *expected = [FUNumber numberWithString:@"8484848484848484848484848484"];
    [testNum add:testNum];
    STAssertTrue([testNum compare:expected] == NSOrderedSame, @"Can't add a large number to itself");
    
    [testNum addInt:42];
    expected = [FUNumber numberWithString:@"8484848484848484848484848526"];
    STAssertTrue([testNum compare:expected] == NSOrderedSame, @"Can't add an integer to a large number");
}

- (void)testSubtract
{
    FUNumber *testNum = [FUNumber numberWithString:@"8484848484848484848484848484"];
    FUNumber *expected = [FUNumber numberWithString:@"4242424242424242424242424242"];
    [testNum subtract:expected];
    STAssertTrue([testNum compare:expected] == NSOrderedSame, @"Can't subtract a large number");
    
    [testNum subtractInt:42];
    expected = [FUNumber numberWithString:@"4242424242424242424242424200"];
    STAssertTrue([testNum compare:expected] == NSOrderedSame, @"Can't subtract an integer from a large number");
}

- (void)testMultiply
{
    FUNumber *testNum = [FUNumber numberWithString:@"4242424242424242424242424242"];
    FUNumber *expected = [FUNumber numberWithString:@"17998163452708907254361799812745638200183654729109274564"];
    [testNum multiply:testNum];
    STAssertTrue([testNum compare:expected] == NSOrderedSame, @"Can't multiply a large number");
    
    [testNum multiplyInt:42];
    expected = [FUNumber numberWithString:@"755922865013774104683195592135316804407713498622589531688"];
    STAssertTrue([testNum compare:expected] == NSOrderedSame, @"Can't multiply a large number by an integer");
}

- (void)testDivide
{
    FUNumber *testNum = [FUNumber numberWithString:@"17998163452708907254361799812745638200183654729109274564"];
    FUNumber *expected = [FUNumber numberWithString:@"4242424242424242424242424242"];
    [testNum divide:expected];
    STAssertTrue([testNum compare:expected] == NSOrderedSame, @"Can't divide a large number");
    
    [testNum divideInt:42];
    expected = [FUNumber numberWithString:@"101010101010101010101010101"];
    STAssertTrue([testNum compare:expected] == NSOrderedSame, @"Can't divide a large number by an integer");
}

- (void)testPrime
{
    FUNumber *testNum = [FUNumber numberWithInt:3];
    STAssertTrue([testNum isPrime] > 0, @"Three should be prime.");
    testNum = [FUNumber numberWithInt:4];
    STAssertTrue([testNum isPrime] == 0, @"Four is not prime.");
    testNum = [FUNumber numberWithInt:5];
    STAssertTrue([testNum isPrime] > 0, @"Five should be prime.");
    testNum = [FUNumber numberWithString:@"4242424242424242424242424289"];
    STAssertTrue([testNum isPrime] > 0, @"Couldn't determine if a large number is prime");
    testNum = [FUNumber numberWithString:@"4242424242424242424242424288"];
    STAssertTrue([testNum isPrime] == 0, @"Couldn't determine if a large number is prime");
}

- (void)testNextPrime
{
    FUNumber *testNum = [FUNumber numberWithString:@"4242424242424242424242424242"];
    FUNumber *expected = [FUNumber numberWithString:@"4242424242424242424242424289"];
    STAssertTrue([[testNum nextPrime] compare:expected] == NSOrderedSame, @"Couldn't find the next prime number");
}

- (void) testGCD
{
    FUNumber *testNum1 = [FUNumber numberWithString:@"4242424242424242424242424242"];
    FUNumber *testNum2 = [FUNumber numberWithInt:8675309];
    STAssertTrue([[testNum1 gcd:testNum2] intValue] == 1, @"GCD isn't working");
    STAssertTrue([[testNum1 gcd:testNum1] compare:testNum1] == NSOrderedSame, @"GCD isn't working");
    
}

// TODO: Not working.
//- (void) testLCM
//{
//    FUNumber *testNum1 = [FUNumber numberWithString:@"4242424242424242424242424242"];
//    FUNumber *testNum2 = [FUNumber numberWithString:@"4242424242424242424242424241"];
//    FUNumber *expected = [FUNumber numberWithString:@"17998163452708907254361799808503213957759412304866850322"];
//    STAssertTrue([[testNum1 lcm:testNum2] compare:expected] == NSOrderedSame, @"LCM isn't working");
//}

@end

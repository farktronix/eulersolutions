//
//  UtilTests.m
//  Euler
//
//  Created by Jacob Farkas on 12/19/11.
//  Copyright (c) 2011 Apple, Inc. All rights reserved.
//

#import "UtilTests.h"
#import "Util.h"

@implementation UtilTests

-(void) testMyLog
{
    STAssertTrue(iLog(0) == 0, @"iLog error");
    STAssertTrue(iLog(11) == 1, @"iLog error");
    STAssertTrue(iLog(111) == 2, @"iLog error");
    STAssertTrue(iLog(1111) == 3, @"iLog error");
    STAssertTrue(iLog(11111111111) == 10, @"iLog error");
    STAssertTrue(iLog(18446744073709551614LU) == 19, @"iLog error");
}

-(void) testPalindrome
{
    STAssertTrue(isPalindrome(11), @"11 should be a palindrome");
    STAssertFalse(isPalindrome(12), @"12 should not be a palindrome");
    STAssertTrue(isPalindrome(121), @"121 should be a palindrome");
    STAssertTrue(isPalindrome(1221), @"1221 should be a palindrome");
    STAssertFalse(isPalindrome(1231), @"1231 should be a palindrome");
    STAssertTrue(isPalindrome(123456654321), @"123456654321 should be a palindrome");
}

@end

//
//  Problem19.m
//  Euler
//
//  Created by Jacob Farkas on 1/10/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PEProblem.h"

/*
You are given the following information, but you may prefer to do some research for yourself.

1 Jan 1900 was a Monday.
Thirty days has September,
April, June and November.
All the rest have thirty-one,
Saving February alone,
Which has twenty-eight, rain or shine.
And on leap years, twenty-nine.
A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.
How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?
*/

@interface Problem19 : PEProblem {
}
@end
 
@implementation Problem19
- (int) daysForMonth:(int)month inYear:(int)year
{
    switch (month) {
        case 0: // January
          return 31;  
          break;
        case 1: // Feburary
          if (year % 4 == 0) return 29;
          return 28;
          break;
        case 2: // March
          return 31;
          break;
        case 3: // April
          return 30;
          break;
        case 4: // May
          return 31;
          break;
        case 5: // June
          return 30;
          break;
        case 6: // July
          return 31;
          break;
        case 7: // August
          return 31;
          break;
        case 8: // September
          return 30;
          break;
        case 9: // October
          return 31;
          break;
        case 10: // November
          return 30;
          break;
        case 11: // December
          return 31;
          break;        
    }
    return INT_MIN;
}

- (NSString *) runSolution
{
    // Jan 1, 1901 was a Tuesday
    int offset = 2;
    int year = 1901;
    int month = 0;
    int sundayCount = 0;
    for (year = 1901; year < 2001; year++) {
        for (month = 0; month < 12; month++) {
            offset = (offset + [self daysForMonth:month inYear:year]) % 7;
            if (offset == 0) sundayCount++;
        }
    }
    
    return [NSString stringWithFormat:@"%d", sundayCount];
}

- (NSString *) realAnswer { return @"171"; }
@end

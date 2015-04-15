//
//  CalendarMath.h
//  CalendarDemo
//
//  Created by Wu~ on 2014/9/28.
//  Copyright (c) 2014年 Wu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalendarMath : NSObject

+ (NSDateComponents*)getDateInfoWithDate:(NSDate*)nowDate;
+ (NSInteger)getMonthDaysWithDate:(NSDate*)nowDate;
+ (NSMutableArray*)getMonthDateWithDate:(NSDate*)nowDate;
+ (NSDate*)getNSDateWithNSString:(NSString*)dateStr;
+ (NSString*)getDateStringWithNSDate:(NSDate*)date;

@end

//
//  CalendarMath.m
//  CalendarDemo
//
//  Created by Wu~ on 2014/9/28.
//  Copyright (c) 2014年 Wu. All rights reserved.
//

#import "CalendarMath.h"

@implementation CalendarMath

#pragma mark - 取得 NSDate 資訊
+ (NSDateComponents*)getDateInfoWithDate:(NSDate*)nowDate {
    NSCalendar *calendarDate = [NSCalendar currentCalendar];
    NSDateComponents *todayComponents = [calendarDate components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitWeekOfMonth fromDate:nowDate];
    return todayComponents;
}

#pragma mark - 取得 NSDate 月份有幾天
+ (NSInteger)getMonthDaysWithDate:(NSDate*)nowDate {
    NSCalendar *calendarDate = [NSCalendar currentCalendar];
    NSRange monthDays = [calendarDate rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:nowDate];
    return monthDays.length;
}

#pragma mark - 取得 Calendar 資訊
+ (NSMutableArray*)getMonthDateWithDate:(NSDate*)nowDate {
    NSMutableArray *monthDays = [NSMutableArray array];
    NSArray *nowMonthFirstDay = [[self getDateStringWithNSDate:nowDate] componentsSeparatedByString:@"-"];
    NSDateComponents *firstDayComponents = [self getDateInfoWithDate:[self getNSDateWithNSString:[NSString stringWithFormat:@"%@-%@-1", nowMonthFirstDay[0], nowMonthFirstDay[1]]]];
    NSInteger previousYear = (firstDayComponents.month == 1) ? firstDayComponents.year - 1 : firstDayComponents.year;
    NSInteger previousMonth = (firstDayComponents.month == 1) ? 12 : firstDayComponents.month - 1;
    NSDate *previousDate = [self getNSDateWithNSString:[NSString stringWithFormat:@"%ld-%ld-1", (long)previousYear, (long)previousMonth]];
    for (int i = (int)[self getMonthDaysWithDate:previousDate] - (int)firstDayComponents.weekday + 2; i <= [self getMonthDaysWithDate:previousDate]; i++) {
        [monthDays addObject:[NSString stringWithFormat:@"%ld-%ld-%d", (long)previousYear, (long)previousMonth, i]];
    }
    for (int i = 1; i <= [self getMonthDaysWithDate:nowDate]; i ++) {
        [monthDays addObject:[NSString stringWithFormat:@"%ld-%ld-%d", (long)firstDayComponents.year, (long)firstDayComponents.month, i]];
    }
    for (int i = 1; i <= 42 - [self getMonthDaysWithDate:nowDate] - firstDayComponents.weekday + 1; i++) {
        NSInteger nextYear = (firstDayComponents.month == 12) ? firstDayComponents.year + 1 : firstDayComponents.year;
        NSInteger nextMonth = (firstDayComponents.month == 12) ? 1 : firstDayComponents.month + 1;
        [monthDays addObject:[NSString stringWithFormat:@"%ld-%ld-%d", (long)nextYear, (long)nextMonth, i]];
    }
    return monthDays;
}

#pragma mark - NSString to NSDate
+ (NSDate*)getNSDateWithNSString:(NSString*)dateStr {
    NSArray *dateArray = [dateStr componentsSeparatedByString:@"-"];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    return [dateFormatter dateFromString:[NSString stringWithFormat:@"%@-%@-%@", dateArray[0], dateArray[1], dateArray[2]]];
}

#pragma mark - NSDate to NSString
+ (NSString*)getDateStringWithNSDate:(NSDate*)date {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    return [dateFormatter stringFromDate:date];
}

@end

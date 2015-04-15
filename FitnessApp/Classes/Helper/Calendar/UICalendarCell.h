//
//  UICalendarCell.h
//  CalendarDemo
//
//  Created by Wu~ on 2014/9/28.
//  Copyright (c) 2014年 Wu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSUInteger, UICalendarType) {
    UICalendarNone        = 0,
    UICalendarSingle      = 1 << 3,
    UICalendarSocial      = 1 << 4,
};

@interface UICalendarCell : UICollectionViewCell

@property (nonatomic, strong) UILabel *dateLabel;

@property (nonatomic) UICalendarType calendarType;

@end

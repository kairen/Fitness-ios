//
//  UICalendar.h
//  CalendarDemo
//
//  Created by Wu~ on 2014/9/27.
//  Copyright (c) 2014年 Wu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UICalendarDelegate;

@interface UICalendar : UIView <UICollectionViewDelegateFlowLayout, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *baseCalendarView;
@property (nonatomic, strong) NSMutableArray *dates;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *dateDaysLabel;

@property (nonatomic, weak) id <UICalendarDelegate> delegate;

@end

@protocol UICalendarDelegate <NSObject>

- (void)calendar:(UICalendar*)calendar didSelectAtDate:(NSString*)date;

@end

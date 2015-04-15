//
//  TodayOverView.h
//  FitnessApp
//
//  Created by KaiRen.Bai on 2015/4/13.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "PageBasicView.h"

@class KRProgressView;

@interface TodayOverView : PageBasicView

- (void)setBurnedMaxValue:(CGFloat)max usageValue:(CGFloat)usageValue;
- (void)setCalMaxValue:(CGFloat)max usageValue:(CGFloat)usageValue;

@property (nonatomic, strong) KRProgressView *burnedProgress;
@property (nonatomic, strong) KRProgressView *targetProgress;

@property (nonatomic, strong) UILabel *basicLabel;
@property (nonatomic, strong) UILabel *xbikeLabel;
@property (nonatomic, strong) UILabel *stopperLabel;
@property (nonatomic, strong) UITableView *socialGameView;

@end

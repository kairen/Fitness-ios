//
//  DahsboardStatusView.h
//  FitnessApp
//
//  Created by KaiRen.Bai on 2015/4/15.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KRProgressView.h"
#import "KRAsyncImageView.h"

typedef NS_ENUM(NSUInteger, DashboardPageType) {
    DashboardTodayPage = 0,
    DashboardGamePage,
    DashboardHistoryPage
};

@class KRProgressView;
@class KRAsyncImageView;

@interface DahsboardStatusView : UIView

- (void)changeNavigationWithPageType:(DashboardPageType)type;
- (void)setLevelValue:(NSInteger)level;

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *levelLabel;
@property (nonatomic, strong) UILabel *navigationLabel;

@property (nonatomic, strong) KRAsyncImageView *personalView;

@property (nonatomic, strong) KRProgressView *progressView;
@end

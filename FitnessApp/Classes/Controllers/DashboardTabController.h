//
//  DashboardTabController.h
//  FitnessApp
//
//  Created by KaiRen.Bai on 2015/4/15.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import <UIKit/UIKit.h>

@class StatusController;
@class ChallengeController;
@class HistoryController;
@class DahsboardStatusView;

@interface DashboardTabController : UITabBarController

@property (nonatomic, strong) StatusController *statusController;
@property (nonatomic, strong) ChallengeController *challengeController;
@property (nonatomic, strong) HistoryController *historyController;

@property (nonatomic, strong) DahsboardStatusView *statusView;
@property (nonatomic, strong) UIButton *logoutButton;

@end

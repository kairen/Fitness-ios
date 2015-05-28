//
//  ChallengeController.m
//  FitnessApp
//
//  Created by KaiRen.Bai on 2015/4/15.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "ChallengeController.h"
#import "DashboardTabController.h"
#import "DahsboardStatusView.h"
#import "MyGoalView.h"

@interface ChallengeController ()
@property (nonatomic, strong) MyGoalView *myGoalView;
@end

@implementation ChallengeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.myGoalView = [[MyGoalView alloc] initWithFrame:CGRectMake(0, 70, self.view.width, self.view.height - 70 - 60 - 59)];
    [self.view addSubview:self.myGoalView];
}

@end

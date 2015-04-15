//
//  MyGoalView.h
//  MyGoalView
//
//  Created by nutc on 2015/3/29.
//  Copyright (c) 2015年 HW. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FCProgressView.h"

@interface MyGoalView : UIScrollView

@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UIButton *allButton;
@property (nonatomic, strong) UIButton *xBikeButton;
@property (nonatomic, strong) UIButton *coreFitButton;
@property (nonatomic, strong) UIButton *myTargetButton;
@property (nonatomic, strong) UIButton *invitePlayerButton;
@property (nonatomic, strong) UIButton *teamRaceButton;
@property (nonatomic, strong) UIButton *thirtyMinutsButton;
@property (nonatomic, strong) UIButton *oneHourButton;
@property (nonatomic, strong) UIButton *threeHoursButton;
@property (nonatomic, strong) UIButton *oneDayButton;
@property (nonatomic, strong) FCProgressView *levelSelectView;
@property (nonatomic, strong) UILabel *caloriesLabel;
@property (nonatomic, strong) UITextField *startTimeTextField;
@property (nonatomic, strong) UITextField *endTimeTextField;
@property (nonatomic, strong) UIButton *okButton;

@end

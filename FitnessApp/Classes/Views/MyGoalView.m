//
//  MyGoalView.m
//  MyGoalView
//
//  Created by nutc on 2015/3/29.
//  Copyright (c) 2015年 HW. All rights reserved.
//

#import "MyGoalView.h"

#define CGRECT_MAKE_SCALAR(SCALAR_X, SCALAR_Y, SCALAR_WIDTH, SCALAR_HEIGHT, FRAME) CGRectMake(SCALAR_X * CGRectGetWidth(FRAME), SCALAR_Y * CGRectGetHeight(FRAME), SCALAR_WIDTH * CGRectGetWidth(FRAME), SCALAR_HEIGHT * CGRectGetHeight(FRAME))

@implementation MyGoalView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.contentSize = CGSizeMake(CGRectGetWidth(frame), CGRectGetHeight(frame) * 1.2f);
        
        self.backgroundColor = [UIColor colorWithRed:34.f / 255.f green:160.f / 255.f blue:233.f / 255.f alpha:1.f];
        
        UIImageView *challengeImageView = [[UIImageView alloc] initWithFrame:CGRECT_MAKE_SCALAR(0.07, 0.05, 0.1, 0.05, frame)];
        challengeImageView.image = [UIImage imageNamed:@"Challenge"];
        challengeImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:challengeImageView];
        
        self.textField = [[UITextField alloc] initWithFrame:CGRECT_MAKE_SCALAR(0.2, 0.05, 0.6, 0.05, frame)];
        self.textField.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.textField];
        
        for (int i = 1 ; i <= 7 ; i++) {
            if (i == 5) continue;
            UIView *divider = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(frame) * (0.15f * i), CGRectGetWidth(frame), 2)];
            divider.backgroundColor = [UIColor colorWithRed:41.f / 255.f green:182.f / 255.f blue:238.f / 255.f alpha:1.f];
            [self addSubview:divider];
        }
        
        UILabel *allAndProductLabel = [[UILabel alloc] initWithFrame:CGRECT_MAKE_SCALAR(0.1, 0.16, 1, 0.03, frame)];
//        allAndProductLabel.backgroundColor = [UIColor redColor];
        allAndProductLabel.text = @"All / Product";
        allAndProductLabel.textColor = [UIColor whiteColor];
        [self addSubview:allAndProductLabel];
        
        self.allButton = [[UIButton alloc] initWithFrame:CGRECT_MAKE_SCALAR((1.f / 7.f), 0.2, (1.f / 7.f), 0.095, frame)];
        self.xBikeButton = [[UIButton alloc] initWithFrame:CGRECT_MAKE_SCALAR((3.f / 7.f), 0.2, (1.f / 7.f), 0.095, frame)];
        self.coreFitButton = [[UIButton alloc] initWithFrame:CGRECT_MAKE_SCALAR((5.f / 7.f), 0.2, (1.f / 7.f), 0.095, frame)];
        [self settingButton:self.allButton imageName:@"All" titleText:@"All"];
        [self settingButton:self.xBikeButton imageName:@"XBike" titleText:@"XBike"];
        [self settingButton:self.coreFitButton imageName:@"CoreFit" titleText:@"Core Fit"];
        
        UILabel *singleAndNotSocialLabel = [[UILabel alloc] initWithFrame:CGRECT_MAKE_SCALAR(0.1, 0.31, 1, 0.03, frame)];
//        singleAndNotSocialLabel.backgroundColor = [UIColor redColor];
        singleAndNotSocialLabel.text = @"Single / Not Social";
        singleAndNotSocialLabel.textColor = [UIColor whiteColor];
        [self addSubview:singleAndNotSocialLabel];
        
        self.myTargetButton = [[UIButton alloc] initWithFrame:CGRECT_MAKE_SCALAR((1.f / 7.f), 0.35, (1.f / 7.f), 0.095, frame)];
        self.invitePlayerButton = [[UIButton alloc] initWithFrame:CGRECT_MAKE_SCALAR((3.f / 7.f), 0.35, (1.f / 7.f), 0.095, frame)];
        self.teamRaceButton = [[UIButton alloc] initWithFrame:CGRECT_MAKE_SCALAR((5.f / 7.f), 0.35, (1.f / 7.f), 0.095, frame)];
        [self settingButton:self.myTargetButton imageName:@"MyTarget" titleText:@"My Target"];
        [self settingButton:self.invitePlayerButton imageName:@"InvitePlayer" titleText:@"Invite Player"];
        [self settingButton:self.teamRaceButton imageName:@"TeamRace" titleText:@"Team Race"];
        
        UILabel *gameTimeLabel = [[UILabel alloc] initWithFrame:CGRECT_MAKE_SCALAR(0.1, 0.46, 1, 0.03, frame)];
//        gameTimeLabel.backgroundColor = [UIColor redColor];
        gameTimeLabel.text = @"Game Time";
        gameTimeLabel.textColor = [UIColor whiteColor];
        [self addSubview:gameTimeLabel];
        
        self.thirtyMinutsButton = [[UIButton alloc] initWithFrame:CGRECT_MAKE_SCALAR((1.f / 7.f), 0.5, (1.f / 7.f), 0.095, frame)];
        self.oneHourButton = [[UIButton alloc] initWithFrame:CGRECT_MAKE_SCALAR((2.3333f / 7.f), 0.5, (1.f / 7.f), 0.095, frame)];
        self.threeHoursButton = [[UIButton alloc] initWithFrame:CGRECT_MAKE_SCALAR((3.6666f / 7.f), 0.5, (1.f / 7.f), 0.095, frame)];
        self.oneDayButton = [[UIButton alloc] initWithFrame:CGRECT_MAKE_SCALAR((5.f / 7.f), 0.5, (1.f / 7.f), 0.095, frame)];
        [self settingButton:self.thirtyMinutsButton imageName:@"30mins" titleText:@""];
        [self settingButton:self.oneHourButton imageName:@"1hr" titleText:@""];
        [self settingButton:self.threeHoursButton imageName:@"3hr" titleText:@""];
        [self settingButton:self.oneDayButton imageName:@"1day" titleText:@""];
        
        UILabel *easyAndHardLabel = [[UILabel alloc] initWithFrame:CGRECT_MAKE_SCALAR(0.1, 0.61, 1, 0.03, frame)];
//        easyAndHardLabel.backgroundColor = [UIColor redColor];
        easyAndHardLabel.text = @"Easy / Hard";
        easyAndHardLabel.textColor = [UIColor whiteColor];
        [self addSubview:easyAndHardLabel];
        
        self.levelSelectView = [[FCProgressView alloc] initWithFrame:CGRECT_MAKE_SCALAR(0.15, 0.66, 0.7, 0.05, frame) type:ProgressSquareType backgroundColor:[UIColor pageBasicBackgroundColor]];
        self.levelSelectView.progressColor = [UIColor pageYellowColor];
        [self addSubview:self.levelSelectView];
        
        NSArray *levelTextArray = @[@"Easy", @"Easy+", @"Middle", @"Middle+", @"Hard"];
        for (int i = 0 ; i < 5 ; i++) {
            UILabel *levelLabel = [[UILabel alloc] initWithFrame:CGRECT_MAKE_SCALAR((0.15f + (i * 0.14f)), 0.71, 0.13, 0.03, frame)];
//            levelLabel.backgroundColor = [UIColor redColor];
            levelLabel.text = levelTextArray[i];
            levelLabel.textAlignment = NSTextAlignmentCenter;
            levelLabel.textColor = [UIColor whiteColor];
            levelLabel.font = [UIFont systemFontOfSize:CGRectGetWidth(levelLabel.frame) * 0.25];
            [self addSubview:levelLabel];
        }
        
        UILabel *burnLabel = [[UILabel alloc] initWithFrame:CGRECT_MAKE_SCALAR(0, 0.77, 1, 0.03, frame)];
//        burnLabel.backgroundColor = [UIColor redColor];
        burnLabel.text = @"YOUR NEED BURN";
        burnLabel.textColor = [UIColor whiteColor];
        burnLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:burnLabel];
        
        self.caloriesLabel = [[UILabel alloc] initWithFrame:CGRECT_MAKE_SCALAR(0, 0.8, 1, 0.1, frame)];
//        self.caloriesLabel.backgroundColor = [UIColor redColor];
        self.caloriesLabel.text = @"2630";
        self.caloriesLabel.textColor = [UIColor whiteColor];
        self.caloriesLabel.font = [UIFont systemFontOfSize:CGRectGetWidth(self.caloriesLabel.frame) * 0.15f];
        self.caloriesLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.caloriesLabel];
        
        UILabel *caloriesUnitLabel = [[UILabel alloc] initWithFrame:CGRECT_MAKE_SCALAR(0.75, 0.86, 1, 0.03, frame)];
//        caloriesUnitLabel.backgroundColor = [UIColor redColor];
        caloriesUnitLabel.text = @"Calories";
        caloriesUnitLabel.textColor = [UIColor whiteColor];
        [self addSubview:caloriesUnitLabel];
        
        UILabel *endTimeLabel = [[UILabel alloc] initWithFrame:CGRECT_MAKE_SCALAR(0.1, 0.91, 1, 0.03, frame)];
//        endTimeLabel.backgroundColor = [UIColor redColor];
        endTimeLabel.text = @"End Time";
        endTimeLabel.textColor = [UIColor whiteColor];
        [self addSubview:endTimeLabel];
        
        self.startTimeTextField = [[UITextField alloc] initWithFrame:CGRECT_MAKE_SCALAR(0.1, 0.97, 0.35, 0.05, frame)];
        self.startTimeTextField.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.startTimeTextField];
        
        self.endTimeTextField = [[UITextField alloc] initWithFrame:CGRECT_MAKE_SCALAR(0.55, 0.97, 0.35, 0.05, frame)];
        self.endTimeTextField.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.endTimeTextField];

        UILabel *timeDurationLabel = [[UILabel alloc] initWithFrame:CGRECT_MAKE_SCALAR(0.45, 0.97, 0.1, 0.05, frame)];
//        timeDurationLabel.backgroundColor = [UIColor redColor];
        timeDurationLabel.text = @"~";
        timeDurationLabel.textColor = [UIColor whiteColor];
        timeDurationLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:timeDurationLabel];
        
        self.okButton = [[UIButton alloc] initWithFrame:CGRECT_MAKE_SCALAR(0.4, 1.07, 0.2, 0.1, frame)];
//        self.okButton.backgroundColor = [UIColor yellowColor];
        [self.okButton setImage:[UIImage imageNamed:@"Ok"] forState:UIControlStateNormal];
        self.okButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:self.okButton];
        
        UIView *columnDivider = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetWidth(frame) * 0.052, CGRectGetHeight(frame) * 0.16f, 2, CGRectGetHeight(frame) * 0.76f)];
        columnDivider.backgroundColor = [UIColor whiteColor];
        [self addSubview:columnDivider];
        
        for (int i = 0 ; i < 4 ; i++) {
            [self drawCircleWithFrame:CGRectMake(CGRectGetWidth(frame) * 0.035, CGRectGetHeight(frame) * (0.16f + i * 0.15f), CGRectGetWidth(frame) * 0.05, CGRectGetWidth(frame) * 0.05) titleNumber:i + 1];
        }
        [self drawCircleWithFrame:CGRectMake(CGRectGetWidth(frame) * 0.035, CGRectGetHeight(frame) * (0.91f), CGRectGetWidth(frame) * 0.05, CGRectGetWidth(frame) * 0.05) titleNumber:5];
        
    }
    return self;
}

- (void)settingButton:(UIButton *)button imageName:(NSString *)imageName titleText:(NSString *)titleText {
//    button.backgroundColor = [UIColor yellowColor];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_r", imageName]] forState:UIControlStateSelected];
    button.imageView.contentMode = UIViewContentModeScaleAspectFit;
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRECT_MAKE_SCALAR(0, 0.7, 1, 0.2, button.frame)];
    titleLabel.text = titleText;
    titleLabel.font = [UIFont systemFontOfSize:CGRectGetWidth(button.frame) * 0.17];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [UIColor whiteColor];
//    titleLabel.backgroundColor = [UIColor redColor];
    [button addSubview:titleLabel];
    [self addSubview:button];
}

- (void)drawCircleWithFrame:(CGRect)frame titleNumber:(NSInteger)titleNumber {
    UILabel *circleLabel = [[UILabel alloc] initWithFrame:frame];
    circleLabel.layer.cornerRadius = CGRectGetWidth(frame) / 2.f;
    circleLabel.layer.masksToBounds = YES;
    circleLabel.text = [NSString stringWithFormat:@"%d", (int)titleNumber];
    circleLabel.textAlignment = NSTextAlignmentCenter;
    circleLabel.backgroundColor = [UIColor yellowColor];
    [self addSubview:circleLabel];
}

@end

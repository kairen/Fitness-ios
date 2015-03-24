//
//  WHSettingView.h
//  FitnessApp
//
//  Created by KaiRen.Bai on 2015/3/23.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "BaseLoginView.h"

@class FCProgressView;

@interface WHSettingView : BaseLoginView

- (void)setCaloriesValue:(NSInteger)value;
- (void)setBodyMessIndexValue:(NSInteger)value;

@property (nonatomic, strong) UITextField *heightField;
@property (nonatomic, strong) UITextField *weightField;
@property (nonatomic, strong) UIButton *nextButton;

@property (nonatomic, strong) FCProgressView *progressView;
@end

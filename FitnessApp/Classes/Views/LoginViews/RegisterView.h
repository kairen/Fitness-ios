//
//  RegisterView.h
//  FitnessApp
//
//  Created by KaiRen.Bai on 2015/3/23.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "BaseLoginView.h"

@class GenderSwitchView;

@interface RegisterView : BaseLoginView

@property (nonatomic, strong) UITextField *userNameField;
@property (nonatomic, strong) UITextField *emailField;
@property (nonatomic, strong) UITextField *passwdField;
@property (nonatomic, strong) UITextField *checkPasswdField;

@property (nonatomic, strong) UIButton *backButton;
@property (nonatomic, strong) UIButton *submitButton;

@property (nonatomic, strong) GenderSwitchView *genderSwitch;
@end

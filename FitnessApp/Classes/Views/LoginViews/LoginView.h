//
//  LoginView.h
//  FitnessApp
//
//  Created by KaiRen.Bai on 2015/3/23.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "BaseLoginView.h"

@interface LoginView : BaseLoginView

@property (nonatomic, strong) UIButton *facebookButton;
@property (nonatomic, strong) UIButton *loginButton;
@property (nonatomic, strong) UITextField *accountField;
@property (nonatomic, strong) UITextField *passwdField;

@property (nonatomic, strong) UIButton *registerButton;

@end

//
//  RegisterViewController.m
//  FitnessApp
//
//  Created by KaiRen.Bai on 2015/3/23.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegisterView.h"
#import "GenderSwitchView.h"
#import "HTTPClient.h"
#import "HTTPParameterKeys.h"

@interface RegisterViewController () <GenderSwitchDelegate, HTTPClientDelegate>

@property (nonatomic, strong) RegisterView *registerView;
@property (nonatomic) NSInteger genderIndex;
@end

@implementation RegisterViewController

- (void)loadView {
    self.registerView = [[RegisterView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view = self.registerView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.registerView.backButton addTarget:self action:@selector(backLoginViewAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.registerView.submitButton addTarget:self action:@selector(registerAccountAction:) forControlEvents:UIControlEventTouchUpInside];
    self.registerView.genderSwitch.delegate = self;
    self.genderIndex = -1;
}

- (void)registerAccountAction:(id)sender {
    NSString *email = self.registerView.emailField.text;
    NSString *userName = self.registerView.userNameField.text;
    NSString *passwd = self.registerView.passwdField.text;
    NSString *checkPasswd = self.registerView.checkPasswdField.text;
    typeof(self) __weak weakSelf = self;
    
    if(email.length > 0 && userName.length > 0 && passwd.length > 0 && checkPasswd.length > 0) {
        if([passwd isEqualToString:checkPasswd]) {
            [HTTPClient shareInstance].delegate = self;
            NSDictionary *userInfo = @{AccountEmailKey:email,
                                       AccountUserNameKey:userName,
                                       AccountPasswdKey:passwd,
                                       AccountGenderKey:@(weakSelf.genderIndex)};
            [[HTTPClient shareInstance] registerWithUserInfo:userInfo];
        } else {
            [self showAlertWithMessage:@"Password and Confirm password not correct"];
        }
    }
}

- (void)backLoginViewAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)httpRequestRegisterResult:(id)resultObject {
    NSLog(@"%@", resultObject);
}

#pragma mark - GenderSwitchDelegate
- (void)genderSwitchView:(GenderSwitchView *)switchView didSelectAtItem:(GenderType)genderType {
    self.genderIndex = genderType;
}

@end

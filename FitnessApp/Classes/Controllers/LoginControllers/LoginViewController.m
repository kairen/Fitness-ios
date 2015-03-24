//
//  LoginViewController.m
//  FitnessApp
//
//  Created by KaiRen.Bai on 2015/3/23.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "WHSettingController.h"
#import "LoginView.h"

@interface LoginViewController () <UIViewControllerTransitioningDelegate>

@property (nonatomic, strong) LoginView *loginView;
@end

@implementation LoginViewController

- (void)loadView {
    self.loginView = [[LoginView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view = self.loginView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.loginView.registerButton addTarget:self action:@selector(createAccountAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.loginView.loginButton addTarget:self action:@selector(loginFitnessAction:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)loginFitnessAction:(id)sender {
    WHSettingController *settingController = [[WHSettingController alloc] init];
    settingController.transitioningDelegate = self;
    [self presentViewController:settingController animated:YES completion:nil];
}

- (void)createAccountAction:(id)sender {
    RegisterViewController *registerController = [[RegisterViewController alloc] init];
    registerController.transitioningDelegate = self;
    [self presentViewController:registerController animated:YES completion:nil];
}

@end

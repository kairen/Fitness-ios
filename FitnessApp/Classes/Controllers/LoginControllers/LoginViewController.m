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
#import "HTTPClient.h"
#import "AppDelegate.h"
#import "LoginView.h"

@interface LoginViewController () <HTTPClientDelegate>

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
    [self.loginView.facebookButton addTarget:self action:@selector(loginFaceBookAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)loginFaceBookAction:(id)sender {
    NSArray *sessions = @[@"public_profile", @"user_friends", @"email"];
    [HTTPClient shareInstance].delegate = self;
    [FBSession openActiveSessionWithReadPermissions:sessions allowLoginUI:YES completionHandler:^(FBSession *session, FBSessionState state, NSError *error) {
        
        AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
        [appDelegate sessionStateChanged:session state:state Error:error];
        if (appDelegate.FBIsLogin) {
            [[FBRequest requestForMe] startWithCompletionHandler:^(FBRequestConnection *connection, NSDictionary<FBGraphUser> *user, NSError *error) {
                NSString *token = session.accessTokenData.accessToken;
                NSString *userName = user.name;
                [[HTTPClient shareInstance] loginFacebookWithToken:token userName:userName];
            }];
        }
    }];
}
- (void)loginFitnessAction:(id)sender {
    NSString *account = self.loginView.accountField.text;
    NSString *passwd = self.loginView.passwdField.text;
    
    if(account.length > 0 && passwd.length > 0) {
        [HTTPClient shareInstance].delegate = self;
        [[HTTPClient shareInstance] loginWithUserName:account passwd:passwd];
    } else {
        [self showAlertWithMessage:@"Account or Password  not correct."];
    }
}

- (void)createAccountAction:(id)sender {
    RegisterViewController *registerController = [[RegisterViewController alloc] init];
    registerController.transitioningDelegate = self;
    [self presentViewController:registerController animated:YES completion:nil];
}

#pragma mark - HTTP Result  Delegate
- (void)httpRequestLoginResult:(id)resultObject {
    NSLog(@"%@", resultObject);
    WHSettingController *settingController = [[WHSettingController alloc] init];
    settingController.transitioningDelegate = self;
    [self presentViewController:settingController animated:YES completion:nil];
}

@end

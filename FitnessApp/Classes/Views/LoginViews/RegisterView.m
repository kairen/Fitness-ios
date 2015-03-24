//
//  RegisterView.m
//  FitnessApp
//
//  Created by KaiRen.Bai on 2015/3/23.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "RegisterView.h"
#import "GenderSwitchView.h"

@interface RegisterView ()

@property (nonatomic, strong) UILabel *titleLabel;
@end

@implementation RegisterView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        self.showLogo = YES;
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.center.x - (self.width * 0.12), self.logoImage.maxY + (self.height * 0.1), (self.width * 0.24), self.height * 0.044)];
        self.titleLabel.text = @"CREATE";
        self.titleLabel.font = [UIFont boldSystemFontOfSize:24];
        self.titleLabel.textColor = [UIColor whiteColor];
        self.titleLabel.adjustsFontSizeToFitWidth = YES;
        [self addSubview:self.titleLabel];
        
        self.userNameField = [[UITextField alloc] initWithFrame:CGRectMake(self.logoImage.minX, self.titleLabel.maxY + (self.height * 0.03), self.logoImage.width, self.height * 0.075)];
        [self configureTextField:self.userNameField placeHolder:@"Enter Your Name" leftImage:@"info_account"];
        
        self.genderSwitch = [[GenderSwitchView alloc] initWithFrame:CGRectMake(self.center.x - (self.width * 0.35), self.userNameField.maxY, self.width * 0.7, self.height * 0.12) leftImage:@"man_select" leftUnselectImage:@"man_unselected" rightImage:@"woman_select" rightUnselectImage:@"woman_unselected"];
        [self.genderSwitch setLeftTitle:@"Male" rightTitle:@"Female"];
        [self addSubview:self.genderSwitch];
        
        self.emailField = [[UITextField alloc] initWithFrame:CGRectMake(self.logoImage.minX, self.genderSwitch.maxY, self.logoImage.width, self.height * 0.075)];
        [self configureTextField:self.emailField placeHolder:@"Enter your E-Mail" leftImage:@"email"];
        
        self.passwdField = [[UITextField alloc] initWithFrame:CGRectMake(self.logoImage.minX, self.emailField.maxY + 10, self.logoImage.width, self.height * 0.075)];
        [self configureTextField:self.passwdField placeHolder:@"Enter your password" leftImage:@"lock_passwd"];
        self.passwdField.secureTextEntry = YES;
        
        self.checkPasswdField = [[UITextField alloc] initWithFrame:CGRectMake(self.logoImage.minX, self.passwdField.maxY + 10, self.logoImage.width, self.height * 0.075)];
        [self configureTextField:self.checkPasswdField placeHolder:@"Confirm password" leftImage:@"lock＿confirm"];
        self.checkPasswdField.secureTextEntry = YES;
        
        self.backButton = [UIButton buttonWithType:UIButtonTypeSystem];
        self.backButton.frame = CGRectMake(self.checkPasswdField.minX, self.checkPasswdField.maxY + 20, self.width * 0.3, self.height * 0.075);
        [self configureButton:self.backButton title:@"Back" fillCollor:YES];
        
        self.submitButton = [UIButton buttonWithType:UIButtonTypeSystem];
        self.submitButton.frame = CGRectMake(self.checkPasswdField.minX + self.checkPasswdField.width - (self.width * 0.3), self.checkPasswdField.maxY + 20, self.width * 0.3, self.height * 0.075);
        [self configureButton:self.submitButton title:@"OK" fillCollor:YES];
    }
    return self;
}
@end

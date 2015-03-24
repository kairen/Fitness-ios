//
//  LoginView.m
//  FitnessApp
//
//  Created by KaiRen.Bai on 2015/3/23.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "LoginView.h"

@implementation LoginView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        self.showLogo = YES;
        self.facebookButton = [UIButton buttonWithType:UIButtonTypeSystem];
        self.facebookButton.frame = CGRectMake(0, 0, self.width * 0.2, self.width * 0.2);
        self.facebookButton.center = CGPointMake(self.center.x, self.center.y - self.width * 0.2);
        [self.facebookButton setBackgroundImage:[UIImage fitImage:@"facebook" size:self.facebookButton.size] forState:UIControlStateNormal];
        [self addSubview:self.facebookButton];
        
        self.accountField = [[UITextField alloc] initWithFrame:CGRectMake(self.logoImage.minX, self.center.y, self.logoImage.width, self.height * 0.075)];
        [self configureTextField:self.accountField placeHolder:@"Enter E-mail" leftImage:@"info_account"];
        
        self.passwdField = [[UITextField alloc] initWithFrame:CGRectMake(self.logoImage.minX, self.accountField.maxY + 10, self.logoImage.width, self.height * 0.075)];
        [self configureTextField:self.passwdField placeHolder:@"Enter Password" leftImage:@"lock_passwd"];
        self.passwdField.secureTextEntry = YES;
        
        self.loginButton = [UIButton buttonWithType:UIButtonTypeSystem];
        self.loginButton.frame = CGRectMake(self.center.x - (self.width * 0.16) , self.passwdField.maxY + (self.height * 0.0375), self.width * 0.32, self.height * 0.075);
        [self configureButton:self.loginButton title:@"Log in" fillCollor:YES];
        
        self.registerButton = [UIButton buttonWithType:UIButtonTypeSystem];
        self.registerButton.frame = CGRectMake(self.center.x - (self.width * 0.35), self.height - (self.height * 0.075), self.width * 0.7, (self.height * 0.075));
        self.registerButton.titleLabel.adjustsFontSizeToFitWidth = YES;
        [self configureButton:self.registerButton title:@"You can create an account." fillCollor:NO];
    }
    return self;
}
@end

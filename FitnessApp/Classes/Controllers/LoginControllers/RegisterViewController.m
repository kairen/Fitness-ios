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

@interface RegisterViewController () <GenderSwitchDelegate>

@property (nonatomic, strong) RegisterView *registerView;
@end

@implementation RegisterViewController

- (void)loadView {
    self.registerView = [[RegisterView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view = self.registerView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.registerView.backButton addTarget:self action:@selector(backLoginViewAction:) forControlEvents:UIControlEventTouchUpInside];
    self.registerView.genderSwitch.delegate = self;
}

- (void)backLoginViewAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - GenderSwitchDelegate
- (void)genderSwitchView:(GenderSwitchView *)switchView didSelectAtItem:(GenderType)genderType {
    NSLog(@"%@", (genderType == GenderFemale) ? @"女" : @"男");
}

@end

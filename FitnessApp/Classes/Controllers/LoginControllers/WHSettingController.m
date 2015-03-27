//
//  WHSettingController.m
//  FitnessApp
//
//  Created by KaiRen.Bai on 2015/3/23.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "WHSettingController.h"
#import "WHSettingView.h"
#import "HTTPClient.h"

@interface WHSettingController () <HTTPClientDelegate>
@property (nonatomic, strong) WHSettingView *settingView;
@end

@implementation WHSettingController

- (void)loadView {
    self.settingView = [[WHSettingView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view = self.settingView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.settingView.nextButton addTarget:self action:@selector(postWeightAndHeightAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)postWeightAndHeightAction:(id)sender {
    CGFloat weight = [self.settingView.weightField.text floatValue];
    CGFloat height = [self.settingView.heightField.text floatValue];
    if(weight > 30 && height > 140) {
        [HTTPClient shareInstance].delegate = self;
        [[HTTPClient shareInstance] postUserBodyWeight:weight andHeight:height];
    } else {
        [self showAlertWithMessage:@"Weight and Height incorrect."];
    }
}

#pragma mark - HTTP Request Body Meteric Result
- (void)httpRequestUserBodyResult:(id)resultObject {
    NSLog(@"%@", resultObject);
}
@end

//
//  WHSettingController.m
//  FitnessApp
//
//  Created by KaiRen.Bai on 2015/3/23.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "WHSettingController.h"
#import "WHSettingView.h"

@interface WHSettingController ()
@property (nonatomic, strong) WHSettingView *settingView;
@end

@implementation WHSettingController

- (void)loadView {
    self.settingView = [[WHSettingView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view = self.settingView;
}
@end

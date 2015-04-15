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
#import "TodayOverView.h"
#import "TodayOverViewCell.h"

@interface WHSettingController () <HTTPClientDelegate, UITableViewDataSource, UITableViewDelegate>
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
//    [[HTTPClient shareInstance] getDailyRecommendedCaloriesCompletation:^(id responseObject) {
//        NSLog(@"%@", responseObject);
//    }];
//    [[HTTPClient shareInstance] getDailyRecommendedWonderPointsCompletation:^(id responseObject) {
//        NSLog(@"%@", responseObject);
//    }];
    
    TodayOverView *todayOverView = [[TodayOverView alloc] initWithFrame:self.view.frame];
    todayOverView.socialGameView.delegate = self;
    todayOverView.socialGameView.dataSource = self;
    [self.view addSubview:todayOverView];
}

#pragma mark - Social Progress of TodayOverView Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *kCellIdentity = @"cell";
    TodayOverViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentity];
    if(!cell) {
        cell = [[TodayOverViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellIdentity tableView:tableView];
    }
    cell.titleLabel.text = @[@"Chan,Gupta",@"張皓惟"][indexPath.row];
    [cell setProgressValue:[@[@(80),@(39)][indexPath.row] floatValue]];
    return cell;
}
@end

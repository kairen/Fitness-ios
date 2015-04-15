//
//  StatusController.m
//  FitnessApp
//
//  Created by KaiRen.Bai on 2015/4/15.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "StatusController.h"
#import "DashboardTabController.h"
#import "DahsboardStatusView.h"
#import "EquipmentSelectView.h"
#import "StatusView.h"
#import "StatusViewCell.h"

@interface StatusController () <EquipmentDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) StatusView *statusView;
@property (nonatomic, assign) NSInteger selectIndex;
@end

@implementation StatusController

- (void)loadView {
    DashboardTabController *tabController = ((DashboardTabController *)self.tabBarController);
    self.statusView = [[StatusView alloc] initWithFrame:tabController.view.frame];
    self.view = self.statusView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.statusView.equipmentSelector.delegate = self;
    self.statusView.chartTableView.dataSource = self;
    self.statusView.chartTableView.delegate = self;
    self.selectIndex = 0;
}

#pragma mark - EquipmentDelegate Method
- (void)equipment:(EquipmentSelectView *)quipment didSelectAtIndex:(NSInteger)index {
    self.selectIndex = index;
    [self.statusView.chartTableView reloadData];
}

#pragma mark - UITableView Delegate and Datasource
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return (self.selectIndex == 0) ? 4 : 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *kCellIdentity = @"cell";
    StatusViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentity];
    if(!cell) {
        cell = [[StatusViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellIdentity tableView:tableView];
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.textLabel.font = [UIFont fontHelveticaNeueBoldSize:24];
    }
    NSArray *images = (self.selectIndex == 0) ? @[@"icon_lap", @"icon_distance", @"icon_calorie", @"icon_time"] : @[@"icon_lap", @"icon_distance", @"icon_calorie", @"icon_time", @"icon_max_speed"];
    NSArray *titles = (self.selectIndex == 0) ? @[@"LAP", @"DISTANCE", @"CALORIE", @"TIME"] : @[@"LAP", @"DISTANCE", @"CALORIE", @"TIME", @"MAX SPEED"];
    
    cell.imageView.image = [UIImage fitImage:images[indexPath.row] size:CGSizeMake(35, 35)];
    cell.textLabel.text = titles[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    cell.alpha = 0.0;
    [UIView animateWithDuration:0.4 animations:^{
        cell.alpha = 1.0;
    }];
}


@end

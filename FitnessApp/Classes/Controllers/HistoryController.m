//
//  HistoryController.m
//  FitnessApp
//
//  Created by KaiRen.Bai on 2015/4/15.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "HistoryController.h"
#import "DashboardTabController.h"
#import "DahsboardStatusView.h"
#import "EquipmentSelectView.h"
#import "HistoryView.h"
#import "UICalendar.h"

@interface HistoryController () <EquipmentDelegate, UICalendarDelegate>

@property (nonatomic, strong) HistoryView *historyView;
@end

@implementation HistoryController

- (void)loadView {
    DashboardTabController *tabController = ((DashboardTabController *)self.tabBarController);
    self.historyView = [[HistoryView alloc] initWithFrame:tabController.view.frame];
    self.view = self.historyView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.historyView.equipmentSelector.delegate = self;
    self.historyView.calendar.delegate = self;
}

#pragma mark - EquipmentDelegate Method
- (void)equipment:(EquipmentSelectView *)quipment didSelectAtIndex:(NSInteger)index {
    NSLog(@"%ld", (long)index);
}

- (void)calendar:(UICalendar *)calendar didSelectAtDate:(NSString *)date {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%@", date] message:@"message" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
    [alertView show];
}

@end

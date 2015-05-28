//
//  DashboardTabController.m
//  FitnessApp
//
//  Created by KaiRen.Bai on 2015/4/15.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "DashboardTabController.h"
#import "StatusController.h"
#import "ChallengeController.h"
#import "HistoryController.h"
#import "SocialController.h"
#import "DahsboardStatusView.h"
#import "MenuView.h"
#import "AppDelegate.h"

@interface DashboardTabController () <MenuViewDelegate>

@property (nonatomic, strong) MenuView *menuView;
@end

@implementation DashboardTabController

- (void)viewDidLoad {
    [super viewDidLoad];
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    self.statusView = [[DahsboardStatusView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 70)];
    [self.statusView setLevelValue:0];
    self.statusView.nameLabel.text = appDelegate.name;
    self.statusView.progressView.progess = 100;
    self.statusView.progressView.maxValue = 1000;
    [self.statusView.personalView loadImageFromURL:[NSURL URLWithString:appDelegate.url] key:@"personal"];
    [self.view addSubview:self.statusView];
    
    self.logoutButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.logoutButton.frame = CGRectMake(self.view.width - 35, self.statusView.maxY, 35, 70);
    [self.logoutButton setBackgroundImage:[UIImage fitImage:@"index_icon" size:self.logoutButton.size] forState:UIControlStateNormal];
    [self.logoutButton addTarget:self action:@selector(logoutAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.logoutButton];
    
    self.menuView = [[MenuView alloc] init];
    self.menuView.delegate = self;
    
    self.tabBar.layer.zPosition = 0;
    self.tabBar.barTintColor = [UIColor pageBlueColor];
    self.view.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
    
    [UITabBar appearance].shadowImage = [[UIImage alloc] init];
    [UITabBar appearance].backgroundImage = [[UIImage alloc] init];
    [self configureViewControllers];
    [self configureBarItem];
}

- (void)configureViewControllers {
    self.statusController = [[StatusController alloc] init];
    [self configureTabBar:self.statusController itemImage:@"icon_today_unselected" selectImage:@"icon_today_selected" tag:0];
    
    self.challengeController = [[ChallengeController alloc] init];
    [self configureTabBar:self.challengeController itemImage:@"icon_game_unselected" selectImage:@"icon_game_selected" tag:1];
    
    self.historyController = [[HistoryController alloc] init];
    [self configureTabBar:self.historyController itemImage:@"icon_history_unselected" selectImage:@"icon_history_selected" tag:2];
    
    self.viewControllers = @[self.statusController, self.challengeController, self.historyController];
}

- (void)configureBarItem {
    UIImage *leftImage = [[UIImage imageNamed:@"icon_list"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc] initWithImage:leftImage style:UIBarButtonItemStylePlain target:self action:@selector(leftBarButtonAction:)];
    self.navigationItem.leftBarButtonItem = leftBarButton;
    
    UIImage *rightImage = [[UIImage imageNamed:@"icon_settings"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithImage:rightImage style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonAction:)];
    self.navigationItem.rightBarButtonItem = rightBarButton;
}

-(void) configureTabBar:(UIViewController*)controller itemImage:(NSString *)defaultimage selectImage:(NSString*)selectImage tag:(NSInteger)tag {
    
    [controller.tabBarItem setImage:[[UIImage fitImage:defaultimage size:CGSizeMake(self.view.width * 0.333, 60)] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [controller.tabBarItem setSelectedImage:[[UIImage fitImage:selectImage size:CGSizeMake(self.view.width * 0.333, 67)] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    controller.tabBarItem.tag = tag;
}

- (void)logoutAction:(id)sender {
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [appDelegate userLoggedOut];
    [appDelegate presentToLoginController];
}

#pragma mark - TabBar Delegate
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    for(UIViewController *controller in self.viewControllers) {
        controller.tabBarItem.title = @"";
    }
    [self.statusView changeNavigationWithPageType:item.tag];
}

#pragma mark - BarButton Action
- (void)leftBarButtonAction:(id)sender {
    if(!self.menuView.isShow) {
        [self.menuView showInView:self.view];
    } else {
        [self.menuView dismiss];
    }
}

- (void)rightBarButtonAction:(id)sender {
    
}

- (void)menuView:(MenuView *)menuView didSeletedButtonIndex:(NSInteger)buttonIndex {
    if(buttonIndex <= 2) {
        SocialController *socailController = [[SocialController alloc] initWithFrame:self.view.bounds socialPage:buttonIndex];
        [self addChildViewController:socailController];
        [socailController didMoveToParentViewController:self];
        [self.view addSubview:socailController.view];
    } else if(buttonIndex == 4) {
        [self logoutAction:nil];
    }
}

@end

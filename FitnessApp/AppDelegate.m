//
//  AppDelegate.m
//  FitnessApp
//
//  Created by KaiRen.Bai on 2015/3/23.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewController.h"
#import "AFNetworkActivityIndicatorManager.h"
#import "DashboardTabController.h"

NSString * const DB_FITNESS = @"fitness.db";

@interface AppDelegate ()

@property (strong, nonatomic) UINavigationController *navigationController;
@property (strong, nonatomic) DashboardTabController *dashboardTabController;
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self presentToLoginController];
    
    if (FBSession.activeSession.state == FBSessionStateCreatedTokenLoaded) {
        NSLog(@"Already have token");
        [FBSession openActiveSessionWithReadPermissions:@[@"public_profile", @"email"] allowLoginUI:NO completionHandler:^(FBSession *session, FBSessionState state, NSError *error) {
            [self sessionStateChanged:session state:state Error:error];
        }];
    } else {
        NSLog(@"Need Log In");
    }
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [FBAppCall handleDidBecomeActive];
    //    [FBAppEvents activateApp];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [FBSession.activeSession handleOpenURL:url];
}

#pragma mark - Change RootController
- (void)presentToLoginController {
    self.window.rootViewController = [[LoginViewController alloc] init];
    self.dashboardTabController = nil;
    self.navigationController = nil;
}

- (void)presentToDashboardTabController {
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleDefault];
    self.dashboardTabController = [[DashboardTabController alloc] init];
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:self.dashboardTabController];
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.backgroundColor = [UIColor whiteColor];
    
    UIImage *backgroundImage = [UIImage imageNamed:@"logo_navigation_bar"];
    backgroundImage = [backgroundImage resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, backgroundImage.size.height, backgroundImage.size.width)];
    
    id navigationBarAppearance = self.navigationController.navigationBar;
    [navigationBarAppearance setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];
    
    self.window.rootViewController = self.navigationController;
    self.dashboardTabController.selectedIndex = 0;
}

#pragma mark - Facebook Login Methods
-(void)sessionStateChanged:(FBSession *)session state:(FBSessionState) state Error:(NSError *)error {
    if (!error && state == FBSessionStateOpen) {
        [self userLoggedIn];
        return;
    } else if (state == FBSessionStateClosed || state == FBSessionStateClosedLoginFailed) {
        [self userLoggedOut];
    }
    
    if (error) {
        NSLog(@"error : %@", error);
        [FBSession.activeSession closeAndClearTokenInformation];
        [self userLoggedOut];
    }
}

-(void)userLoggedIn {
    NSLog(@"user Loggin");
    self.FBIsLogin = YES;
}

-(void)userLoggedOut {
    NSLog(@"user Logged out");
    self.FBIsLogin = NO;
}

@end

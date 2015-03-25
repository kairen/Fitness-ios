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

NSString * const DB_FITNESS = @"fitness.db";


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [[LoginViewController alloc] init];
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

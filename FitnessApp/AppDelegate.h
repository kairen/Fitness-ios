//
//  AppDelegate.h
//  FitnessApp
//
//  Created by KaiRen.Bai on 2015/3/23.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

- (void)sessionStateChanged:(FBSession*)session state:(FBSessionState) state Error:(NSError*)error;
- (void)userLoggedIn;
- (void)userLoggedOut;

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic) BOOL FBIsLogin;
@end


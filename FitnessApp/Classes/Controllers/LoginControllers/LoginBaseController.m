//
//  LoginBaseControllers.m
//  FitnessApp
//
//  Created by KaiRen.Bai on 2015/3/24.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "LoginBaseController.h"
#import "TransitionAnimation.h"

static NSString * const LoginAlertViewTitle = @"Account Info";

@implementation LoginBaseController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

- (void)showAlertWithMessage:(NSString *)message {
    UIAlertView *messageAlert = [[UIAlertView alloc] initWithTitle:LoginAlertViewTitle message:message delegate:nil cancelButtonTitle:@"cancel" otherButtonTitles:nil, nil];
    [messageAlert show];
}

#pragma mark - View Controller Animation Delegate
- (id<UIViewControllerAnimatedTransitioning>) animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    TransitionAnimation *transitionAnimation = [[TransitionAnimation alloc] init];
    transitionAnimation.goingRight = NO;
    return transitionAnimation;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    TransitionAnimation *transitionAnimation = [[TransitionAnimation alloc] init];
    transitionAnimation.goingRight = YES;
    return transitionAnimation;
}

@end

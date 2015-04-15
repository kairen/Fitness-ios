//
//  MenuView.m
//  Social
//
//  Created by nutc on 2015/3/26.
//  Copyright (c) 2015年 HW. All rights reserved.
//

#import "MenuView.h"

@interface MenuView ()

@property (nonatomic, strong) UIView *maskView;
@end

@implementation MenuView

- (void)showInView:(UIView *)view {
    self.show = YES;
    self.frame = CGRectMake(0, 0, CGRectGetWidth(view.frame) * 0.66666f, CGRectGetHeight(view.frame));
    self.maskView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.maskView.backgroundColor = [UIColor pageBasicBackgroundColor];
    self.maskView.alpha = 0.7;
    [view addSubview:self.maskView];
    
    NSArray *imagesName = @[@"Friends", @"MyTeam", @"Ranking", @"Setting", @"Logout"];
    NSArray *titleTextName = @[@"FRIENDS", @"MY TEAM", @"RANKING", @"SETTING", @"LOG OUT"];
    CGFloat maxY = 0;
    
    for (int i = 0 ; i < 5 ; i++) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.frame) * (i / 7.f), CGRectGetWidth(self.frame), CGRectGetHeight(self.frame) / 7.f)];
        button.backgroundColor = [UIColor grayColor];
        button.layer.borderColor = [UIColor whiteColor].CGColor;
        button.layer.borderWidth = 1.f;
        button.tag = i;
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetWidth(button.frame) * 0.1f, CGRectGetHeight(button.frame) * 0.3225, CGRectGetHeight(button.frame) * 0.35, CGRectGetHeight(button.frame) * 0.35)];
        imageView.image = [UIImage imageNamed:imagesName[i]];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [button addSubview:imageView];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(imageView.frame), CGRectGetMinY(imageView.frame), CGRectGetWidth(button.frame) - CGRectGetMaxX(imageView.frame), CGRectGetHeight(imageView.frame))];
        titleLabel.text = titleTextName[i];
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        [button addSubview:titleLabel];
        maxY = button.maxY;
        [self addSubview:button];
    }
    
    UIImageView *logoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, maxY, CGRectGetWidth(self.frame), self.height - maxY)];
    logoImageView.image = [UIImage imageNamed:@"menu_icon"];
    [self addSubview:logoImageView];
    
    [view addSubview:self];
    self.frame = CGRectMake(-CGRectGetWidth(view.frame) * 0.66666f, 0, CGRectGetWidth(view.frame) * 0.66666f, CGRectGetHeight(view.frame));
    CGRect lastFrame = CGRectMake(0, 0, CGRectGetWidth(view.frame) * 0.66666f, CGRectGetHeight(view.frame));
    self.alpha = 0.0;
    [UIView animateWithDuration:0.23456f animations:^{
        self.frame = lastFrame;
        self.alpha = 1.0;
    } completion:nil];
}

- (void)dismiss {
    
    [UIView animateWithDuration:0.23456f animations:^{
        self.alpha = 0.0;
        self.maskView.alpha = 0.0;
    } completion:^(BOOL finished) {
        [self.maskView removeFromSuperview];
        [self removeFromSuperview];
        for(UIView *view in self.subviews) {
            [view removeFromSuperview];
        }
        self.maskView = nil;
        self.show = NO;
    }];
}


- (void)buttonAction:(UIButton *)button {
    if (self.delegate && [self.delegate respondsToSelector:@selector(menuView:didSeletedButtonIndex:)]) {
        [self.delegate menuView:self didSeletedButtonIndex:button.tag];
    }
    [self dismiss];
}

@end

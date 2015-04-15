//
//  SocialView.m
//  Social
//
//  Created by nutc on 2015/3/26.
//  Copyright (c) 2015年 HW. All rights reserved.
//

#import "SocialView.h"

@interface SocialView()

@property (nonatomic, strong) UIView *backgroundView;

@end

@implementation SocialView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UIView *maskView = [[UIView alloc] initWithFrame:self.bounds];
        maskView.backgroundColor = [UIColor grayColor];
        maskView.alpha = 0.7f;
        [self addSubview:maskView];
        
        self.backgroundView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetWidth(frame) * 0.05, CGRectGetHeight(frame) * 0.05, CGRectGetWidth(frame) * 0.9, CGRectGetHeight(frame) * 0.9)];
        self.backgroundView.backgroundColor = [UIColor colorWithRed:34.f / 255.f green:160.f / 255.f blue:233.f / 255.f alpha:1.f];
        self.backgroundView.layer.cornerRadius = CGRectGetWidth(self.backgroundView.frame) * 0.05f;
        [self addSubview:self.backgroundView];
        
        self.logoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.backgroundView.frame) * 0.02, CGRectGetHeight(self.backgroundView.frame) * 0.01, CGRectGetWidth(self.backgroundView.frame) * 0.12, CGRectGetHeight(self.backgroundView.frame) * 0.1)];
        self.logoImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.self.backgroundView addSubview:self.logoImageView];
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.logoImageView.frame) + 10, CGRectGetMinY(self.logoImageView.frame), CGRectGetWidth(self.self.backgroundView.frame) * 0.58, CGRectGetHeight(self.logoImageView.frame))];
        self.titleLabel.textColor = [UIColor whiteColor];
        self.titleLabel.font = [UIFont systemFontOfSize:CGRectGetWidth(self.self.backgroundView.frame) * 0.07f];
        [self.self.backgroundView addSubview:self.titleLabel];
        
        self.cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.self.backgroundView.frame) * 0.84, CGRectGetHeight(self.self.backgroundView.frame) * 0.01, CGRectGetWidth(self.self.backgroundView.frame) * 0.12, CGRectGetHeight(self.self.backgroundView.frame) * 0.1)];
        [self.cancelButton setImage:[UIImage imageNamed:@"Cancel"] forState:UIControlStateNormal];
        self.cancelButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.self.backgroundView addSubview:self.cancelButton];
        
        UIView *buttonsView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.self.backgroundView.frame) * 0.12, CGRectGetWidth(self.self.backgroundView.frame), CGRectGetHeight(self.self.backgroundView.frame) * 0.15)];
        buttonsView.backgroundColor = [UIColor whiteColor];
        [self.self.backgroundView addSubview:buttonsView];
        
        NSArray *imagesName = @[@"AllFriends", @"MyTeam2", @"Facebook", @"AreaFriends"];
        NSArray *buttonText = @[@"All", @"My Team", @"Facebook", @"Area"];
        self.buttonsArray = [NSMutableArray array];
        
        for (int i = 0 ; i < 4 ; i++) {
            UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetWidth(buttonsView.frame) * (i / 4.f), CGRectGetHeight(buttonsView.frame) * 0.07, CGRectGetWidth(buttonsView.frame) / 4, CGRectGetHeight(buttonsView.frame) * 0.88)];
            [button setImage:[UIImage imageNamed:imagesName[i]] forState:UIControlStateNormal];
            [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_r", imagesName[i]]] forState:UIControlStateSelected];
            button.imageView.contentMode = UIViewContentModeScaleAspectFit;

            button.tag = i;
            [buttonsView addSubview:button];
            
            UILabel *buttonLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(button.frame) * 0.63, CGRectGetWidth(button.frame), CGRectGetWidth(button.frame) * 0.29)];
            buttonLabel.text = buttonText[i];
            buttonLabel.textColor = [UIColor grayColor];
            buttonLabel.textAlignment = NSTextAlignmentCenter;
            buttonLabel.font = [UIFont systemFontOfSize:CGRectGetWidth(button.frame) * 0.17f];
            [button addSubview:buttonLabel];
            
            [self.buttonsArray addObject:button];
        }
    }
    return self;
}

- (void)chagePage:(SocialPage)socialPage {
    if (self.socialFriendsView) {
        [self.socialFriendsView removeFromSuperview];
        self.socialFriendsView = nil;
    }
    if (self.socialMyTeamView) {
        [self.socialMyTeamView removeFromSuperview];
        self.socialMyTeamView = nil;
    }
    if (self.socialAreaView) {
        [self.socialAreaView removeFromSuperview];
        self.socialAreaView = nil;
    }
    if (socialPage == SocialALLPage) {
        self.socialFriendsView = [[SocialFriendsView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.self.backgroundView.frame) * 0.27, CGRectGetWidth(self.self.backgroundView.frame), CGRectGetHeight(self.self.backgroundView.frame) * 0.61)];
        [self.backgroundView addSubview:self.socialFriendsView];
    }
    else if (socialPage == SocialMyTeamPage) {
        self.socialMyTeamView = [[SocialMyTeamView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.self.backgroundView.frame) * 0.27, CGRectGetWidth(self.self.backgroundView.frame), CGRectGetHeight(self.self.backgroundView.frame) * 0.61)];
        [self.backgroundView addSubview:self.socialMyTeamView];
    }
    else if (socialPage == SocialAreaPage) {
        self.socialAreaView = [[SocialAreaView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.self.backgroundView.frame) * 0.27, CGRectGetWidth(self.self.backgroundView.frame), CGRectGetHeight(self.self.backgroundView.frame) * 0.61)];
        [self.backgroundView addSubview:self.socialAreaView];
    }

}

@end

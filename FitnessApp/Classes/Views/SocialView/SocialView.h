//
//  SocialView.h
//  Social
//
//  Created by nutc on 2015/3/26.
//  Copyright (c) 2015年 HW. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SocialFriendsView.h"
#import "SocialMyTeamView.h"
#import "SocialAreaView.h"

typedef NS_ENUM(NSInteger, SocialPage) {
    SocialALLPage = 0,
    SocialMyTeamPage,
    SocialAreaPage,
};

@interface SocialView : UIView

@property (nonatomic, strong) UIImageView *logoImageView;
@property (nonatomic, strong) UIButton *cancelButton;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) NSMutableArray *buttonsArray;
@property (nonatomic, strong) SocialFriendsView *socialFriendsView;
@property (nonatomic, strong) SocialMyTeamView *socialMyTeamView;
@property (nonatomic, strong) SocialAreaView *socialAreaView;

- (void)chagePage:(SocialPage)socialPage;

@end

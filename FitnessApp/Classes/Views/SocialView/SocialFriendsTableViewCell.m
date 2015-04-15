//
//  SocialFriendsTableViewCell.m
//  Social
//
//  Created by nutc on 2015/3/27.
//  Copyright (c) 2015年 HW. All rights reserved.
//

#import "SocialFriendsTableViewCell.h"

@implementation SocialFriendsTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.photoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.frame) * 0.1, CGRectGetHeight(self.frame) * 0.1, CGRectGetWidth(self.frame) * 0.1, CGRectGetHeight(self.frame) * 0.8)];
//        self.photoImageView.backgroundColor = [UIColor redColor];
        self.photoImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:self.photoImageView];
        
        self.rankImageView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.frame) * 0.22, CGRectGetHeight(self.frame) * 0.1, CGRectGetWidth(self.frame) * 0.1, CGRectGetHeight(self.frame) * 0.8)];
//        self.rankImageView.backgroundColor = [UIColor blueColor];
        self.rankImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:self.rankImageView];
        
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.frame) * 0.33, CGRectGetHeight(self.frame)  * 0.05, CGRectGetWidth(self.frame) * 0.3, CGRectGetHeight(self.frame) * 0.5)];
//        self.nameLabel.backgroundColor = [UIColor yellowColor];
        self.nameLabel.font = [UIFont systemFontOfSize:CGRectGetWidth(self.frame) * 0.08f];
        [self addSubview:self.nameLabel];
        
        UILabel *titleLevelLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.frame) * 0.33, CGRectGetHeight(self.frame)  * 0.55, CGRectGetWidth(self.frame) * 0.14, CGRectGetHeight(self.frame) * 0.4)];
//        titleLevelLabel.backgroundColor = [UIColor orangeColor];
        titleLevelLabel.textColor = [UIColor grayColor];
        titleLevelLabel.text = @"Level：";
        titleLevelLabel.font = [UIFont systemFontOfSize:CGRectGetWidth(self.frame) * 0.04f];
        [self addSubview:titleLevelLabel];
        
        self.levelLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.frame) * 0.46, CGRectGetHeight(self.frame)  * 0.55, CGRectGetWidth(self.frame) * 0.15, CGRectGetHeight(self.frame) * 0.4)];
//        self.levelLabel.backgroundColor = [UIColor greenColor];
        self.levelLabel.font = [UIFont systemFontOfSize:CGRectGetWidth(self.frame) * 0.04f];
        [self addSubview:self.levelLabel];

        
    }
    return self;
}


@end

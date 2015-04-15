//
//  SocialFriendsTableViewCell.h
//  Social
//
//  Created by nutc on 2015/3/27.
//  Copyright (c) 2015年 HW. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SocialFriendsTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *photoImageView;
@property (nonatomic, strong) UIImageView *rankImageView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *levelLabel;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

@end

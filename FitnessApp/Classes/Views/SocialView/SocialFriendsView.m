//
//  SocialFriendsView.m
//  Social
//
//  Created by nutc on 2015/3/27.
//  Copyright (c) 2015年 HW. All rights reserved.
//

#import "SocialFriendsView.h"

@implementation SocialFriendsView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor grayColor];
        
        self.searchTextField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetWidth(frame) * 0.2, CGRectGetHeight(frame) * 0.05, CGRectGetWidth(frame) * 0.6, CGRectGetHeight(frame) * 0.1)];
        self.searchTextField.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.searchTextField];
        
        self.searchButton = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.searchTextField.frame) - CGRectGetHeight(self.searchTextField.frame) - 10, CGRectGetMinY(self.searchTextField.frame), CGRectGetHeight(self.searchTextField.frame), CGRectGetHeight(self.searchTextField.frame))];
        [self.searchButton setImage:[UIImage imageNamed:@"Search"] forState:UIControlStateNormal];
        self.searchButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:self.searchButton];
        
        self.friendsTabelView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(frame) * 0.2, CGRectGetWidth(frame), CGRectGetHeight(frame) * 0.8)];
        [self addSubview:self.friendsTabelView];
        
    }
    return self;
}

@end

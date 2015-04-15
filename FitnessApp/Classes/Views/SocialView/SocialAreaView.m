//
//  SocialAreaView.m
//  Social
//
//  Created by nutc on 2015/3/29.
//  Copyright (c) 2015年 HW. All rights reserved.
//

#import "SocialAreaView.h"

@implementation SocialAreaView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor grayColor];
        
        self.searchButton = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetWidth(frame) * 0.05, CGRectGetHeight(frame) * 0.05, CGRectGetWidth(frame) * 0.1, CGRectGetWidth(frame) * 0.1)];
        [self.searchButton setImage:[UIImage imageNamed:@"Search"] forState:UIControlStateNormal];
        self.searchButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:self.searchButton];
        
        self.searchTextField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetWidth(frame) * 0.17, CGRectGetMinY(self.searchButton.frame), CGRectGetWidth(frame) * 0.3, CGRectGetHeight(self.searchButton.frame))];
        self.searchTextField.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.searchTextField];
//        
        self.allButton = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetWidth(frame) * 0.5, CGRectGetMinY(self.searchButton.frame), CGRectGetWidth(frame) * 0.13, CGRectGetHeight(self.searchButton.frame))];
        self.allButton.titleLabel.font = [UIFont systemFontOfSize:CGRectGetWidth(frame) * 0.06f];
        [self.allButton setTitle:@"All" forState:UIControlStateNormal];
//        self.allButton.backgroundColor = [UIColor blueColor];
        [self addSubview:self.allButton];
        
        self.cuntryButton = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetWidth(frame) * 0.65, CGRectGetMinY(self.searchButton.frame), CGRectGetWidth(frame) * 0.2, CGRectGetHeight(self.searchButton.frame))];
        self.cuntryButton.titleLabel.font = [UIFont systemFontOfSize:CGRectGetWidth(frame) * 0.06f];
//        self.cuntryButton.backgroundColor = [UIColor redColor];
        [self.cuntryButton setTitle:@"Cuntry" forState:UIControlStateNormal];
        [self addSubview:self.cuntryButton];
        
        self.cityButton = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetWidth(frame) * 0.87, CGRectGetMinY(self.searchButton.frame), CGRectGetWidth(frame) * 0.12, CGRectGetHeight(self.searchButton.frame))];
        self.cityButton.titleLabel.font = [UIFont systemFontOfSize:CGRectGetWidth(frame) * 0.06f];
        [self.cityButton setTitle:@"City" forState:UIControlStateNormal];
//        self.cityButton.backgroundColor = [UIColor yellowColor];
        [self addSubview:self.cityButton];
//
        self.areaMemberTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(frame) * 0.2, CGRectGetWidth(frame), CGRectGetHeight(frame) * 0.8)];
        [self addSubview:self.areaMemberTableView];
    }
    return self;
}

@end

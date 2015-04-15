//
//  SocialMyTeamView.m
//  Social
//
//  Created by nutc on 2015/3/27.
//  Copyright (c) 2015年 HW. All rights reserved.
//

#import "SocialMyTeamView.h"

@implementation SocialMyTeamView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor grayColor];
        
        self.teamNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(frame) * 0.05, CGRectGetWidth(frame), CGRectGetHeight(frame) * 0.08)];
        self.teamNameLabel.text = @"AAA";
        self.teamNameLabel.font = [UIFont systemFontOfSize:CGRectGetWidth(frame) * 0.09];
        self.teamNameLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.teamNameLabel];
        
        self.messageTextField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetWidth(frame) * 0.15, CGRectGetHeight(frame) * 0.15, CGRectGetWidth(frame) * 0.7, CGRectGetHeight(frame) * 0.08)];
        self.messageTextField.backgroundColor = [UIColor whiteColor];
        self.messageTextField.font = [UIFont systemFontOfSize:CGRectGetWidth(frame) * 0.09];
        [self addSubview:self.messageTextField];
        
        self.teamMumberTableVew = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(frame) * 0.25, CGRectGetWidth(frame), CGRectGetHeight(frame) * 0.75)];
        [self addSubview:self.teamMumberTableVew];
        
    }
    return self;
}

@end

//
//  SocialController.h
//  Social
//
//  Created by nutc on 2015/3/26.
//  Copyright (c) 2015年 HW. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SocialView.h"

@interface SocialController : UIViewController <UITableViewDataSource>

@property (nonatomic, strong) SocialView *socialView;

- (instancetype)initWithFrame:(CGRect)frame socialPage:(SocialPage)socialPage;

@end

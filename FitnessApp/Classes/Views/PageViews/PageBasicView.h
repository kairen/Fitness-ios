//
//  PageBasicView.h
//  FitnessApp
//
//  Created by KaiRen.Bai on 2015/3/26.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageBasicView : UIView


- (void)setTitleText:(NSString *)text;
- (void)setBackgroundViewColor:(UIColor *)color;

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIView *backgroundView;

@property (nonatomic, strong) UIButton *actionButton;
@property (nonatomic, strong) UIButton *cancelButton;

@end



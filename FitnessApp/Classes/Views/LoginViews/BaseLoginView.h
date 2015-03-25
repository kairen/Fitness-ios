//
//  BaseView.h
//  FitnessApp
//
//  Created by KaiRen.Bai on 2015/3/23.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseLoginView : UIView <UITextFieldDelegate>

- (void)configureTextField:(UITextField *)textField  placeHolder:(NSString *)hoderString leftImage:(NSString *)imageName;
- (void)configureButton:(UIButton *)button title:(NSString *) title fillCollor:(BOOL)fill;

@property (nonatomic, strong) UIImageView *logoImage;
@property(nonatomic) BOOL showLogo;
@end

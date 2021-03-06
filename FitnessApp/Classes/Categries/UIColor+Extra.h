//
//  UIColor+Extra.h
//  FitnessApp
//
//  Created by KaiRen.Bai on 2015/3/23.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extra)

+ (UIColor *)colorWithIntegerRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpah;
+ (UIColor *)colorWithRGBHex:(NSString *)hex alpha:(CGFloat)alpah;

+ (UIColor *)pageBasicBackgroundColor;
+ (UIColor *)pageBlueColor;
+ (UIColor *)pageGrayColor;
+ (UIColor *)pageOrangeColor;
+ (UIColor *)pageYellowColor;
+ (UIColor *)pageRedColor;
+ (UIColor *)pagePurpleColor;
+ (UIColor *)pageGreenColor;
+ (UIColor *)progressBackgroundColor;
+ (NSArray *)gradientBlueColors;
+ (NSArray *)gradientOrangeColors;
@end

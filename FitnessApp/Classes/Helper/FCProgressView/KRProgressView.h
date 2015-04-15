//
//  KRProgressView.h
//  FitnessApp
//
//  Created by KaiRen.Bai on 2015/4/13.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, KRProgressType) {
    KRProgressBarType = 0,
    KRProgressCircleType,
    KRProgressDotType,
    KRProgressSquareType,
};

@interface KRProgressView : UIView

- (instancetype)initWithFrame:(CGRect)frame
                progressType:(KRProgressType)type;

- (void)setIconProgressFullImage:(UIImage *)fullImage emptyImage:(UIImage *)emptyImage;
- (void)refreshProgress;

@property (nonatomic, assign) CGFloat maxValue;
@property (nonatomic, assign) CGFloat progess;

@property (nonatomic, strong) UIColor *progressColor;
@property (nonatomic, strong) UIColor *progressBackgroundColor;

@end

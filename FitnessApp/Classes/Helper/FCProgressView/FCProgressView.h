//
//  FCProgressView.h
//  FCProgressView
//
//  Created by Francis on 2015/3/20.
//  Copyright (c) 2015年 Francis. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ProgressViewType) {
    ProgressBarType = 0,
    ProgressCircleType,
    ProgressDotType,
    ProgressSquareType,
};

typedef NS_ENUM(NSInteger, SquareType) {
    SquareVeryEasyType = 0,
    SquareEasyType,
    SquareNormalType,
    SquareHardType,
    SquareVeryHardType,
};

@protocol FCProgressDelegate;

@interface FCProgressView : UIView

- (instancetype)initWithFrame:(CGRect)frame type:(ProgressViewType)progressType backgroundColor:(UIColor*)color;
- (void)refresh;
- (void)setProgressDuration:(float)duration;

@property (nonatomic, weak) id <FCProgressDelegate> delegate;

@property (nonatomic) CGFloat maxValue;
@property (nonatomic) CGFloat progressValue;
@property (nonatomic, strong) UIColor *progressColor;
@end

@protocol FCProgressDelegate<NSObject>
@required
- (void)progressView:(FCProgressView*)progressView didSelectAtItemType:(SquareType)type;
@end

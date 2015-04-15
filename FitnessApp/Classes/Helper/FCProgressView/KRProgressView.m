//
//  KRProgressView.m
//  FitnessApp
//
//  Created by KaiRen.Bai on 2015/4/13.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "KRProgressView.h"

static NSInteger const kKRProgressDotTag = 0x100;

@interface KRProgressView ()

@property (nonatomic, strong) CAShapeLayer *progressLayer;
@property (nonatomic, strong) UIImage *fullImage;
@property (nonatomic, strong) UIImage *emptyImage;

@property (nonatomic, assign) KRProgressType progressType;
@end

@implementation KRProgressView

- (instancetype)initWithFrame:(CGRect)frame {
    return [self initWithFrame:frame progressType:KRProgressBarType];
}

- (instancetype)initWithFrame:(CGRect)frame progressType:(KRProgressType)type {
    self = [super initWithFrame:frame];
    if(self) {
        self.progressType = type;
        if(type != KRProgressDotType) {
            self.progressLayer = [CAShapeLayer layer];
            self.progressLayer.frame = self.bounds;
            self.progressLayer.backgroundColor = [UIColor colorWithWhite:0.242 alpha:1.000].CGColor;
            self.progressLayer.strokeColor = [UIColor orangeColor].CGColor;
            [self.layer addSublayer:self.progressLayer];
        }
        
        switch (type) {
            case KRProgressBarType: {
                self.progressLayer.masksToBounds = YES;
                self.progressLayer.lineWidth = CGRectGetHeight(self.frame);
                self.progressLayer.cornerRadius = CGRectGetHeight(self.frame) / 2;
                UIBezierPath *path = [UIBezierPath bezierPath];
                [path moveToPoint:CGPointMake(0.0, CGRectGetHeight(self.frame) / 2)];
                [path addLineToPoint:CGPointMake(CGRectGetWidth(self.frame), CGRectGetHeight(self.frame) / 2)];
                self.progressLayer.path = path.CGPath;
                break;
            }
            case KRProgressCircleType: {
                
                break;
            }
            case KRProgressDotType: {
                self.backgroundColor = [UIColor clearColor];
                for (int i = 0; i < 16; i++) {
                    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * CGRectGetWidth(frame) / 16, (CGRectGetHeight(frame) / 2) - ((CGRectGetWidth(frame) / 16 ) / 2), CGRectGetWidth(frame) / 16, CGRectGetWidth(frame) / 16)];
                    imageView.tag = kKRProgressDotTag;
                    [self addSubview:imageView];
                }
                break;
            }
            case KRProgressSquareType: {
                
                break;
            }
        }
    }
    return self;
}

#pragma mark - Setter
- (void)setMaxValue:(CGFloat)maxValue {
    _maxValue = maxValue;
    [self refreshProgress];
}

- (void)setProgess:(CGFloat)progess {
    _progess = progess;
    [self refreshProgress];
}

- (void)setProgressColor:(UIColor *)progressColor {
    _progressColor = progressColor;
    self.progressLayer.strokeColor = progressColor.CGColor;
}

- (void)setProgressBackgroundColor:(UIColor *)progressBackgroundColor{
    _progressBackgroundColor = progressBackgroundColor;
    self.progressLayer.backgroundColor = progressBackgroundColor.CGColor;
}

- (void)setIconProgressFullImage:(UIImage *)fullImage emptyImage:(UIImage *)emptyImage {
    self.emptyImage = emptyImage;
    self.fullImage = fullImage;
    [self refreshImages];
}

#pragma mark - Refresh
- (void)refreshImages {
    int counter = 0;
    for(UIView *imageView in self.subviews) {
        if(imageView.tag == kKRProgressDotTag) {
            if(counter < (16 * (self.progess / self.maxValue))) {
                ((UIImageView *)imageView).image = self.fullImage;
            } else {
                ((UIImageView *)imageView).image = self.emptyImage;
            }
        }
        counter++;
    }
}

- (void)refreshProgress {
    if(self.progressType != KRProgressDotType) {
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        animation.fromValue = @(0.0);
        animation.toValue = @(self.progess / self.maxValue);
        animation.duration = 1.0;
        [self.progressLayer addAnimation:animation forKey:nil];
        self.progressLayer.strokeEnd = self.progess / self.maxValue;
    } else {
        [self refreshImages];
    }
}

@end

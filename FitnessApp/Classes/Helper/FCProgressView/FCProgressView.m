//
//  FCProgressView.m
//  FCProgressView
//
//  Created by Francis on 2015/3/20.
//  Copyright (c) 2015年 Francis. All rights reserved.
//

#import "FCProgressView.h"
#import "Animations.h"

@interface  FCProgressView()

@property (nonatomic, strong) CAShapeLayer *shapeLayer;
@property (nonatomic, strong) CAShapeLayer *progressLayer;
@property (nonatomic, strong) CAShapeLayer *roundLayer;
@property (nonatomic, strong) CAShapeLayer *squareFillLayer;
@property (nonatomic, copy) UIColor *buttonColor;
@property (nonatomic) float duration;
@property (nonatomic) ProgressViewType viewType;

@end

@implementation FCProgressView

- (instancetype)initWithFrame:(CGRect)frame type:(ProgressViewType)progressType backgroundColor:(UIColor*)backgroundColor {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        _viewType = progressType;
        _duration = 2;
        _shapeLayer = [CAShapeLayer layer];
        _shapeLayer.frame = CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame));
        
        _progressLayer = [CAShapeLayer layer];
        _progressLayer.frame = CGRectMake(0, 0, CGRectGetWidth(_shapeLayer.frame), CGRectGetHeight(_shapeLayer.frame));
        switch (progressType) {
            case ProgressBarType : {
                _shapeLayer.path = [UIBezierPath bezierPathWithRoundedRect:_shapeLayer.frame cornerRadius:CGRectGetHeight(frame) / 2].CGPath;
                _shapeLayer.fillColor = backgroundColor.CGColor;
                _progressLayer.lineCap = kCALineCapRound;
                _shapeLayer.strokeColor = [UIColor clearColor].CGColor;
                _progressLayer.lineWidth = CGRectGetHeight(frame);
                _progressLayer.fillColor = [UIColor clearColor].CGColor;
                break;
            } case ProgressCircleType : {
                _shapeLayer.path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(CGRectGetWidth(_shapeLayer.frame) / 2, CGRectGetHeight(_shapeLayer.frame) / 2) radius:(_shapeLayer.frame.size.width) / 2 startAngle:M_PI / 2 endAngle:M_PI * 2 + M_PI / 2 clockwise:YES].CGPath;
                _shapeLayer.strokeColor = backgroundColor.CGColor;
                _shapeLayer.lineWidth = CGRectGetHeight(frame) / 10;
                _shapeLayer.fillColor = [UIColor clearColor].CGColor;
                _progressLayer.lineWidth = CGRectGetHeight(frame) / 10;
                _progressLayer.fillColor = [UIColor clearColor].CGColor;
                break;
            } case ProgressDotType : {
                self.backgroundColor = [UIColor clearColor];
                for (int i = 0; i < 16; i++) {
                    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * CGRectGetWidth(frame) / 16, 0, CGRectGetWidth(frame) / 16, CGRectGetWidth(frame) / 16)];
                    imageView.image = [UIImage imageNamed:@"EmptyImage"];
                    [self addSubview:imageView];
                }
                break;
            } case ProgressSquareType : {
                self.backgroundColor = backgroundColor;
                self.layer.cornerRadius = CGRectGetHeight(frame) / 2;
                _roundLayer = [CAShapeLayer layer];
                _roundLayer.frame = CGRectMake(0, 0, CGRectGetHeight(frame) / 2, CGRectGetHeight(frame) / 2);
                _roundLayer.path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(CGRectGetHeight(frame) / 2, CGRectGetHeight(frame) / 2) radius:CGRectGetHeight(frame) / 2 startAngle:M_PI / 2 endAngle: M_PI * 3 / 2 clockwise:YES].CGPath;
                [self.layer addSublayer:_roundLayer];
                _squareFillLayer = [CAShapeLayer layer];
                _squareFillLayer.strokeColor = [UIColor clearColor].CGColor;
                [self.layer addSublayer:_squareFillLayer];
                for (int i = 0; i < 5; i++) {
                    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetHeight(frame) / 2 + (CGRectGetWidth(frame) - CGRectGetHeight(frame) - 20) * i / 5 + 5 * i, 0, (CGRectGetWidth(frame) - CGRectGetHeight(frame) - 20) / 5, CGRectGetHeight(frame))];
                    [button addTarget:self action:@selector(touchButton:) forControlEvents:UIControlEventTouchUpInside];
                    button.tag = i;
                    [self addSubview:button];
                }
                break;
            }
        }
        if (progressType != ProgressDotType) {
            [self.layer addSublayer:_shapeLayer];
            [self.shapeLayer addSublayer:_progressLayer];
        } else {
            [self.layer addSublayer:_progressLayer];
            [self.layer addSublayer:_shapeLayer];
        }
    }
    return self;
}

- (void)setProgressColor:(UIColor *)progressColor {
    if (_viewType != ProgressSquareType) {
        _progressLayer.strokeColor = progressColor.CGColor;
    } else {
        _buttonColor = progressColor;
        _roundLayer.fillColor = progressColor.CGColor;
        _squareFillLayer.fillColor = progressColor.CGColor;
        [self.subviews[0] setBackgroundColor:_buttonColor];
    }
}

- (void)touchButton:(UIButton*)button {
    _squareFillLayer.path = (button.tag == 4) ? [UIBezierPath bezierPathWithArcCenter:CGPointMake(CGRectGetMaxX(button.frame), CGRectGetMidY(button.frame)) radius:CGRectGetHeight(self.frame) / 2 startAngle:M_PI * 3 / 2 endAngle: M_PI / 2 clockwise:YES].CGPath : nil;
    for (id object in self.subviews) {
        if ([object class] == [UIButton class]) {
            [object setBackgroundColor:[UIColor clearColor]];
        }
    }
    for (int i = 0; i < button.tag; i++) {
        if ([self.subviews[i] class] == [UIButton class]) {
            [self.subviews[i] setBackgroundColor:self.buttonColor];
        }
    }
    [button setBackgroundColor:self.buttonColor];
    if([self.delegate respondsToSelector:@selector(progressView:didSelectAtItemType:)]) {
        [self.delegate progressView:self didSelectAtItemType:button.tag];
    }
}

- (void) refresh {
    [[Animations shareInstance] animationByShapeLayer:_progressLayer duration:self.duration];
}

- (void) setProgressDuration:(float)duration {
    _duration = duration;
}

- (void) setProgressValue:(CGFloat)progressValue {
    _progressValue = progressValue;
    CGFloat percent = self.progressValue / self.maxValue;
    switch (self.viewType) {
        case ProgressBarType: {
            if(percent != 0.0) {
                CGMutablePathRef progressPath = CGPathCreateMutable();
                CGPathMoveToPoint(progressPath, nil, CGRectGetMidY(_shapeLayer.frame), self.height * 0.5);
                CGPathAddLineToPoint(progressPath, nil, self.width * percent, self.height * 0.5);
                _progressLayer.path = progressPath;
            }
            break;
        } case ProgressCircleType: {
            _progressLayer.path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(CGRectGetWidth(_progressLayer.frame) / 2, CGRectGetHeight(_progressLayer.frame) / 2) radius:(_progressLayer.frame.size.width) / 2 startAngle:M_PI * 3 / 2 endAngle:M_PI * 2 * percent + M_PI * 3 / 2 clockwise:YES].CGPath;
            break;
        } case ProgressDotType: {
            for (int i = 0; i < 16; i++) {
                [(UIImageView*)self.subviews[i] setImage:[UIImage imageNamed:@"EmptyImage"]];
            }
            for (int i = 0; i < (16 * percent); i++) {
                [(UIImageView*)self.subviews[i] setImage:[UIImage imageNamed:@"FillImage"]];
            }
            break;
        } case ProgressSquareType: {
            break;
        }
    }
    [[Animations shareInstance] animationByShapeLayer:_progressLayer duration:self.duration];
}

@end

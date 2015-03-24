//
//  Animations.m
//  FCProgressView
//
//  Created by Francis on 2015/3/20.
//  Copyright (c) 2015年 Francis. All rights reserved.
//

#import "Animations.h"

@implementation Animations

+ (Animations*) shareInstance {
    static Animations *animations = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        animations = [[Animations alloc] init];
    });
    return animations;
}

- (void) animationByShapeLayer:(CAShapeLayer*)shapeLayer duration:(float)duration {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration = duration;
    animation.fromValue = @0;
    animation.toValue = @1;
    [shapeLayer addAnimation:animation forKey:@"customStroke"];
    shapeLayer.strokeEnd = 1;
}

@end

//
//  Animations.h
//  FCProgressView
//
//  Created by Francis on 2015/3/20.
//  Copyright (c) 2015年 Francis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Animations : NSObject

+ (Animations*) shareInstance;
- (void) animationByShapeLayer:(CAShapeLayer*)shapeLayer duration:(float)duration;

@end

//
//  UIView+Layout.m
//  FitnessApp
//
//  Created by KaiRen.Bai on 2015/3/23.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "UIView+Layout.h"

@implementation UIView (Layout)

- (CGFloat)minX {
    return CGRectGetMinX(self.frame);
}

- (CGFloat)minY {
    return CGRectGetMinY(self.frame);
}

- (CGFloat)midX {
    return CGRectGetMidX(self.frame);
}

- (CGFloat)midY {
    return CGRectGetMidY(self.frame);
}

- (CGFloat)maxX {
    return CGRectGetMaxX(self.frame);
}

- (CGFloat)maxY {
    return CGRectGetMaxY(self.frame);
}

- (CGFloat)width {
    return CGRectGetWidth(self.frame);
}

- (CGFloat)height {
    return CGRectGetHeight(self.frame);
}

- (CGSize)size {
    return self.frame.size;
}

- (KeyboardDevice) getKeyboardDevice {
    CGRect frame = [UIScreen mainScreen].bounds;
    if(CGRectGetHeight(frame) <= 568) {
        return KeyboardiPhone5;
    } else if(CGRectGetHeight(frame) >= 568 && CGRectGetHeight(frame) <= 667) {
        return KeyboardiPhone6;
    }
    return KeyboardiPhonePlus;
}

@end

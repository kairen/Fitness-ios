//
//  UICalendarCell.m
//  CalendarDemo
//
//  Created by Wu~ on 2014/9/28.
//  Copyright (c) 2014年 Wu. All rights reserved.
//

#import "UICalendarCell.h"

@interface UICalendarCell ()

@property (nonatomic, strong) UIImageView *singleImage;
@property (nonatomic, strong) UIImageView *socialImage;

@end

@implementation UICalendarCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 5, self.bounds.size.width, self.bounds.size.height * 0.25)];
        self.dateLabel.backgroundColor = [UIColor clearColor];
        self.dateLabel.font = [UIFont systemFontOfSize:12];
        self.dateLabel.textAlignment = NSTextAlignmentCenter;
        self.dateLabel.adjustsFontSizeToFitWidth = YES;
        [self addSubview:self.dateLabel];
        
        float iconSize = CGRectGetWidth(self.dateLabel.frame) / 8;

        UIImage *image = [UIImage imageNamed:@"triangle.png"];
        CGRect rect = CGRectMake(0, 0, 50, 50);
        UIGraphicsBeginImageContext(rect.size);
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextClipToMask(context, rect, image.CGImage);
        CGContextSetFillColorWithColor(context, [[UIColor yellowColor] CGColor]);
        CGContextFillRect(context, rect);
        UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        UIImage *yellowImage = [UIImage imageWithCGImage:img.CGImage
                                                    scale:1.0 orientation: UIImageOrientationDownMirrored];
        self.singleImage = [[UIImageView alloc] initWithImage:yellowImage];
        self.singleImage.frame = CGRectMake(CGRectGetWidth(frame) / 2 - iconSize - 1, CGRectGetMaxY(self.dateLabel.frame) + 5, iconSize, iconSize);
        self.singleImage.layer.cornerRadius = CGRectGetHeight(self.singleImage.frame) / 2;
        self.singleImage.layer.masksToBounds = YES;
        [self addSubview:self.singleImage];
        
        UIImage *image1 = [UIImage imageNamed:@"triangle.png"];
        CGRect rect1 = CGRectMake(0, 0, 50, 50);
        UIGraphicsBeginImageContext(rect1.size);
        CGContextRef context1 = UIGraphicsGetCurrentContext();
        CGContextClipToMask(context1, rect1, image1.CGImage);
        CGContextSetFillColorWithColor(context1, [[UIColor orangeColor] CGColor]);
        CGContextFillRect(context1, rect1);
        UIImage *img1 = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        UIImage *orangeImage = [UIImage imageWithCGImage:img1.CGImage
                                                    scale:1.0 orientation: UIImageOrientationDownMirrored];
        self.socialImage = [[UIImageView alloc] initWithImage:orangeImage];
        self.socialImage.frame = CGRectMake(CGRectGetMaxX(self.singleImage.frame) + 2, CGRectGetMaxY(self.dateLabel.frame) + 5, iconSize, iconSize);
        self.socialImage.layer.cornerRadius = CGRectGetHeight(self.socialImage.frame) / 2;
        self.socialImage.layer.masksToBounds = YES;
        [self addSubview:self.socialImage];
        
        [self configureDefaultImage];
        
    }
    return self;
}

-(void) configureDefaultImage {
    self.singleImage.hidden = YES;
    self.socialImage.hidden = YES;
}

-(void) setCalendarType:(UICalendarType)calendarType {
    _calendarType = calendarType ;
    if (calendarType == 0) {
        [self configureDefaultImage];
    } else if (calendarType & UICalendarSingle) {
        self.singleImage.hidden = NO;
    } else if (calendarType & UICalendarSocial) {
        self.socialImage.hidden = NO;
    }
}

@end

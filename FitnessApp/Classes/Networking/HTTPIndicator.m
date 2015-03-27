//
//  HTTPIndicator.m
//  FitnessApp
//
//  Created by KaiRen.Bai on 2015/3/25.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "HTTPIndicator.h"

@implementation HTTPIndicator

+ (HTTPIndicator *)indicator {
    static id httpIndicator = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        httpIndicator = [[HTTPIndicator alloc] initWithFrame:[UIScreen mainScreen].bounds];
    });
    return httpIndicator;
}


- (void)startActivity {
    
}

- (void)stopActivity {
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

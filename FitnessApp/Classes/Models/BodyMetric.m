//
//  BodyMetric.m
//  FitnessApp
//
//  Created by KaiRen.Bai on 2015/3/27.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "BodyMetric.h"

@implementation BodyMetric

+ (JSONKeyMapper*)keyMapper {
    NSDictionary *mapper = @{@"id":@"body_metric_id",
                             @"record_time":@"recordTime",
                             @"height":@"height",
                             @"weight":@"weight"};
    
    return [[JSONKeyMapper alloc] initWithDictionary:mapper];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.body_metric_id = @(-1);
        self.user = nil;
        self.recordTime = [[NSDate alloc] init];
        self.height = @(0.0f);
        self.weight = @(0.0f);
        self.isSynchronized = @(NO);
    }
    return self;
}

@end

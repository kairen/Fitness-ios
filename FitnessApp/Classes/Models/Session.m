//
//  Session.m
//  FitnessApp
//
//  Created by KaiRen.Bai on 2015/3/27.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "Session.h"

@implementation Session

+ (JSONKeyMapper*)keyMapper {
    NSDictionary *mapper = @{@"id":@"session_id",
                             @"exercise_type":@"exercise_type",
                             @"session_type":@"session_type",
                             @"start_time":@"start_time",
                             @"end_time":@"end_time"};
    
    return [[JSONKeyMapper alloc] initWithDictionary:mapper];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.session_id = @(-1);
        self.user = nil;
        self.exercise_type = @(SessionExerciseWalking);
        self.session_type = @(SessionTypeRecord);
        self.start_time = [[NSDate alloc] init];
        self.end_time = [[NSDate alloc] init];
        self.isSynchronized = @(NO);
    }
    return self;
}

@end

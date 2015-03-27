//
//  Session.h
//  FitnessApp
//
//  Created by KaiRen.Bai on 2015/3/27.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "JSONModel.h"


typedef NS_ENUM(NSInteger, SessionExerciseType) {
    SessionExerciseWalking = 0,
};

typedef NS_ENUM(NSInteger, SessionType) {
    SessionTypeCumulative = 0,
    SessionTypeActivity,
    SessionTypeRecord
};


@class User;

@interface Session : JSONModel

@property (nonatomic, strong) NSNumber *session_id;
@property (nonatomic, strong) User<Ignore>* user;
@property (nonatomic, strong) NSNumber *exercise_type;
@property (nonatomic, strong) NSNumber *session_type;
@property (nonatomic, strong) NSDate *start_time;
@property (nonatomic, strong) NSDate *end_time;
@property (nonatomic, strong) NSNumber<Ignore>* isSynchronized;

@end
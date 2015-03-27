//
//  ExerciseData.h
//  FitnessApp
//
//  Created by KaiRen.Bai on 2015/3/27.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "JSONModel.h"

typedef enum DataSourceEnum : NSUInteger {
    DATA_SOURCE_PEDOMETER
} enumDataSource;

@class Session;

@interface ExerciseData : NSObject

@property (nonatomic, strong) NSNumber *exercise_data_id;
@property (nonatomic, strong) Session *session;
@property (nonatomic, strong) NSNumber *data_source;
@property (nonatomic, strong) NSData *data;

@end
//
//  BodyMetric.h
//  FitnessApp
//
//  Created by KaiRen.Bai on 2015/3/27.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "JSONModel.h"

@class User;

@interface BodyMetric : JSONModel


@property (nonatomic, assign) NSNumber *body_metric_id;
@property (nonatomic, strong) User<Ignore> *user;
@property (nonatomic, strong) NSDate *recordTime;
@property (nonatomic, strong) NSNumber *height;
@property (nonatomic, strong) NSNumber *weight;
@property (nonatomic, strong) NSNumber<Ignore> *isSynchronized;

@end

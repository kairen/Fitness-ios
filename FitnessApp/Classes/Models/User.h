//
//  User.h
//  FitnessApp
//
//  Created by KaiRen.Bai on 2015/3/25.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "JSONModel.h"

typedef NS_ENUM(NSInteger, UserGenderType) {
    UserGenderNone = -1,
    UserGenderMale = 0,
    UserGenderFemale = 1
};

@interface User : JSONModel

@property (nonatomic, strong) NSNumber *userID;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *nickName;
@property (nonatomic, strong) NSNumber *gender;
@property (nonatomic, strong) NSString *platform;
@property (nonatomic, strong) NSString *platformID;
@property (nonatomic, strong) NSString *token;

@end

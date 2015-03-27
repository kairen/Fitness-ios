//
//  User.m
//  FitnessApp
//
//  Created by KaiRen.Bai on 2015/3/25.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "User.h"

@implementation User

- (instancetype)init {
    self = [super init];
    if (self) {
        self.userID =  @(-1);
        self.email = @"null";
        self.userName = @"null";
        self.nickName = @"null";
        self.gender = @(UserGenderNone);
        self.platform = @"null";
        self.platformID = @"null";
        self.token = @"null";
    }
    return self;
}

@end

//
//  HTTPRequestError.h
//  FitnessApp
//
//  Created by KaiRen.Bai on 2015/3/25.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, HTTPErrorCode) {
    HTTPServerError = -1,
    HTTPNotAuthError = -2,
    HTTPUserInfoEmptyError = -3,
    HTTPUserInfoIncorrectError =  -4
};

extern NSString * HTTPRequestDomain;

@interface HTTPStatuCode : NSObject

+ (NSError *)errorWithStatusCode:(HTTPErrorCode)errorCode;
@end

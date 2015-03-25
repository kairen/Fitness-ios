//
//  HTTPRequestError.m
//  FitnessApp
//
//  Created by KaiRen.Bai on 2015/3/25.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "HTTPStatuCode.h"

NSString * HTTPRequestDomain = @"FitnessNetError";

@implementation HTTPStatuCode

+ (NSError *)errorWithStatusCode:(HTTPErrorCode)errorCode {
    switch (errorCode) {
        case HTTPServerError: {
            return [NSError errorWithDomain:HTTPRequestDomain code:errorCode userInfo:@{NSLocalizedDescriptionKey:@"Server error."}];
        } break;
        case HTTPNotAuthError: {
            return [NSError errorWithDomain:HTTPRequestDomain code:errorCode userInfo:@{NSLocalizedDescriptionKey:@"Not authenticated to perform the action."}];
        } break;
        case HTTPUserInfoEmptyError: {
            return [NSError errorWithDomain:HTTPRequestDomain code:errorCode userInfo:@{NSLocalizedDescriptionKey:@"Email or Password is empty."}];
        } break;
        case HTTPUserInfoIncorrectError: {
            return [NSError errorWithDomain:HTTPRequestDomain code:errorCode userInfo:@{NSLocalizedDescriptionKey:@"Incorrect email or password."}];
        } break;
    }
    return  nil;
}

@end

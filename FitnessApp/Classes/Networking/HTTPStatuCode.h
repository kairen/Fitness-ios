//
//  HTTPRequestError.h
//  FitnessApp
//
//  Created by KaiRen.Bai on 2015/3/25.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, HTTPErrorFormats) {
    HTTPErrorFormatFacebook = 0,
    HTTPErrorFormatLogin,
    HTTPErrorFormatRegister,
    HTTPErrorFormatChallenge
};

typedef NS_ENUM(NSInteger, HTTPUniversalError) {
    HTTPUniversalServerError = -1,
    HTTPUniversalNotAuthError = -2
};

typedef NS_ENUM(NSInteger, HTTPLoginError) {
    HTTPLoginEmptyError = -3,
    HTTPLoginIncorrectError = -4,
};

typedef NS_ENUM(NSInteger, HTTPRegisterError) {
    HTTPRegisterEmptyError = -3,
    HTTPRegisterPasswdError = -4,
    HTTPRegisterAlreadError = -5
};

typedef NS_ENUM(NSInteger, HTTPFacebookError) {
    HTTPFacebookTokenError = -3,
    HTTPFacebookIDError = -4,
    HTTPFacebookUserNameError = -5
};

typedef NS_ENUM(NSInteger, HTTPChallengeError) {
    HTTPChallengeNotAfterStartTimeError = -4,
    HTTPChallengeEndTimePastError = -5,
    HTTPChallengeGoalValueError = -6
};

extern NSString * HTTPRequestDomain;

@interface HTTPStatuCode : NSObject

+ (NSError *)errorWithFormat:(HTTPErrorFormats)format statusCode:(NSInteger)code;
@end

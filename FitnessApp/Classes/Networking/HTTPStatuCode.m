//
//  HTTPRequestError.m
//  FitnessApp
//
//  Created by KaiRen.Bai on 2015/3/25.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "HTTPStatuCode.h"

NSString * HTTPRequestDomain = @"FitnessNetworkError";

@implementation HTTPStatuCode

+ (NSError *)errorWithFormat:(HTTPErrorFormats)format statusCode:(NSInteger)code {
    switch (code) {
        case HTTPUniversalServerError: {
            return [NSError errorWithDomain:HTTPRequestDomain code:code userInfo:@{NSLocalizedDescriptionKey:@"Server error."}];
        } break;
        case HTTPUniversalNotAuthError: {
            return [NSError errorWithDomain:HTTPRequestDomain code:code userInfo:@{NSLocalizedDescriptionKey:@"Not authenticated to perform the action."}];
        } break;
        default: {
            /**
             *   Mapping some error
             */
            switch (format) {
                case HTTPErrorFormatFacebook: {
                    return [HTTPStatuCode facebookLoginErrorWithCode:code];
                } break;
                case HTTPErrorFormatLogin: {
                    return [HTTPStatuCode accountLoginErrorWithCode:code];
                } break;
                case HTTPErrorFormatRegister: {
                    return [HTTPStatuCode accountRegisterErrorWithCode:code];
                } break;
                case HTTPErrorFormatChallenge: {
                    return [HTTPStatuCode accountRegisterErrorWithCode:code];
                } break;
            }
        }
    }
    return  nil;
}

/**
 *  Facebook Login Error
 *
 *  @param code Is a status code.
 *
 *  @return mapping error for status code.
 */
+ (NSError *)facebookLoginErrorWithCode:(HTTPFacebookError)code {
    switch (code) {
        case HTTPFacebookUserNameError: {
            return [NSError errorWithDomain:HTTPRequestDomain code:code userInfo:@{NSLocalizedDescriptionKey:@"invalid username."}];
        } break;
        case HTTPFacebookEmptyUserError: {
            return [NSError errorWithDomain:HTTPRequestDomain code:code userInfo:@{NSLocalizedDescriptionKey:@"user does not exist, please set username."}];
        } break;
    }
    return nil;
}

/**
 *  Account Login Error
 *
 *  @param code Is a status code.
 *
 *  @return mapping error for status code.
 */
+ (NSError *)accountLoginErrorWithCode:(HTTPLoginError)code  {
    switch (code) {
        case HTTPLoginEmptyError: {
            return [NSError errorWithDomain:HTTPRequestDomain code:code userInfo:@{NSLocalizedDescriptionKey:@"email or password is empty."}];
        } break;
        case HTTPLoginIncorrectError: {
            return [NSError errorWithDomain:HTTPRequestDomain code:code userInfo:@{NSLocalizedDescriptionKey:@"incorrect email or password."}];
        } break;
    }
    return nil;
}

/**
 *  Register Error
 *
 *  @param code  Is a status code.
 *
 *  @return mapping error for status code.
 */
+ (NSError *)accountRegisterErrorWithCode:(HTTPRegisterError)code  {
    switch (code) {
        case HTTPRegisterEmptyError: {
            return [NSError errorWithDomain:HTTPRequestDomain code:code userInfo:@{NSLocalizedDescriptionKey:@"email or password is empty."}];
        } break;
        case HTTPRegisterPasswdError: {
            return [NSError errorWithDomain:HTTPRequestDomain code:code userInfo:@{NSLocalizedDescriptionKey:@"password must be > 4 <= 16."}];
        } break;
        case HTTPRegisterAlreadError: {
            return [NSError errorWithDomain:HTTPRequestDomain code:code userInfo:@{NSLocalizedDescriptionKey:@"user email already registered."}];
        } break;
    }
    return nil;
}

/**
 *  Challenge Error
 *
 *  @param code Is a status code.
 *
 *  @return mapping error for status code.
 */
+ (NSError *)createChallengeErrorWithCode:(HTTPChallengeError)code  {
    switch (code) {
        case HTTPChallengeNotAfterStartTimeError: {
            return [NSError errorWithDomain:HTTPRequestDomain code:code userInfo:@{NSLocalizedDescriptionKey:@"endTime is not after startTime."}];
        } break;
        case HTTPChallengeEndTimePastError: {
            return [NSError errorWithDomain:HTTPRequestDomain code:code userInfo:@{NSLocalizedDescriptionKey:@"endTime is in the past."}];
        } break;
        case HTTPChallengeGoalValueError: {
            return [NSError errorWithDomain:HTTPRequestDomain code:code userInfo:@{NSLocalizedDescriptionKey:@"goal value must be greater than 0."}];
        } break;
    }
    return nil;
}
@end

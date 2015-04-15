//
//  HTTPClient.m
//  AFTest
//
//  Created by nutc on 2015/3/22.
//  Copyright (c) 2015年 HW. All rights reserved.
//

#import "HTTPClient.h"
#import "HTTPStatuCode.h"
#import "HTTPParameterKeys.h"
#import "SVProgressHUD.h"

static NSTimeInterval const HTTPRequestTimeout = 5;
static NSString * const HTTPAlertViewTitle = @"HTTP Status";

@implementation HTTPClient

+ (HTTPClient *)shareInstance {
    static HTTPClient *sharedHTTPClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedHTTPClient = [[HTTPClient alloc] initWithBaseURL:[NSURL URLWithString:HTTPServerURLString]];
    });
    return sharedHTTPClient;
}

- (instancetype)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (self) {
        NSLog(@"%@",url);
        self.responseSerializer = [AFJSONResponseSerializer serializer];
        self.requestSerializer = [AFJSONRequestSerializer serializer];
        self.requestSerializer.timeoutInterval = HTTPRequestTimeout;
    }
    return self;
}

- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message {
    [SVProgressHUD showErrorWithStatus:@"Error ..."];
    [SVProgressHUD dismiss];
    UIAlertView *messageAlert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"cancel" otherButtonTitles:nil, nil];
    [messageAlert show];
}

- (BOOL)checkSuccessWithFormat:(HTTPErrorFormats)format response:(id)response {
    NSInteger statusCode = [response[HTTPResultKey] integerValue];
    [SVProgressHUD dismiss];
    NSError *error = [HTTPStatuCode errorWithFormat:format statusCode:statusCode];
    if(error) {
        [self showAlertWithTitle:HTTPAlertViewTitle message:error.localizedDescription];
    }
    return (error == nil);
}

/**
 *  Request Factory Method
 *
 *  @param url        Is request url.
 *  @param method     Is HTTP GET/POST/PUT/DELETE.
 *  @param parameters Is user infos.
 *  @param success    Is success call func block.
 */
- (void)requestURL:(NSString *)url method:(HTTPRequestMethod)method parameters:(id)parameters success:(HTTPSuccessBlock)success {
    
    typeof(self) __weak weakSelf = self;
    [SVProgressHUD show];
    [SVProgressHUD showWithStatus:@"Loading ..." maskType:SVProgressHUDMaskTypeBlack];
    switch (method) {
        case HTTPRequestGET: {
            [self GET:url parameters:parameters success:success failure:^(NSURLSessionDataTask *task, NSError *error) {
                [weakSelf showAlertWithTitle:HTTPAlertViewTitle message:error.localizedDescription];
            }];
        } break;
        case HTTPRequestPOST: {
            [self POST:url parameters:parameters success:success failure:^(NSURLSessionDataTask *task, NSError *error) {
                [weakSelf showAlertWithTitle:HTTPAlertViewTitle message:error.localizedDescription];
            }];
        } break;
        case HTTPRequestPUT: {
            [self PUT:url parameters:parameters success:success failure:^(NSURLSessionDataTask *task, NSError *error) {
                [weakSelf showAlertWithTitle:HTTPAlertViewTitle message:error.localizedDescription];
            }];
        } break;
        case HTTPRequestDelete: {
            [self DELETE:url parameters:parameters success:success failure:^(NSURLSessionDataTask *task, NSError *error) {
                [weakSelf showAlertWithTitle:HTTPAlertViewTitle message:error.localizedDescription];
            }];
        } break;
    }
}

/**
 *  Login with facebook
 *
 *  @param token    Is facebook access token.
 *  @param userName Is facebook user name.
 */
- (void)loginFacebookWithToken:(NSString *)token userName:(NSString *)userName {
    typeof(self) __weak weakSelf = self;
    NSDictionary *userInfo = @{FBUserNameKey:userName,
                               FBPlatformKey:@"facebook",
                               FBTokenKey:token};
    
    [self requestURL:HTTPLoginWithFacebookURLString method:HTTPRequestPOST parameters:userInfo success:^(NSURLSessionDataTask *task, id response) {
        BOOL succes = [weakSelf checkSuccessWithFormat:HTTPErrorFormatFacebook response:response];
        if([weakSelf.delegate respondsToSelector:@selector(httpRequestLoginResult:)] && succes) {
            [weakSelf.delegate httpRequestLoginResult:response];
        }
    }];
}

/**
 *  Login with user info
 *
 *  @param userName Is login user name.
 *  @param passwd   Is login password.
 */
- (void)loginWithUserName:(NSString *)userName passwd:(NSString *)passwd {
    typeof(self) __weak weakSelf = self;
    NSDictionary *userInfo = @{AccountUserNameKey:userName,
                               AccountPasswdKey:passwd};
    
    [self requestURL:HTTPLoginWithUserInfoURLString method:HTTPRequestPOST parameters:userInfo success:^(NSURLSessionDataTask *task, id response) {
        BOOL succes = [weakSelf checkSuccessWithFormat:HTTPErrorFormatLogin response:response];
        if([weakSelf.delegate respondsToSelector:@selector(httpRequestLoginResult:)] && succes) {
            [weakSelf.delegate httpRequestLoginResult:response];
        }
    }];
}

/**
 *  Register user
 *
 *  @param userInfo Is a post info.
 */
- (void)registerWithUserInfo:(NSDictionary *)userInfo {
    typeof(self) __weak weakSelf = self;
    
    [self requestURL:HTTPRegisterWithUserInfoURLString method:HTTPRequestGET parameters:userInfo success:^(NSURLSessionDataTask *task, id response) {
         BOOL succes = [weakSelf checkSuccessWithFormat:HTTPErrorFormatRegister response:response];
        if([weakSelf.delegate respondsToSelector:@selector(httpRequestRegisterResult:)] && succes) {
            [weakSelf.delegate httpRequestRegisterResult:response];
        }
    }];
}

/**
 *  Post height and height
 *
 *  @param weight Is a user weight.
 *  @param height Is a user Height.
 */
- (void)postUserBodyWeight:(CGFloat)weight andHeight:(CGFloat)height {
    typeof(self) __weak weakSelf = self;
    NSDictionary *bodyInfo = @{BodyWeightKey:@(weight),
                               BodyHeightKey:@(height)};
    
    [self requestURL:HTTPPostBodyMetricURLString method:HTTPRequestPOST parameters:bodyInfo success:^(NSURLSessionDataTask *task, id response) {
        BOOL succes = [weakSelf checkSuccessWithFormat:0 response:response];
        if([weakSelf.delegate respondsToSelector:@selector(httpRequestUserBodyResult:)] && succes) {
            [weakSelf.delegate httpRequestUserBodyResult:response];
        }
    }];
}

/**
 *  Get user body meteric with unix timestamp
 *
 *  @param greaterTime Is a greater than or qual timestamp.
 *  @param lessTime    Is a less than timestamp.
 */
- (void)getUserBodyMetericWithGreaterThanTimestamp:(NSTimeInterval)greaterTime
                              LessThanTimestamp:(NSTimeInterval)lessTime {
    typeof(self) __weak weakSelf = self;
    [self requestURL:HTTPGetBodyMetricURLString method:HTTPRequestPOST parameters:nil success:^(NSURLSessionDataTask *task, id response) {
        BOOL succes = [weakSelf checkSuccessWithFormat:0 response:response];
        if([weakSelf.delegate respondsToSelector:@selector(httpRequestUserBodyResult:)] && succes) {
            [weakSelf.delegate httpRequestUserBodyResult:response];
        }
    }];
}


/**
 *  Create session with info
 *
 *  @param sessionInfo Is a session info.
 */
- (void)createSessionWithSessionInfo:(NSDictionary *)sessionInfo {
    typeof(self) __weak weakSelf = self;
    [self requestURL:HTTPSessionCreateURLString method:HTTPRequestPOST parameters:sessionInfo success:^(NSURLSessionDataTask *task, id responseObject) {
        BOOL succes = [weakSelf checkSuccessWithFormat:0 response:responseObject];
        if(succes) {
            
        }
    }];
}


- (void)getDailyRecommendedCaloriesCompletation:(HTTPResponseBlock)complete {
    typeof(self) __weak weakSelf = self;
    [self requestURL:HTTPGetDailyRecommendedCaloriesURLString method:HTTPRequestPOST parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
         BOOL succes = [weakSelf checkSuccessWithFormat:0 response:responseObject];
        if(succes && complete) {
            complete(responseObject);
        }
    }];
}

- (void)getDailyRecommendedWonderPointsCompletation:(HTTPResponseBlock)complete {
    typeof(self) __weak weakSelf = self;
    [self requestURL:HTTPGetDailyRecommendedWonderPointsURLString method:HTTPRequestPOST parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        BOOL succes = [weakSelf checkSuccessWithFormat:0 response:responseObject];
        if(succes && complete) {
            complete(responseObject);
        }
    }];
}

@end

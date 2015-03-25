//
//  HTTPClient.m
//  AFTest
//
//  Created by nutc on 2015/3/22.
//  Copyright (c) 2015年 HW. All rights reserved.
//

#import "HTTPClient.h"
#import "HTTPStatuCode.h"
#import "HTTPIndicator.h"

static NSString * const FBUserNameKey = @"userName";
static NSString * const FBPlatformKey = @"platformType";
static NSString * const FBTokenKey = @"token";

static NSString * const AccountUserNameKey = @"userName";
static NSString * const AccountPasswdKey = @"password";

static NSString * const BodyWeightKey = @"weight";
static NSString * const BodyHeightKey = @"height";

static NSString * const HTTPResultKey = @"result";

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
        self.responseSerializer = [AFJSONResponseSerializer serializer];
        self.requestSerializer = [AFJSONRequestSerializer serializer];
        self.requestSerializer.timeoutInterval = HTTPRequestTimeout;
    }
    return self;
}

- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message {
    UIAlertView *messageAlert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"cancel" otherButtonTitles:nil, nil];
    [messageAlert show];
}

- (BOOL)checkFailedWithResponse:(id)resposeObject {
    HTTPErrorCode statusCode = [resposeObject[HTTPResultKey] integerValue];
    NSError *error = [HTTPStatuCode errorWithStatusCode:statusCode];
    [self showAlertWithTitle:HTTPAlertViewTitle message:error.localizedDescription];
    return !error;
}

/**
 *  Request Factory Method
 *
 *  @param url        Is request url.
 *  @param method     Is HTTP GET/POST.
 *  @param parameters Is user infos.
 *  @param success    Is success call func block.
 */
- (void)requestURL:(NSString *)url method:(HTTPRequestMethod)method parameters:(id)parameters success:(HTTPRequestSuccess)success {
    
    typeof(self) __weak weakSelf = self;
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
    }
}

/**
 *  Login With Facebook
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
        BOOL failed = [weakSelf checkFailedWithResponse:response];
        if([weakSelf.delegate respondsToSelector:@selector(httpRequestLoginResult:)] && !failed) {
            [weakSelf.delegate httpRequestRegisterResult:response];
        }
    }];
}

/**
 *  Register User
 *
 *  @param userInfo Is a post info.
 */
- (void)registerWithUserInfo:(NSDictionary *)userInfo {
    typeof(self) __weak weakSelf = self;
    
    [self requestURL:HTTPRegisterWithUserInfoURLString method:HTTPRequestGET parameters:userInfo success:^(NSURLSessionDataTask *task, id response) {
         BOOL failed = [weakSelf checkFailedWithResponse:response];
        if([weakSelf.delegate respondsToSelector:@selector(httpRequestRegisterResult:)] && !failed) {
            [weakSelf.delegate httpRequestRegisterResult:response];
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
        BOOL failed = [weakSelf checkFailedWithResponse:response];
        if([weakSelf.delegate respondsToSelector:@selector(httpRequestLoginResult:)] && !failed) {
            [weakSelf.delegate httpRequestRegisterResult:response];
        }
    }];
}

/**
 *  Post Weight and Height
 *
 *  @param weight Is a user weight
 *  @param height Is a user Height
 */
- (void)postUserBodyWeight:(CGFloat)weight andHeight:(CGFloat)height {
    typeof(self) __weak weakSelf = self;
    NSDictionary *bodyInfo = @{BodyWeightKey:@(weight),
                               BodyHeightKey:@(height)};
    
    [self requestURL:HTTPPostBodyMetricURLString method:HTTPRequestPOST parameters:bodyInfo success:^(NSURLSessionDataTask *task, id response) {
        BOOL failed = [weakSelf checkFailedWithResponse:response];
        if([weakSelf.delegate respondsToSelector:@selector(httpRequestUserBodyResult:)] && !failed) {
            [weakSelf.delegate httpRequestUserBodyResult:response];
        }
    }];
}

@end

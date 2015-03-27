//
//  HTTPClient.h
//  AFTest
//
//  Created by nutc on 2015/3/22.
//  Copyright (c) 2015年 HW. All rights reserved.
//

#import "AFNetworking.h"
#import "HTTPIncludes.h"



typedef NS_ENUM(NSInteger, HTTPRequestMethod) {
    HTTPRequestGET = 0,
    HTTPRequestPOST,
    HTTPRequestPUT,
    HTTPRequestDelete
};

typedef void(^HTTPSuccessBlock)(NSURLSessionDataTask *task, id responseObject);

@protocol HTTPClientDelegate;

@interface HTTPClient : AFHTTPSessionManager

+ (HTTPClient *)shareInstance;

- (void)registerWithUserInfo:(NSDictionary *)userInfo;
- (void)loginWithUserName:(NSString *)userName passwd:(NSString *)passwd;
- (void)loginFacebookWithToken:(NSString *)token userName:(NSString *)userName;

- (void)postUserBodyWeight:(CGFloat)weight andHeight:(CGFloat)height;
- (void)getUserBodyMetericWithGreaterThanTimestamp:(NSTimeInterval)greaterTime
                                 LessThanTimestamp:(NSTimeInterval)lessTime;

- (void)createSessionWithSessionInfo:(NSDictionary *)sessionInfo;

@property (nonatomic, weak) id<HTTPClientDelegate> delegate;
@end

@protocol HTTPClientDelegate <NSObject>
@optional
- (void)httpRequestRegisterResult:(id)resultObject;
- (void)httpRequestLoginResult:(id)resultObject;
- (void)httpRequestUserBodyResult:(id)resultObject;
@end
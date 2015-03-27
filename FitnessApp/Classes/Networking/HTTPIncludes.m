//
//  HTTPIncludes.m
//  FitnessApp
//
//  Created by KaiRen.Bai on 2015/3/24.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "HTTPIncludes.h"


#define HTTP_LOCAL_MODE 0
#if (HTTP_LOCAL_MODE)

NSString * HTTPServerURLString = @"http://192.168.1.99:8081";

#else

NSString * HTTPServerURLString = @"http://wondercore.herokuapp.com";

#endif


/**
 *  User Login and Register
 */
NSString * HTTPRegisterWithUserInfoURLString = @"/api/user/create"; // post
NSString * HTTPLoginWithUserInfoURLString = @"/api/user/login"; // post
NSString * HTTPLoginWithFacebookURLString = @"/api/user/auth"; // post
NSString * HTTPLogoutAccountURLString = @"/api/user/logout";// post

NSString * HTTPPostBodyMetricURLString = @"/api/bodymetric"; // post
NSString * HTTPGetBodyMetricURLString = @"/api/bodymetric/find"; // post
NSString * HTTPSessionCreateURLString = @"/api/exercisesession"; // post
NSString * HTTPSessionUpdateURLString = @"/api/exercisesessiondata"; // post

/**
 *  Users List
 */
NSString * HTTPGetUserListURLString = @"/api/user/find";// post

/**
 *  Challenge
 */
NSString * HTTPChallengeCreateURLString = @"/api/challenge"; // post
NSString * HTTPChallengeMultiplayerURLString = @"/api/challenge/:id"; // put
NSString * HTTPChallengeTeamURLString = @"/api/challenge/:id"; // put
NSString * HTTPChallengeGetInvitedListURLString = @"/api/challenge/find"; // post
NSString * HTTPChallengeGetOngoingListURLString = @"/api/challenge/find"; // post
NSString * HTTPChallengeGetRankingsURLString = @"/api/challengeresult/find"; // post

/**
 *  Query exercise sessions
 */
NSString * HTTPQueryExerciseSessionURLString = @"/api/exercisesession/find"; // post




//
//  HTTPIncludes.h
//  FitnessApp
//
//  Created by KaiRen.Bai on 2015/3/24.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import <Foundation/Foundation.h>


extern NSString * HTTPServerURLString;

/**
 *  User Authentication
 */
extern NSString * HTTPRegisterWithUserInfoURLString;
extern NSString * HTTPLoginWithUserInfoURLString;
extern NSString * HTTPLogoutAccountURLString;
extern NSString * HTTPLoginWithFacebookURLString;

/**
 *  Users Model
 */
extern NSString * HTTPGetDailyRecommendedCaloriesURLString;
extern NSString * HTTPGetDailyRecommendedWonderPointsURLString;
extern NSString * HTTPGetTodayScreenSummaryURLString;
extern NSString * HTTPGetTodayScreenOverviewURLString;

extern NSString * HTTPGetUserListURLString;

/**
 *  BodyMetric
 */
extern NSString * HTTPPostBodyMetricURLString;
extern NSString * HTTPGetBodyMetricURLString;

/**
 *  Session
 */
extern NSString * HTTPSessionCreateURLString;
extern NSString * HTTPSessionUpdateURLString;

/**
 *  Challenge
 */
extern NSString * HTTPChallengeCreateURLString;
extern NSString * HTTPChallengeMultiplayerURLString;
extern NSString * HTTPChallengeTeamURLString;
extern NSString * HTTPChallengeGetInvitedListURLString;
extern NSString * HTTPChallengeGetOngoingListURLString;
extern NSString * HTTPChallengeGetRankingsURLString;

/**
 *  Query exercise sessions
 */
extern NSString * HTTPQueryExerciseSessionURLString;


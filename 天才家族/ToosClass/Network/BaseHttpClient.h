//
//  BaseHttpClient.h
//  tanghuangOA
//
//  Created by Orangels on 2017/5/4.
//  Copyright © 2017年 ls. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "Header.h"
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,HTTP_TYPE) {
    GET  = 1,
    POST = 2,
};


typedef void(^HttpSuc)(id data);

typedef void(^HttpFail)(NSError* error);

@interface BaseHttpClient : NSObject

@property (nonatomic ,strong) AFHTTPSessionManager* manager;
@property (nonatomic,assign)BOOL frist;
#pragma mark -- 请求接口
+(void)requestWithHttpType:(HTTP_TYPE)type andParameters:(NSDictionary*)parameters andURL:(NSString*)url andSucHandler:(HttpSuc)sucHandler andFailHandler:(HttpFail)failHandler;

#pragma mark -- 请求接口 (没有菊花视图的请求)
+(void)HiddenHUDrequestWithHttpType:(HTTP_TYPE)type andParameters:(NSDictionary*)parameters andURL:(NSString*)url andSucHandler:(HttpSuc)sucHandler andFailHandler:(HttpFail)failHandler;




#pragma mark -- 取消请求队列
+(void)cancelHttpOperations;

#pragma mark -- 单例
+ (BaseHttpClient*)sharedBaseHttpClient;

+ (BOOL)isDataClass:(NSMutableArray *)array;
@end

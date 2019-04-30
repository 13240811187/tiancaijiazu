//
//  toolClass.h
//  唐桓
//
//  Created by Crab on 16/8/25.
//  Copyright © 2016年 Crab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Header.h"
@interface toolClass : NSObject


//日期转时间戳的调用方式
//NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
//[dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
//NSDate *logDate = [dateFormatter dateFromString:@"2016-11-27 16:14:49"];
//long long datemis = [toolClass getDateTimeTOMilliSeconds:logDate];
//NSNumber *logTimeNum = [NSNumber numberWithLong:datemis];
//
//NSLog(@"logTimeNum=======%@",logTimeNum);


+ (NSString *)dicTransformToJsonString:(NSDictionary *)dic;
//请求的结果  返回字典形式
+ (NSDictionary *)getDicFromResponseStr:(NSString *)str;


+ (BOOL)validatePassword:(NSString *)passWord;
//身份证号正则表达式
+ (BOOL)validateIdentityCard: (NSString *)identityCard;
//正则表达式匹配11位手机号码
+ (BOOL)validateMobilePhoneNumber: (NSString *)phoneNumber;

//long long 日期转成 date
+(NSDate *)dateWithLongLong:(long long)longlongValue;
//将NSDate类型的时间转换为时间戳,从1970/1/1开始
+(long long)getDateTimeTOMilliSeconds:(NSDate *)datetime;

+ (NSNumber *)dicTransformToNSNumber:(NSString*)String;

//随机字符串
+ (NSString *)generateTradeNO;

//两个日期比较天数
+ (NSInteger)getDaysFrom:(NSString *)serverStr To:(NSString *)endStr;

@end

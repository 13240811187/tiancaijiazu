//
//  toolClass.m
//  唐桓
//
//  Created by Crab on 16/8/25.
//  Copyright © 2016年 Crab. All rights reserved.
//

#import "toolClass.h"

@implementation toolClass

//字典转JSON 格式的字符串
+ (NSString *)dicTransformToJsonString:(NSDictionary *)dic {
    //NSJSONWritingPrettyPrinted
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&error];
    return [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
}

// 字符串转字典
+ (NSDictionary *)getDicFromResponseStr:(NSString *)str {
    
    NSData *resData = [[NSData alloc] initWithData:[str dataUsingEncoding:NSUTF8StringEncoding]];
    NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:resData options:NSJSONReadingMutableLeaves error:nil];
    
    return resultDic;
}

//密码只能是6到20位的数字 或 字母，
+ (BOOL)validatePassword:(NSString *)passWord
{
    NSString *passWordRegex = @"^[a-zA-Z0-9]{6,20}+$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
    return [passWordPredicate evaluateWithObject:passWord];
}

//身份证号正则表达式
+ (BOOL)validateIdentityCard: (NSString *)identityCard
{
    BOOL flag;
    if (identityCard.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:identityCard];
}

////正则表达式匹配11位手机号码
+ (BOOL)validateMobilePhoneNumber:(NSString *)phoneNumber{
    
    BOOL isMatch;
    if (phoneNumber.length <= 0) {
        isMatch = NO;
        return isMatch;
    }
    
    //正则表达式匹配11位手机号码
  NSString *regex = @"^1(3[0-9]|4[0-9]|5[0-9]|8[0-9]|7[0-9])\\d{8}$";
  NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
   return [pred evaluateWithObject:phoneNumber];

}



//long long 日期转成 date
+(NSDate *)dateWithLongLong:(long long)longlongValue{
    long long value = longlongValue/1000;
    NSNumber *time = [NSNumber numberWithLongLong:value];
    //转换成NSTimeInterval
    NSTimeInterval nsTimeInterval = [time longValue];
    NSDate *date = [[NSDate alloc] initWithTimeIntervalSince1970:nsTimeInterval];
    return date;
}

//将NSDate类型的时间转换为时间戳,从1970/1/1开始
+(long long)getDateTimeTOMilliSeconds:(NSDate *)datetime

{
    
    NSTimeInterval interval = [datetime timeIntervalSince1970];
    
    long long totalMilliseconds = interval*1000 ;
    
    return totalMilliseconds;
    
}



+ (NSNumber *)dicTransformToNSNumber:(NSString*)String{

// 字符串转为NSInteger类型
NSInteger num = [String integerValue];
// 字符串转为NSNumber对象类型
NSNumber * nums = @(num);
return nums;
}



//随机字符串
+ (NSString *)generateTradeNO
{
    static int kNumber = 15;
    
    NSString *sourceStr = @"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    NSMutableString *resultStr = [[NSMutableString alloc] init];
    srand((unsigned)time(0));
    for (int i = 0; i < kNumber; i++)
    {
        unsigned index = rand() % [sourceStr length];
        NSString *oneStr = [sourceStr substringWithRange:NSMakeRange(index, 1)];
        [resultStr appendString:oneStr];
    }
    return resultStr;
}


//两个日期比较天数
+ (NSInteger)getDaysFrom:(NSString *)serverStr To:(NSString *)endStr
{
    
    NSDateFormatter *dateFomatter = [[NSDateFormatter alloc] init];
    dateFomatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    // 截止时间data格式
    NSDate *serverDate = [dateFomatter dateFromString:serverStr];
    NSDate *endDate = [dateFomatter dateFromString:endStr];
    
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    [gregorian setFirstWeekday:2];
    
    //去掉时分秒信息
    NSDate *fromDate;
    NSDate *toDate;
    [gregorian rangeOfUnit:NSCalendarUnitDay startDate:&fromDate interval:NULL forDate:serverDate];
    [gregorian rangeOfUnit:NSCalendarUnitDay startDate:&toDate interval:NULL forDate:endDate];
    NSDateComponents *dayComponents = [gregorian components:NSCalendarUnitDay fromDate:fromDate toDate:toDate options:0];
    
    return dayComponents.day;
}







@end

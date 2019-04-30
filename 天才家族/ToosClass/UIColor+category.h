//
//  UIColor+category.h
//
//
//  Created by maodouwang on 2017/10/31.
//  Copyright © 2017年  All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (category)
/**
 *  通过16进制字符串转换成UIColor对象
 *
 *  @param hexString 16进制字符串
 *
 *  @return color
 */
+(UIColor *)colorWithHexString:(NSString *)hexString;
+(UIColor *)randomColor;
@end


@interface UIColor (themeColor)
//绿色
+(UIColor *)themeGreenColor;
//黑色
+(UIColor *)themBlackColor;
//白色
+(UIColor *)themWhiteColor;
//linegray
+(UIColor *)themGrayLineColor;
//wordGray
+(UIColor *)themGrayWordColor;
@end

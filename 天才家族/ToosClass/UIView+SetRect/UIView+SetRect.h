//
//  UIView+SetRect.h
//  UIView
//
//  Created by YouXianMing on 16/1/29.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

#import <UIKit/UIKit.h>

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

/**
 *  iPhone5 or iPhone5s
 */
#define  iPhone5_5s     (Width == 320.f && Height == 568.f ? YES : NO)

/**
 *  iPhone6 or iPhone6s
 */
#define  iPhone6_6s     (Width == 375.f && Height == 667.f ? YES : NO)

/**
 *  iPhone6Plus or iPhone6sPlus
 */
#define  iPhone6_6sPlus (Width == 414.f && Height == 736.f ? YES : NO)

/**
 *  iPhonex xs
 */
#define  iPhone_X_XS (Width == 375.f && Height == 812.f ? YES : NO)


/**
 *  iPhonex xs
 */
#define  iPhone_XR_Max (Width == 414.f && Height == 896.f ? YES : NO)



@interface UIView (SetRect)

/*----------------------
 * Absolute coordinate *
 ----------------------*/

@property (nonatomic) CGPoint viewOrigin;
@property (nonatomic) CGSize  viewSize;

@property (nonatomic) CGFloat x;
@property (nonatomic) CGFloat y;
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;

@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat bottom;
@property (nonatomic) CGFloat left;
@property (nonatomic) CGFloat right;

@property (nonatomic) CGFloat centerX;
@property (nonatomic) CGFloat centerY;

/*----------------------
 * Relative coordinate *
 ----------------------*/

@property (nonatomic, readonly) CGFloat middleX;
@property (nonatomic, readonly) CGFloat middleY;
@property (nonatomic, readonly) CGPoint middlePoint;

@end

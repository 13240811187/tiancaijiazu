//
//  responseBuilder.h
//  tanghuangOA
//
//  Created by Crab on 2017/5/11.
//  Copyright © 2017年 ls. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
enum {
    LeftContentType,
    CenterContentType,
    RightContentType
};

typedef NSInteger ButtonContentType;

@interface responseBuilder : NSObject
//普通的button
+ (UIButton*)buttonTitle:(NSString*)title frame:(CGRect)frame backgroundColor:(UIColor*)color titleColor:(UIColor *)textColor titleLabelFont:(UIFont*)font target:(id)target selector:(SEL)selector;
//设置圆角边框的BUTTON
+ (UIButton*)radiusbuttonTitle:(NSString*)title frame:(CGRect)frame cornerRadius:(CGFloat)radius borderColor:(UIColor *)bordercolor borderWidth:(CGFloat)borderwidth backgroundColor:(UIColor*)color target:(id)target selector:(SEL)selector;
//高亮的button
+ (UIButton*)buttonNormalImage:(NSString*)imageName hightLightImage:(NSString*)hightImage frame:(CGRect)frame target:(id)target selector:(SEL)selector;

//选中的button
+ (UIButton *)buttonNormalImage:(NSString*)imageName selectImageName:(NSString*)selectImageName frame:(CGRect)frame target:(id)target selector:(SEL)selector;

//有图片和文字的按钮
+ (UIButton*)buttonNormalImage:(NSString *)imageName seletedImage:(NSString *)seletedImage title:(NSString *)titleName frame:(CGRect)frame target:(id)target selector:(SEL)selector directionType:(ButtonContentType)type;

//文字在左 图片在有的按钮 spacing间距
+ (UIButton*)buttonNormalImage:(NSString *)imageName seletedImage:(NSString *)seletedImage backgroundColor:(UIColor *)bgcolor title:(NSString *)titleName titleFont:(UIFont *)font titleNormalColor:(UIColor *)color titleSelectedColor:(UIColor*)Selectedcolor  spacing:(CGFloat)spacing frame:(CGRect)frame target:(id)target selector:(SEL)selector;


//有边框的按钮.设置边框
+ (UIButton*)buttonFrame:(CGRect)frame title:(NSString*)title textColor:(UIColor*)textColor textFont:(UIFont*)font borderWidth:(CGFloat)width borderColor:(UIColor*)borderColor target:(id)target selector:(SEL)selector;

//lable
+ (UILabel*)lableFrame:(CGRect)frame title:(NSString *)title backgroundColor:(UIColor*)color font:(UIFont*)font textColor:(UIColor*)textColor;

//imageview
+ (UIImageView*)imageViewFrame:(CGRect)frame imageName:(NSString*)imageName;

//lable 自适应高 Emptylen首行缩进   lineSpacing行间距  [UIFont fontWithName:@"Arial" size:15]
 + (CGFloat)lableTitle:(NSString *)title textFont:(UIFont *)font Emptylen:(CGFloat)emptylen linespacing:(CGFloat)linespacing LabelWidth:(CGFloat)width;

//lable width自适应宽
+ (CGFloat)WidthLableTitle:(NSString *)title textFont:(UIFont *)font Emptylen:(CGFloat)emptylen linespacing:(CGFloat)linespacing Labelheight:(CGFloat)height;

+(NSAttributedString *)attrTextLableTitle:(NSString *)title textFont:(UIFont *)font Emptylen:(CGFloat)emptylen linespacing:(CGFloat)linespacing LabelWidth:(CGFloat)width;

#pragma mark -- 计算Label 宽窄的函数
+ (float)LabelAutoCalculateWidthOrHeight:(float)height
                                   width:(float)width
                                fontsize:(float)fontsize
                                 content:(NSString*)content;

// 返回字典 lable 自适应高 Emptylen首行缩进   lineSpacing行间距  [UIFont fontWithName:@"Arial" size:15]
+ (NSDictionary *)DictionarylableTitle:(NSString *)title textFont:(UIFont *)font Emptylen:(CGFloat)emptylen linespacing:(CGFloat)linespacing LabelWidth:(CGFloat)width;
@end

//
//  responseBuilder.m
//  tanghuangOA
//
//  Created by Crab on 2017/5/11.
//  Copyright © 2017年 ls. All rights reserved.
//

#import "responseBuilder.h"

@implementation responseBuilder
+ (UIButton*)buttonTitle:(NSString*)title frame:(CGRect)frame backgroundColor:(UIColor*)color titleColor:(UIColor *)textColor titleLabelFont:(UIFont*)font target:(id)target selector:(SEL)selector
{
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=frame;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setBackgroundColor:color];
    [btn setTitleColor:textColor forState:UIControlStateNormal];
    btn.titleLabel.font=font;

    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    return btn;
}


+ (UIButton*)radiusbuttonTitle:(NSString*)title frame:(CGRect)frame cornerRadius:(CGFloat)radius borderColor:(UIColor *)bordercolor borderWidth:(CGFloat)borderwidth backgroundColor:(UIColor*)color target:(id)target selector:(SEL)selector
{
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=frame;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setBackgroundColor:color];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.layer.cornerRadius = radius;
    btn.layer.masksToBounds = YES;
    btn.layer.borderColor =(__bridge CGColorRef _Nullable)(bordercolor);
    btn.layer.borderWidth =borderwidth;
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

+ (UIButton*)buttonNormalImage:(NSString*)imageName hightLightImage:(NSString*)hightImage frame:(CGRect)frame target:(id)target selector:(SEL)selector
{
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=frame;
    imageName ? [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal] : nil;
    
    hightImage ? [btn setImage:[UIImage imageNamed:hightImage] forState:UIControlStateHighlighted] : nil;
    
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
}


+ (UIButton*)buttonNormalImage:(NSString*)imageName selectImageName:(NSString*)selectImageName frame:(CGRect)frame target:(id)target selector:(SEL)selector
{
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=frame;
    imageName ?  [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal] : nil;
    
    selectImageName ? [btn setImage:[UIImage imageNamed:selectImageName] forState:UIControlStateSelected] : nil;
    
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

+ (UIButton*)buttonNormalImage:(NSString *)imageName seletedImage:(NSString *)seletedImage title:(NSString *)titleName frame:(CGRect)frame target:(id)target selector:(SEL)selector directionType:(ButtonContentType)type
{
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundColor:[UIColor clearColor]];
    
    [btn setTitle:titleName forState:UIControlStateNormal];
    [btn setTitle:titleName forState:UIControlStateSelected];
    
    
    UIImage *normalImage=[UIImage imageNamed:imageName];
    UIImage *slectedImg=[UIImage imageNamed:seletedImage];
    
    [btn setImage:normalImage forState:UIControlStateNormal];
    [btn setImage:slectedImg forState:UIControlStateSelected];
    [btn setFrame:frame];
    
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    if (type==LeftContentType) {// 内容在左边
        
        btn.contentHorizontalAlignment=UIControlContentHorizontalAlignmentLeft;
        [btn setImageEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
        [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, 16, 0, 0)];
        
    }else if (type==CenterContentType){// 内容在中间
        
        //btn.contentHorizontalAlignment=UIControlContentHorizontalAlignmentCenter;
        //[btn setImageEdgeInsets:UIEdgeInsetsMake(17, 12, 48, 17)];
        //[btn setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, -40, 0)];
        [btn setTitleEdgeInsets:UIEdgeInsetsMake(btn.imageView.frame.size.height ,-btn.imageView.frame.size.width, -10.0,0.0)];//文字距离上边框的距离增加imageView的高度，距离左边框减少imageView的宽度，距离下边框和右边框距离不变
        
        [btn setImageEdgeInsets:UIEdgeInsetsMake(-20.0, 0.0,0.0, -54)];//图片距离右边框距离减少图片的宽度，其它不边
        
        //btn.titleLabel.font=Font(13);
        
        
        
    }else{//内容在右边
        
        btn.contentHorizontalAlignment=UIControlContentHorizontalAlignmentRight;
        
        [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 6)];
        
    }
    
    return btn;
    
}

+ (UIButton*)buttonNormalImage:(NSString *)imageName seletedImage:(NSString *)seletedImage backgroundColor:(UIColor *)bgcolor title:(NSString *)titleName titleFont:(UIFont *)font titleNormalColor:(UIColor *)color titleSelectedColor:(UIColor*)Selectedcolor  spacing:(CGFloat)spacing frame:(CGRect)frame target:(id)target selector:(SEL)selector{
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
     [btn setImage:[UIImage imageNamed:seletedImage] forState:UIControlStateSelected];
    [btn setBackgroundColor:bgcolor];
   [btn setTitle:titleName forState:UIControlStateNormal];
    [btn.titleLabel setFont:font];
    [btn setTitleColor:color forState:UIControlStateNormal];
     [btn setTitleColor:Selectedcolor forState:UIControlStateSelected];
     [btn setFrame:frame];
    
    // 图片右移
    CGSize imageSize = btn.imageView.frame.size;
    btn.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageSize.width * 2 - spacing, 0.0, 0.0);
    
    // 文字左移
    CGSize titleSize = btn.titleLabel.frame.size;
    btn.imageEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, 0.0, - titleSize.width * 2 - spacing);

    
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    
    
    return btn;
}

+ (UIButton*)buttonFrame:(CGRect)frame title:(NSString*)title textColor:(UIColor*)textColor textFont:(UIFont*)font borderWidth:(CGFloat)width borderColor:(UIColor*)borderColor target:(id)target selector:(SEL)selector
{
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundColor:[UIColor clearColor]];
    
    [btn setFrame:frame];
    
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateSelected];
    
    [btn setTitleColor:textColor forState:UIControlStateNormal];
    
    btn.titleLabel.font=font;
    
    btn.layer.borderWidth=width;
    btn.layer.borderColor=borderColor.CGColor;
  [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    return btn;
    
}



+ (UILabel*)lableFrame:(CGRect)frame title:(NSString *)title backgroundColor:(UIColor*)color font:(UIFont*)font textColor:(UIColor*)textColor
{
    UILabel *lable=[[UILabel alloc]initWithFrame:frame];
    lable.text=title;
    lable.font=font;
    [lable setBackgroundColor:color];
    lable.textAlignment=NSTextAlignmentCenter;
    lable.textColor=textColor;
    return lable;
    
}

+ (UIImageView*)imageViewFrame:(CGRect)frame imageName:(NSString*)imageName
{
    UIImageView *imageView=[[UIImageView alloc] initWithFrame:frame];
    [imageView setImage:[UIImage imageNamed:imageName]];
    imageView.contentMode=UIViewContentModeScaleAspectFill;
    imageView.userInteractionEnabled=YES;
    return imageView;
}

//lable
+ (CGFloat)lableTitle:(NSString *)title textFont:(UIFont *)font Emptylen:(CGFloat)emptylen linespacing:(CGFloat)linespacing LabelWidth:(CGFloat)width
{
    
    if (title.length<1) {
        
        return 0;
    }
    
    UILabel *lable=[[UILabel alloc]initWithFrame:CGRectZero];
    lable.numberOfLines = 0;
    lable.text = title;
    lable.font=font;
   
    NSMutableParagraphStyle *paraStyle01 = [[NSMutableParagraphStyle alloc] init];
    paraStyle01.alignment = NSTextAlignmentLeft;  //对齐
    paraStyle01.headIndent = 0.0f;//行首缩进
    CGFloat empty = lable.font.pointSize * emptylen; //参数：（字体大小17号字乘以2，34f即首行空出两个字符）
    paraStyle01.firstLineHeadIndent = empty;//首行缩进
    paraStyle01.tailIndent = 0.0f;//行尾缩进
    paraStyle01.lineSpacing = linespacing;//行间距
    
    NSAttributedString *attrText = [[NSAttributedString alloc] initWithString:lable.text attributes:@{NSParagraphStyleAttributeName:paraStyle01}];
    lable.attributedText = attrText;

    NSDictionary *dic=@{NSFontAttributeName:lable.font,NSParagraphStyleAttributeName:paraStyle01.copy};
    // 字体
   CGRect rheight = [lable.text boundingRectWithSize:CGSizeMake(width,MAXFLOAT) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:dic context:nil];
    
    
    return rheight.size.height;
    
    
}


//lable
+(NSAttributedString *)attrTextLableTitle:(NSString *)title textFont:(UIFont *)font Emptylen:(CGFloat)emptylen linespacing:(CGFloat)linespacing LabelWidth:(CGFloat)width
{
    
    if (title.length<1) {
        
        return 0;
    }
    
    UILabel *lable=[[UILabel alloc]initWithFrame:CGRectZero];
    lable.numberOfLines = 0;
    lable.text = title;
    lable.font=font;
    
    NSMutableParagraphStyle *paraStyle01 = [[NSMutableParagraphStyle alloc] init];
    paraStyle01.alignment = NSTextAlignmentLeft;  //对齐
    paraStyle01.headIndent = 0.0f;//行首缩进
    CGFloat empty = lable.font.pointSize * emptylen; //参数：（字体大小17号字乘以2，34f即首行空出两个字符）
    paraStyle01.firstLineHeadIndent = empty;//首行缩进
    paraStyle01.tailIndent = 0.0f;//行尾缩进
    paraStyle01.lineSpacing = linespacing;//行间距
    
    NSAttributedString *attrText = [[NSAttributedString alloc] initWithString:lable.text attributes:@{NSParagraphStyleAttributeName:paraStyle01}];
    lable.attributedText = attrText;
    
    NSDictionary *dic=@{NSFontAttributeName:lable.font,NSParagraphStyleAttributeName:paraStyle01.copy};
    // 字体
    CGRect rheight = [lable.text boundingRectWithSize:CGSizeMake(width,MAXFLOAT) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:dic context:nil];
    
    
    return attrText;

}




//lable width
+ (CGFloat)WidthLableTitle:(NSString *)title textFont:(UIFont *)font Emptylen:(CGFloat)emptylen linespacing:(CGFloat)linespacing Labelheight:(CGFloat)height
{
    
    if (title.length<1) {
        
        return 0;
    }
    
    UILabel *lable=[[UILabel alloc]initWithFrame:CGRectZero];
    lable.numberOfLines = 0;
    lable.text = title;
    lable.font=font;
    
    NSMutableParagraphStyle *paraStyle01 = [[NSMutableParagraphStyle alloc] init];
    paraStyle01.alignment = NSTextAlignmentLeft;  //对齐
    paraStyle01.headIndent = 0.0f;//行首缩进
    CGFloat empty = lable.font.pointSize * emptylen; //参数：（字体大小17号字乘以2，34f即首行空出两个字符）
    paraStyle01.firstLineHeadIndent = empty;//首行缩进
    paraStyle01.tailIndent = 0.0f;//行尾缩进
    paraStyle01.lineSpacing = linespacing;//行间距
    
    NSAttributedString *attrText = [[NSAttributedString alloc] initWithString:lable.text attributes:@{NSParagraphStyleAttributeName:paraStyle01}];
    lable.attributedText = attrText;
    
    NSDictionary *dic=@{NSFontAttributeName:lable.font,NSParagraphStyleAttributeName:paraStyle01.copy};
    // 字体
    CGRect width = [lable.text boundingRectWithSize:CGSizeMake(MAXFLOAT,height) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:dic context:nil];
    
    
    return width.size.width;
    
}


#pragma mark -- 计算Label 宽窄的函数
+ (float)LabelAutoCalculateWidthOrHeight:(float)height
                             width:(float)width
                          fontsize:(float)fontsize
                           content:(NSString*)content
{
    //计算出rect
    CGRect rect = [content boundingRectWithSize:CGSizeMake(width, height)
                                        options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                     attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontsize]} context:nil];
    
    //判断计算的是宽还是高
    if (height == MAXFLOAT) {
        return rect.size.height;
    }
    else
        return rect.size.width;
    
}



//lable
+ (NSDictionary *)DictionarylableTitle:(NSString *)title textFont:(UIFont *)font Emptylen:(CGFloat)emptylen linespacing:(CGFloat)linespacing LabelWidth:(CGFloat)width
{
   
    
    if (title.length<1) {
        
        return 0;
    }
    
    UILabel *lable=[[UILabel alloc]initWithFrame:CGRectZero];
    lable.numberOfLines = 0;
    lable.text = title;
    lable.font=font;
    
    NSMutableParagraphStyle *paraStyle01 = [[NSMutableParagraphStyle alloc] init];
    paraStyle01.alignment = NSTextAlignmentLeft;  //对齐
    paraStyle01.headIndent = 0.0f;//行首缩进
    CGFloat empty = lable.font.pointSize * emptylen; //参数：（字体大小17号字乘以2，34f即首行空出两个字符）
    paraStyle01.firstLineHeadIndent = empty;//首行缩进
    paraStyle01.tailIndent = 0.0f;//行尾缩进
    paraStyle01.lineSpacing = linespacing;//行间距
    
    NSAttributedString *attrText = [[NSAttributedString alloc] initWithString:lable.text attributes:@{NSParagraphStyleAttributeName:paraStyle01}];
    lable.attributedText = attrText;
    
    NSDictionary *dic=@{NSFontAttributeName:lable.font,NSParagraphStyleAttributeName:paraStyle01.copy};
    // 字体
    CGRect rheight = [lable.text boundingRectWithSize:CGSizeMake(width,1000) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:dic context:nil];
    
    NSNumber * labelHeight = [NSNumber numberWithFloat:rheight.size.height];
    
   return @{@"labelHeight":labelHeight,@"text":attrText};
    
    
}


//        NSMutableAttributedString * attributedString1 = [[NSMutableAttributedString alloc] initWithString:Model.Profile];
//        NSMutableParagraphStyle * paragraphStyle1 = [[NSMutableParagraphStyle alloc] init];
//        [paragraphStyle1 setLineSpacing:5];
//        [attributedString1 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle1 range:NSMakeRange(0, [Model.Profile length])];
//        [self.PofileLabel setAttributedText:attributedString1];






@end

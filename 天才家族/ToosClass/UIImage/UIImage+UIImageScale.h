//
//  UIImage+UIImageScale.h
//  鱿鱼联盟
//
//  Created by 优站创意 on 2017/9/9.
//  Copyright © 2017年 优站创意. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (UIImageScale)

//// 裁剪图片
//image = [image getSubImage:CGRectMake(10, 10, 70, 80)];

//等比列缩放image = [image scaleToSize:CGSizeMake(200, 300)];

+ (UIImage *)SDplaceholderImage;
-(UIImage*)getSubImage:(CGRect)rect;
-(UIImage*)scaleToSize:(CGSize)size;

//按比例缩放,size 是你要把图显示到 多大区域
+(UIImage *) imageCompressForSize:(UIImage *)sourceImage targetSize:(CGSize)size;
//指定宽度按比例缩放
-(UIImage *) imageCompressForWidthScale:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth;

//返回裁剪区域图片,返回裁剪区域大小图片

- (UIImage *)clipWithImageRectImage:(CGRect)clipRect clipImage:(UIImage *)clipImage;

//指定宽度按比例缩放
+(UIImage *) imageCompressForWidth:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth;
@end

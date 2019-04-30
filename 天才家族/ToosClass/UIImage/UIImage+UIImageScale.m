//
//  UIImage+UIImageScale.m
//  鱿鱼联盟
//
//  Created by 优站创意 on 2017/9/9.
//  Copyright © 2017年 优站创意. All rights reserved.
//

#import "UIImage+UIImageScale.h"

@implementation UIImage (UIImageScale)

+ (UIImage *)SDplaceholderImage{
    
    CGFloat top = 0.5;
    CGFloat left = 0.5;
    
    CGFloat bottom = 0.5;
    
    CGFloat right = 0.5;
    
    //上面四句是设置拉伸的尺寸, 代表了拉伸上下左右边缘的0.5距离
    
    UIEdgeInsets edgeInsets = UIEdgeInsetsMake(top, left, bottom, right);
    
    UIImage *img = [UIImage imageNamed:@"WechatIMG4"];
    
    UIImageResizingMode mode = UIImageResizingModeStretch;
    
    UIImage *newImage = [img resizableImageWithCapInsets:edgeInsets resizingMode:mode];
    
    return newImage;
    
}



//截取部分图像
-(UIImage*)getSubImage:(CGRect)rect
{
    CGImageRef subImageRef = CGImageCreateWithImageInRect(self.CGImage, rect);
    CGRect smallBounds = CGRectMake(0, 0, CGImageGetWidth(subImageRef), CGImageGetHeight(subImageRef));
    
    UIGraphicsBeginImageContext(smallBounds.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawImage(context, smallBounds, subImageRef);
    UIImage* smallImage = [UIImage imageWithCGImage:subImageRef];
    UIGraphicsEndImageContext();
    
    return smallImage;
}

//等比例缩放 (跟系统的UIViewContentModeScaleAspectFit 一样)
-(UIImage*)scaleToSize:(CGSize)size
{
    CGFloat width = CGImageGetWidth(self.CGImage);
    CGFloat height = CGImageGetHeight(self.CGImage);
    
    float verticalRadio = size.height*1.0/height;
    float horizontalRadio = size.width*1.0/width;
    
    float radio = 1;
    if(verticalRadio>1 && horizontalRadio>1)
    {
        radio = verticalRadio > horizontalRadio ? horizontalRadio : verticalRadio;
    }
    else
    {
        radio = verticalRadio < horizontalRadio ? verticalRadio : horizontalRadio;
    }
    
    width = width*radio;
    height = height*radio;
    
    int xPos = (size.width - width)/2;
    int yPos = (size.height-height)/2;
    
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    
    // 绘制改变大小的图片
    [self drawInRect:CGRectMake(xPos, yPos, width, height)];
    
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    
    // 返回新的改变大小后的图片
    return scaledImage;
}



//按比例缩放,size 是你要把图显示到 多大区域
//按比例缩放,size 是你要把图显示到 多大区域 CGSizeMake(300, 140)
+(UIImage *) imageCompressForSize:(UIImage *)sourceImage targetSize:(CGSize)size{
    UIImage *newImage = nil;
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = size.width;
    CGFloat targetHeight = size.height;
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    CGPoint thumbnailPoint = CGPointMake(0.0, 0.0);
    if(CGSizeEqualToSize(imageSize, size) == NO){
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        if(widthFactor > heightFactor){
            scaleFactor = widthFactor;
        }
        else{
            scaleFactor = heightFactor;
        }
        scaledWidth = width * scaleFactor;
        scaledHeight = height * scaleFactor;
        if(widthFactor > heightFactor){
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
        }else if(widthFactor < heightFactor){
            thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
        }
    }
    UIGraphicsBeginImageContext(size);
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width = scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    [sourceImage drawInRect:thumbnailRect];
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    if(newImage == nil){
        //NSLog(@"scale image fail");
    }
    UIGraphicsEndImageContext();
    return newImage;
}



//指定宽度按比例缩放
-(UIImage *) imageCompressForWidthScale:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth{
    
    UIImage *newImage = nil;
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = defineWidth;
    CGFloat targetHeight = height / (width / targetWidth);
    CGSize size = CGSizeMake(targetWidth, targetHeight);
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    CGPoint thumbnailPoint = CGPointMake(0.0, 0.0);
    
    if(CGSizeEqualToSize(imageSize, size) == NO){
        
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        
        if(widthFactor > heightFactor){
            scaleFactor = widthFactor;
        }
        else{
            scaleFactor = heightFactor;
        }
        scaledWidth = width * scaleFactor;
        scaledHeight = height * scaleFactor;
        
        if(widthFactor > heightFactor){
            
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
            
        }else if(widthFactor < heightFactor){
            
            thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
        }
    }
    
    UIGraphicsBeginImageContext(size);
    
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width = scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    
    [sourceImage drawInRect:thumbnailRect];
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    if(newImage == nil){
        
        NSLog(@"scale image fail");
    }
    UIGraphicsEndImageContext();  
    return newImage;  
}  




//返回裁剪区域图片,返回还是原图大小,除图片以外区域清空
- (UIImage *)clipWithImageRect:(CGRect)imageRect clipRect:(CGRect)clipRect clipImage:(UIImage *)clipImage;

{
    
    // 开启位图上下文
    
    UIGraphicsBeginImageContextWithOptions(imageRect.size, NO, 0);
    
    // 设置裁剪区域
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:clipRect];
    
    [path addClip];
    
    // 绘制图片
    
    [clipImage drawInRect:clipRect];
    
    // 获取当前图片
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭上下文
    
    UIGraphicsEndImageContext();
    
    return image;
    
}




+(UIImage*)image:(UIImage *)image fortargetSize:(CGSize)targetSize{
    
    UIImage*sourceImage = image;
    CGSize imageSize = sourceImage.size;//图片的size
    CGFloat imageWidth = imageSize.width;//图片宽度
    CGFloat imageHeight = imageSize.height;//图片高度
    NSInteger judge;//声明一个判断属性
    //判断是否需要调整尺寸(这个地方的判断标准又个人决定,在此我是判断高大于宽),因为图片是800*480,所以也可以变成480*800
    if( ( imageHeight - imageWidth)>0) {
        //在这里我将目标尺寸修改成480*800
        CGFloat tempW = targetSize.width;
        CGFloat tempH = targetSize.height;
        targetSize.height= tempW;
        targetSize.width= tempH;
    }
    CGFloat targetWidth = targetSize.width;//获取最终的目标宽度尺寸
    CGFloat targetHeight = targetSize.height;//获取最终的目标高度尺寸
    CGFloat scaleFactor ;//先声明拉伸的系数
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    CGPoint thumbnailPoint =CGPointMake(0.0,0.0);//这个是图片剪切的起点位置
    //第一个判断,图片大小宽跟高都小于目标尺寸,直接返回imag
    if( imageHeight < targetHeight && imageWidth < targetWidth) {
        
        return image;
        
    }
    
    if ( CGSizeEqualToSize(imageSize, targetSize ) ==NO )
        
    {
        //这里是目标宽度除以图片宽度
        CGFloat widthFactor = targetWidth / imageWidth;
        //这里是目标高度除以图片高度
        CGFloat heightFactor = targetHeight / imageHeight;
               //分四种情况,
        
           //第一种,widthFactor,heightFactor都小于1,也就是图片宽度跟高度都比目标图片大,要缩小
               if(widthFactor <1&& heightFactor<1){
            
         //第一种,需要判断要缩小哪一个尺寸,这里看拉伸尺度,我们的scale在小于1的情况下,谁越小,等下就用原图的宽度高度✖️那一个系数(这里不懂的话,代个数想一下,例如目标800*480  原图1600*800  系数就采用宽度系数widthFactor = 1/2  )
            
                 if(widthFactor > heightFactor){
                
                    judge =1;//右部分空白
                
                  scaleFactor = heightFactor; //修改最后的拉伸系数是高度系数(也就是最后要*这个值)
                
                    }
            
                  else
                
                       {
                    
                            judge =2;//下部分空白
                    
                            scaleFactor = widthFactor;
                    
                       }
            
        }
        
             else if(widthFactor >1&& heightFactor <1){
            
               //第二种,宽度不够比例,高度缩小一点点(widthFactor大于一,说明目标宽度比原图片宽度大,此时只要拉伸高度系数)
            
                    judge =3;//下部分空白
            
                     //采用高度拉伸比例
            
                   scaleFactor = imageWidth / targetWidth;// 计算高度缩小系数
            
        }else if(heightFactor >1&& widthFactor <1){
            
            //第三种,高度不够比例,宽度缩小一点点(heightFactor大于一,说明目标高度比原图片高度大,此时只要拉伸宽度系数)
               judge =4;//下边空白
            
             //采用高度拉伸比例
            
              scaleFactor = imageHeight / targetWidth;
            
            }else{
                
                //第四种,此时宽度高度都小于目标尺寸,不必要处理放大(如果有处理放大的,在这里写).
                
              }
        
               scaledWidth= imageWidth * scaleFactor;
        
             scaledHeight = imageHeight * scaleFactor;
        
    }
    
    if(judge ==1){
        
           //右部分空白
        
            targetWidth = scaledWidth;//此时把原来目标剪切的宽度改小,例如原来可能是800,现在改成780
        
    }else if(judge ==2){
        
        //下部分空白
        
            targetHeight = scaledHeight;
        
    }else if(judge ==3){
        
           //第三种,高度不够比例,宽度缩小一点点
        
            targetWidth = scaledWidth;
        
    }else{
        
             //第三种,高度不够比例,宽度缩小一点点
        
              targetHeight= scaledHeight;
        
    }
    
           UIGraphicsBeginImageContext(targetSize);//开始剪切
    
           CGRect thumbnailRect =CGRectZero;//剪切起点(0,0)
    
          thumbnailRect.origin= thumbnailPoint;
    
          thumbnailRect.size.width= scaledWidth;
    
           thumbnailRect.size.height= scaledHeight;
    
           [sourceImage drawInRect:thumbnailRect];
    
            UIImage*newImage =UIGraphicsGetImageFromCurrentImageContext();//截图拿到图片
    
           return newImage;
    
}



//*  从图片中按指定的位置大小截取图片的一部分
//*
//*  @param image UIImage image 原始的图片
//*  @param rect  CGRect rect 要截取的区域
//*
//*  @return UIImage
//*/

+ (UIImage *)ct_imageFromImage:(UIImage *)image inRect:(CGRect)rect{
    
    //把像 素rect 转化为 点rect（如无转化则按原图像素取部分图片）
    CGFloat scale = [UIScreen mainScreen].scale;
    CGFloat x= rect.origin.x*scale,y=rect.origin.y*scale,w=rect.size.width*scale,h=rect.size.height*scale;
    CGRect dianRect = CGRectMake(x, y, w, h);
    
    //截取部分图片并生成新图片
    CGImageRef sourceImageRef = [image CGImage];
    CGImageRef newImageRef = CGImageCreateWithImageInRect(sourceImageRef, dianRect);
    UIImage *newImage = [UIImage imageWithCGImage:newImageRef scale:[UIScreen mainScreen].scale orientation:UIImageOrientationUp];
    return newImage;
}



//返回裁剪区域图片,返回裁剪区域大小图片

- (UIImage *)clipWithImageRectImage:(CGRect)clipRect clipImage:(UIImage *)clipImage

{
    
    UIGraphicsBeginImageContext(clipRect.size);
    
    [clipImage drawInRect:CGRectMake(0,0,clipRect.size.width,clipRect.size.height)];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
    
}


//指定宽度按比例缩放
+(UIImage *) imageCompressForWidth:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth{
    UIImage *newImage = nil;
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = defineWidth;
    CGFloat targetHeight = height / (width / targetWidth);
    CGSize size = CGSizeMake(targetWidth, targetHeight);
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    CGPoint thumbnailPoint = CGPointMake(0.0, 0.0);
    if(CGSizeEqualToSize(imageSize, size) == NO){
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        if(widthFactor > heightFactor){
            scaleFactor = widthFactor;
        }
        else{
            scaleFactor = heightFactor;
        }
        scaledWidth = width * scaleFactor;
        scaledHeight = height * scaleFactor;
        if(widthFactor > heightFactor){
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
        }else if(widthFactor < heightFactor){
            thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
        }
    }
    UIGraphicsBeginImageContext(size);
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width = scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    [sourceImage drawInRect:thumbnailRect];
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    if(newImage == nil){
        NSLog(@"scale image fail");
    }
    UIGraphicsEndImageContext();
    return newImage;
}




//--------------截取部分图片到指定位置-------------------------

//图片(UIImage*) img
//要截取的起始坐标sx:(int) sx1 sy:(int)sy1
//要截取的长度和宽度sw:(int) sw1 sh:(int) sh1
//最终要显示的坐标desx:(int) desx1 desy:(int)desy1

//-(UIImage*)objectiveDrawRegion:(UIImage*) img sx:(int) sx1 sy:(int)sy1 sw:(int) sw1 sh:(int) sh1 desx:(int) desx1 desy:(int)desy1{
//    [self saveImage:img name:@"objectiveDrawRegion1.png"];
//    
//    //创建图片缓冲
//    void *imageDataRegion=malloc(screenWidth*screenHeight*32);
//    CGColorSpaceRef iColorSpaceRegion=CGColorSpaceCreateDeviceRGB();
//    CGContextRefiDeviceRegion=CGBitmapContextCreate(imageDataRegion,screenWidth,screenHeight,8,4*screenWidth,iColorSpaceRegion,kCGImageAlphaPremultipliedLast);
//    
//    
//    
//    //剪切区域
//    CGRect clipRegion=CGRectMake(sx1,sy1,sw1,sh1);
//    CGContextClipToRect(iDeviceRegion, clipRegion);
//    
//    CGFloat widthf=img.size.width;
//    CGFloat heightf=img.size.height;
//    
//    CGRect  cg=CGRectMake(0.0, 0.0, widthf, heightf);
//    //画底图
//    CGContextDrawImage(iDeviceRegion,cg, img.CGImage);
//    
//    //将缓冲形成图片
//    CGImageRef ioffRegion=CGBitmapContextCreateImage(iDeviceRegion);
//    
//    CGRect  cg1=CGRectMake(desx1, desy1, sw1, sh1);
//    UIImage *ui=[UIImage imageWithCGImage:ioffRegion];
//    
//    CGContextDrawImage(当前context,cg1, ui.CGImage);
//    
//    
//    //清除缓冲
//    CGColorSpaceRelease(iColorSpaceRegion);
//    CGContextRelease(iDeviceRegion);
//    CGImageRelease(ioffRegion);
//    free(imageDataRegion);
//    //    iDeviceRegion=NULL; 
//    //    imageDataRegion=0; 
//    
//    return ui; 
//}


@end

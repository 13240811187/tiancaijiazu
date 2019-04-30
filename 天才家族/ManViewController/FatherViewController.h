//
//  FatherViewController.h
//  鱿鱼
//
//  Created by 优站创意 on 2017/8/11.
//  Copyright © 2017年 优站创意. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FatherViewController : UIViewController
//提示框 一秒后消失
- (void)showToastWithMessage:(NSString *)message;

- (void)setLeftItemImageName:(NSString *)imageName andhighImage:(NSString *)image;
- (void)setRightItemImageName:(NSString *)imageName andhighImage:(NSString *)image;
- (void)setLeftItemImageName:(NSString *)imageName andhighImage:(NSString *)image andLeftTitle:(NSString *)title;
- (void)setRightItemBtnTitle:(NSString *)title;
- (void)navibarRightBtnClick;

-(void)navibarLeftBtnClick;
- (void)navibarLeftBtnTitle:(UIButton *)LeftBtn;//左边有title的导航栏 
@end

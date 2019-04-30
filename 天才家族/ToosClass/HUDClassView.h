//
//  HUDClassView.h
//  优站
//
//  Created by 优站创意 on 2017/6/29.
//  Copyright © 2017年 优站创意. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HUDClassView : UIView
+ (HUDClassView *)sharedManager;
//展示动画菊花视图
- (void)showHUD:(NSString *)text icon:(NSString *)icon;
//隐藏菊花视图
-(void)HUDhideView;
//无数据记载失败的图片
- (void)AddNODataImageView:(UIView *)view;

@property (nonatomic,strong)UIImageView * NoDataImageView;
@end

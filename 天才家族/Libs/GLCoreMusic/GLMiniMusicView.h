//
//  GLMiniMusicView.h
//  GLMusicBox
//
//  Created by 高磊 on 2017/11/10.
//  Copyright © 2017年 高磊. All rights reserved.
//  小圆形播放器指示器

#import <UIKit/UIKit.h>
#import "GLSlider.h"

@interface GLMiniMusicView : UIView

+ (instancetype)shareInstance;

/*
 进度条
 */
@property (strong, nonatomic)GLSlider *slider;
//头图
@property (nonatomic,strong) UIImageView *imageView;
//歌曲名
@property (nonatomic,strong) UILabel *titleLable;
//播放暂停控制按钮
@property (nonatomic,strong) UIButton *palyButton;
//关闭按钮
@property (nonatomic,strong) UIButton *cancelButton;
/**
 *
 展示
 *
 **/
- (void)showView;

/**
 *
 隐藏
 *
 **/
- (void)hiddenView;

@end

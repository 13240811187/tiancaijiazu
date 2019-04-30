//
//  GLMiniMusicView.m
//  GLMusicBox
//
//  Created by 高磊 on 2017/11/10.
//  Copyright © 2017年 高磊. All rights reserved.
//

#import "GLMiniMusicView.h"
#import "GLMusicPlayer.h"
#import "AppDelegate.h"
#import "Function.h"
#import "ColorDefine.h"
#import "Header.h"
#import "LearningMusicViewController.h"
static CGFloat const kShowBarHeight = 40;
static CGFloat const kMiniMusicImageWidth = 30;
static CGFloat const kMiniMusicImageHeight = 30;
static CGFloat const kMiniMusicPlayWidth = 32;
static CGFloat const kMiniMusicPlayHeight = 32;

@interface GLMiniMusicView()<UIGestureRecognizerDelegate>

@property (nonatomic,strong) UITapGestureRecognizer *tapGesture;
@property (nonatomic,strong)NSString * selectedStr;

@end

@implementation GLMiniMusicView

+ (instancetype)shareInstance
{
    static GLMiniMusicView *miniMusicView = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        miniMusicView = [[GLMiniMusicView alloc] initWithFrame:CGRectMake(-SCWIDTH+16,SCHEIGHT-tabbarHeight-kShowBarHeight-10, kScreenWidth-32, kShowBarHeight)];
    
    });
    
    return miniMusicView;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    
        [APP.window addSubview:self];
        self.selectedStr = @"3";
        self.backgroundColor = [UIColor colorWithRed:123/255.0 green:130/255.0 blue:143/255.0 alpha:1.0];
        self.layer.cornerRadius = 22;
        [self addViews];
        [self addViewConstraint];
        
        self.tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapTouch:)];
        self.tapGesture.delegate = (id)self;
        [self addGestureRecognizer:self.tapGesture];
    }
    return self;
}

- (void)addViews
{
    [self addSubview:self.cancelButton];
    
    
    [self addSubview:self.imageView];
    
    self.imageView.backgroundColor = [UIColor redColor];
    
    [self addSubview:self.titleLable];
    
    self.titleLable.backgroundColor = [UIColor redColor];
    
     [self addSubview:self.slider];
    
    [self.slider.thumbLayer setContents:(id)[UIImage imageNamed:@""].CGImage];
    
      //self.slider.backgroundColor = [UIColor blackColor];
    
    [self addSubview:self.palyButton];
    
      self.palyButton.backgroundColor = [UIColor redColor];
}

- (void)addViewConstraint
{
    
    WeakSelf;
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
          make.size.mas_equalTo(CGSizeMake(kMiniMusicImageWidth, kMiniMusicImageHeight));
          make.left.mas_equalTo(weakSelf.mas_left).offset(20);
          make.centerY.equalTo(weakSelf);
    }];
    
   
    [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.imageView.mas_right).offset(20);
        make.right.mas_equalTo(weakSelf.palyButton.mas_left).offset(-20);
        make.top.mas_equalTo(weakSelf.mas_top).offset(0);
        make.bottom.mas_equalTo(weakSelf.mas_bottom).offset(-20);
        
    }];
    
    

    [self.slider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.imageView.mas_right).offset(20);
        make.right.mas_equalTo(self.palyButton.mas_left).offset(-20);
        make.top.mas_equalTo(self.titleLable.mas_bottom).offset(0);
        make.bottom.mas_equalTo(weakSelf.mas_bottom).offset(0);

    }];
    
    
    
    [self.palyButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(kMiniMusicPlayWidth, kMiniMusicPlayHeight));
        make.right.mas_equalTo(weakSelf.mas_right).offset(-20);
        make.centerY.equalTo(weakSelf);
        
    }];
    
    
}


#pragma mark == UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if ([touch.view isKindOfClass:[UIButton class]])
    {
        return NO;
    }
    return YES;
}


#pragma mark == event response
- (void)tapTouch:(UITapGestureRecognizer *)tap
{
    UIViewController *vc = nil;
    if ([APP.window.rootViewController isKindOfClass:[UINavigationController class]]) {
        vc = ((UINavigationController *)APP.window.rootViewController).topViewController;
        
    }else if ([APP.window.rootViewController isKindOfClass:[UIViewController class]]){
        vc = ((UIViewController *)APP.window.rootViewController);
        
    }
    
//    if ([GLMusicPlayer defaultPlayer].currentTitle.length == 0) {
//        UIAlertController *alter = [UIAlertController alertControllerWithTitle:@"提示" message:@"你还没有播放歌曲" preferredStyle:UIAlertControllerStyleAlert];
//        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
//
//        }];
//        [alter addAction:action];
//
//        [vc presentViewController:alter animated:YES completion:^{
//
//        }];
//        return;
//    }
//
  
   
    //[self hiddenView];
    
     [GLMiniMusicView shareInstance].frame = CGRectMake(-SCWIDTH,SCHEIGHT-tabbarHeight-kShowBarHeight-10, kScreenWidth, kShowBarHeight);
    
    
     LearningMusicViewController *playerVc = [[LearningMusicViewController alloc] init];
 
     playerVc.selectedStr = self.selectedStr;
     [vc presentViewController:playerVc animated:YES completion:nil];


}

- (void)play:(UIButton *)sender
{
//    if ([GLMusicPlayer defaultPlayer].currentTitle.length == 0) {
//        return;
//    }
    sender.selected = !sender.selected;
    //pause对应pause
    /*
     如果流播放，则在调用暂停时暂停流播放。
     否则(流暂停)，调用暂停将继续播放。
     */
    [[GLMusicPlayer defaultPlayer] pause];
    
 
    if (sender.selected == YES) {
        self.selectedStr = @"1";
    }else{
         self.selectedStr = @"2";
    }

    
}


#pragma mark == public method
- (void)showView
{
    
    //self.hidden = NO;
    
   // [APP.window addSubview:self];
    
    
    [UIView animateWithDuration:0.1 animations:^{
        
        [GLMiniMusicView shareInstance].frame = CGRectMake(0,SCHEIGHT-tabbarHeight-kShowBarHeight-10, kScreenWidth, kShowBarHeight);
        
        
    }];
    
    
    
}

- (void)hiddenView
{

    //self.hidden = YES;
    //[self removeFromSuperview];
    
    [UIView animateWithDuration:0.1 animations:^{
        
        [GLMiniMusicView shareInstance].frame = CGRectMake(-SCWIDTH,SCHEIGHT-tabbarHeight-kShowBarHeight-10, kScreenWidth, kShowBarHeight);
        
        
    }];
    

    
}

#pragma mark == 懒加载
- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        //_imageView.image = [UIImage imageNamed:@"rr_recent"];
        //设置圆角 当然可以选择设置cornerRadius
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, kMiniMusicImageWidth, kMiniMusicImageHeight) cornerRadius:kMiniMusicImageWidth/2.0];
        CAShapeLayer *shapeLayer = [[CAShapeLayer alloc] init];
        shapeLayer.frame = CGRectMake(0, 0, kMiniMusicImageWidth, kMiniMusicImageHeight);
        shapeLayer.path = path.CGPath;
        _imageView.layer.mask = shapeLayer;
    }
    return _imageView;
}

- (UILabel *)titleLable
{
    if (!_titleLable) {
        _titleLable = [[UILabel alloc] init];
        _titleLable.font = [UIFont systemFontOfSize:14];
        _titleLable.textColor = UICOLOR_FROM_RGB(45, 185, 105);
        //_titleLable.text = @"当前暂无歌曲~";
    }
    return _titleLable;
}



- (GLSlider *)slider{
    
    
    if (!_slider) {
        
        _slider = [[GLSlider alloc] init];
        
    }
    
    return _slider;
}


- (UIButton *)palyButton
{
    if (!_palyButton) {
        _palyButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_palyButton setImage:[UIImage imageNamed:@"player_btn_play_normal"] forState:UIControlStateNormal];
        [_palyButton setImage:[UIImage imageNamed:@"player_btn_pause_normal"] forState:UIControlStateSelected];
        [_palyButton addTarget:self action:@selector(play:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _palyButton;
}
-(UIButton *)cancelButton{
    if (!_cancelButton) {
        _cancelButton = [UIButton new];
    }
    return _cancelButton;
}
@end

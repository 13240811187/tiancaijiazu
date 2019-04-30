//
//  HomeViewController.m
//  天才家族
//
//  Created by iOS on 2019/4/22.
//  Copyright © 2019 iOS. All rights reserved.
//
#import <LBLelinkKit/LBLelinkKit.h>
#import "HomeViewController.h"
#import "Header.h"
#import "AppDelegate.h"
#import "LearningMusicViewController.h"
static NSString *kVideoCover = @"https://upload-images.jianshu.io/upload_images/635942-14593722fe3f0695.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240";
@interface HomeViewController ()<ZFPortraitControlViewTVbtnDelegate,GLMusicPlayerDelegate,GLMusicPlayerControlViewDelegate,LBLelinkBrowserDelegate>


@property (nonatomic, strong)LBLelinkBrowser * lelinkBrowser;
@property (nonatomic, strong) ZFPlayerController *player;
@property (nonatomic, strong) UIImageView * fatherContainerView;
@property (nonatomic, strong) ZFPlayerControlView *controlView;
@property (nonatomic, strong) UIButton *playBtn;
@property (nonatomic, strong) UIButton *changeBtn;
@property (nonatomic, strong) UIButton *nextBtn;
@property (nonatomic, strong) NSArray <NSURL *>*assetURLs;
@property (nonatomic,strong) GLMusicPlayerControlView *playerControlView;


@property (nonatomic, strong) UIButton *musBtn;

@property (nonatomic, assign) NSInteger mus;

@end

@implementation HomeViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
   // self.player.viewControllerDisappear = NO;
      [GLMusicPlayer defaultPlayer].glPlayerDelegate = self;//j解析歌词的代理方法
//     [[GLMusicPlayer defaultPlayer] play];
//     self.playerControlView.palyMusicButton.selected = YES;
    
  [[GLMiniMusicView shareInstance] showView];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
     self.player.viewControllerDisappear = YES;
     [GLMusicPlayer defaultPlayer].glPlayerDelegate = nil;

//     [[GLMusicPlayer defaultPlayer] stop];
//     self.playerControlView.palyMusicButton.selected = NO;
//

}


- (void)viewDidLoad {
    [super viewDidLoad];
     self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"首页";
    [self creatUI];
    
      self.mus = 1;
    
      self.player.assetURLs = self.assetURLs;
    
     [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(GLMiniMusicViewpalyButton:) name:@"GLMiniMusicViewpalyButtonnotification" object:nil];
    

    
   
     self.playerControlView.delegate = self;
    
    [self.view addSubview:self.playerControlView];
    
    

    
    [GLMusicPlayer defaultPlayer].loopState = GLForeverLoop;
    [GLMusicPlayer defaultPlayer].musicListArray = [NSMutableArray arrayWithObjects:@"http://mpge.5nd.com/2009/2009a/x/24352/1.mp3",@"http://mpge.5nd.com/2007/h/20075225298269/52989152.mp3",@"http://mpge.5nd.com/2015/2015-5-6/66943/14.mp3", nil];
   // [[GLMusicPlayer defaultPlayer] playMusicAtIndex:0];
    
    
       //[[GLMusicPlayer defaultPlayer] stop];
    
//    BOOL playing = [GLMusicPlayer defaultPlayer].isPlaying;
//
//    if (!playing) {
//
//        [[GLMusicPlayer defaultPlayer] pause];
//    }

    
    UIButton * musBtn = [[UIButton alloc] initWithFrame:CGRectMake(0,200,40,40)];
    musBtn.backgroundColor = [UIColor yellowColor];
    [musBtn addTarget:self action:@selector(musBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    //  [self.view addSubview:self.musBtn];
    
    [[[UIApplication sharedApplication] keyWindow] addSubview:musBtn];
    
    
    
    
    
    UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(20,50,40,40)];
    
    //btn.backgroundColor = purpleColor;
    
    [btn addTarget:self action:@selector(btnclick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
    
    
    self.lelinkBrowser = [[LBLelinkBrowser alloc] init];
    self.lelinkBrowser.delegate = self;
    [self.lelinkBrowser searchForLelinkService];
    
    
    
}




- (void)btnclick{
    
    
    
    LearningMusicViewController *playerVc = [[LearningMusicViewController alloc] init];
    
    
//    CATransition* transition = [CATransition animation];
//
//    transition.duration =0.4f;
//
//    transition.type = kCATransitionMoveIn;
//
//    transition.subtype = kCATransitionFromTop;
//
//    [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
//
//    [self.navigationController pushViewController:playerVc animated:NO];

    [self presentViewController:playerVc animated:YES completion:^{
        
        [GLMusicPlayer defaultPlayer].loopState = GLForeverLoop;
        [GLMusicPlayer defaultPlayer].musicListArray = [NSMutableArray arrayWithObjects:@"http://mpge.5nd.com/2009/2009a/x/24352/1.mp3",@"http://mpge.5nd.com/2007/h/20075225298269/52989152.mp3",@"http://mpge.5nd.com/2015/2015-5-6/66943/14.mp3", nil];
        
        [[GLMusicPlayer defaultPlayer] playMusicAtIndex:0];
    
    }];

    
}


- (void)GLMiniMusicViewpalyButton:(NSNotification*)n{
    
    NSString * str = n.object[@"selected"];
    
    if ([str isEqualToString:@"1"]) {
        
       self.playerControlView.palyMusicButton.selected = YES;
        
    }else{
     
        self.playerControlView.palyMusicButton.selected = NO;
    }
    
}

#pragma mark - LBLelinkBrowserDelegate




- (void)musBtnClick:(UIButton *)sender{
    
     //[[GLMusicPlayer defaultPlayer] playMusicAtIndex:2];
    
    if (sender.selected == NO) {
          [[GLMiniMusicView shareInstance] hiddenView];
          sender.selected = YES;
    }else{
        
       
        [[GLMiniMusicView shareInstance] showView];
         sender.selected = NO;
        
    }
    
    
    
   
    
}


#pragma -- mark 音频的代理
- (void)palyMusicButtonClick{
    
//     [[GLMusicPlayer defaultPlayer] play];
    if (self.mus == 1) {
        
        [[GLMusicPlayer defaultPlayer] playMusicAtIndex:0];
    }
    
    self.mus++;
    
}



- (void)creatUI{
 
    [self.view addSubview:self.fatherContainerView];
    
    [self.fatherContainerView addSubview:self.playBtn];
  
    
    [self.view addSubview:self.changeBtn];
    [self.view addSubview:self.nextBtn];
    
    ZFAVPlayerManager *playerManager = [[ZFAVPlayerManager alloc] init];
    //    KSMediaPlayerManager *playerManager = [[KSMediaPlayerManager alloc] init];
    //    ZFIJKPlayerManager *playerManager = [[ZFIJKPlayerManager alloc] init];
    
    /// 播放器相关
    self.player = [ZFPlayerController playerWithPlayerManager:playerManager containerView:self.fatherContainerView];//player 加到containerView 上
    
    self.player.controlView = self.controlView;
    /// 设置退到后台继续播放
    self.player.pauseWhenAppResignActive = NO;

    self.controlView.TVbtnDelegate = self;
    
    //当屏幕发生改变时（竖屏isFullScreen = NO; 横屏isFullScreen = YES; ）
    @weakify(self)
    self.player.orientationWillChange = ^(ZFPlayerController * _Nonnull player, BOOL isFullScreen) {
        @strongify(self)
        [self setNeedsStatusBarAppearanceUpdate];
        
    };
    
    /// 播放完成
    self.player.playerDidToEnd = ^(id  _Nonnull asset) {
        @strongify(self)
        [self.player.currentPlayerManager replay];
        [self.player playTheNext];
        if (!self.player.isLastAssetURL) {
            NSString *title = [NSString stringWithFormat:@"视频标题%zd",self.player.currentPlayIndex];
            [self.controlView showTitle:title coverURLString:kVideoCover fullScreenMode:ZFFullScreenModeLandscape];
        } else {
            [self.player stop];
        }
    };
    
    //map3 //http://sc1.111ttt.cn:8282/2018/1/03/13/396131232171.mp3?tflag=1546606800&pin=97bb2268ae26c20fe093fd5b0f04be80
    
    self.assetURLs = @[[NSURL URLWithString:@"https://www.apple.com/105/media/us/iphone-x/2017/01df5b43-28e4-4848-bf20-490c34a926a7/films/feature/iphone-x-feature-tpl-cc-us-20170912_1280x720h.mp4"],
                       [NSURL URLWithString:@"https://www.apple.com/105/media/cn/mac/family/2018/46c4b917_abfd_45a3_9b51_4e3054191797/films/bruce/mac-bruce-tpl-cn-2018_1280x720h.mp4"],
                       [NSURL URLWithString:@"https://www.apple.com/105/media/us/mac/family/2018/46c4b917_abfd_45a3_9b51_4e3054191797/films/peter/mac-peter-tpl-cc-us-2018_1280x720h.mp4"],
                       [NSURL URLWithString:@"https://www.apple.com/105/media/us/mac/family/2018/46c4b917_abfd_45a3_9b51_4e3054191797/films/grimes/mac-grimes-tpl-cc-us-2018_1280x720h.mp4"],
                       [NSURL URLWithString:@"http://flv3.bn.netease.com/tvmrepo/2018/6/H/9/EDJTRBEH9/SD/EDJTRBEH9-mobile.mp4"],
                       [NSURL URLWithString:@"http://flv3.bn.netease.com/tvmrepo/2018/6/9/R/EDJTRAD9R/SD/EDJTRAD9R-mobile.mp4"],
                       [NSURL URLWithString:@"http://www.flashls.org/playlists/test_001/stream_1000k_48k_640x360.m3u8"],
                       [NSURL URLWithString:@"http://tb-video.bdstatic.com/tieba-video/7_517c8948b166655ad5cfb563cc7fbd8e.mp4"],
                       [NSURL URLWithString:@"http://tb-video.bdstatic.com/tieba-smallvideo/68_20df3a646ab5357464cd819ea987763a.mp4"],
                       [NSURL URLWithString:@"http://tb-video.bdstatic.com/tieba-smallvideo/118_570ed13707b2ccee1057099185b115bf.mp4"],
                       [NSURL URLWithString:@"http://tb-video.bdstatic.com/tieba-smallvideo/15_ad895ac5fb21e5e7655556abee3775f8.mp4"],
                       [NSURL URLWithString:@"http://tb-video.bdstatic.com/tieba-smallvideo/12_cc75b3fb04b8a23546d62e3f56619e85.mp4"],
                       [NSURL URLWithString:@"http://tb-video.bdstatic.com/tieba-smallvideo/5_6d3243c354755b781f6cc80f60756ee5.mp4"],
                       [NSURL URLWithString:@"http://tb-video.bdstatic.com/tieba-movideo/11233547_ac127ce9e993877dce0eebceaa04d6c2_593d93a619b0.mp4"]];
    
  
    
    
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = CGRectGetWidth(self.view.frame);
    CGFloat h =  w*9/16;
    self.fatherContainerView.frame = CGRectMake(x, y, w, h);
    
    w = 44;
    h = w;
    x = (CGRectGetWidth(self.fatherContainerView.frame)-w)/2;
    y = (CGRectGetHeight(self.fatherContainerView.frame)-h)/2;
    self.playBtn.frame = CGRectMake(x, y, w, h);
    
    w = 100;
    h = 30;
    x = (CGRectGetWidth(self.view.frame)-w)/2;
    y = CGRectGetMaxY(self.fatherContainerView.frame)+50;
    self.changeBtn.frame = CGRectMake(x, y, w, h);
    
    w = 100;
    h = 30;
    x = (CGRectGetWidth(self.view.frame)-w)/2;
    y = CGRectGetMaxY(self.changeBtn.frame)+50;
    self.nextBtn.frame = CGRectMake(x, y, w, h);
    
    
}

- (void)changeVideo:(UIButton *)sender {
    NSString *URLString = @"https://www.apple.com/105/media/cn/mac/family/2018/46c4b917_abfd_45a3_9b51_4e3054191797/films/bruce/mac-bruce-tpl-cn-2018_1280x720h.mp4";
    self.player.assetURL = [NSURL URLWithString:URLString];
    [self.controlView showTitle:@"Apple" coverURLString:kVideoCover fullScreenMode:ZFFullScreenModeAutomatic];
}

- (void)playClick:(UIButton *)sender {
    [self.player playTheIndex:0];
    [self.controlView showTitle:@"视频标题" coverURLString:kVideoCover fullScreenMode:ZFFullScreenModeAutomatic];
}

- (void)nextClick:(UIButton *)sender {
    if (!self.player.isLastAssetURL) {
        [self.player playTheNext];
        NSString *title = [NSString stringWithFormat:@"视频标题%zd",self.player.currentPlayIndex];
        [self.controlView showTitle:title coverURLString:kVideoCover fullScreenMode:ZFFullScreenModeAutomatic];
    } else {
        NSLog(@"最后一个视频了");
    }
}


//tv 投屏按钮代理
- (void)ZFPortraitControlViewTVbtnClick{
    
    NSLog(@"hahhahhahhah");
    
}


- (UIStatusBarStyle)preferredStatusBarStyle {
    if (self.player.isFullScreen) {
        return UIStatusBarStyleLightContent;
    }
    return UIStatusBarStyleDefault;
}

- (BOOL)prefersStatusBarHidden {
    /// 如果只是支持iOS9+ 那直接return NO即可，这里为了适配iOS8
    return self.player.isStatusBarHidden;
}

- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation {
    return UIStatusBarAnimationSlide;
}

- (BOOL)shouldAutorotate {
    return self.player.shouldAutorotate;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    if (self.player.isFullScreen) {
        return UIInterfaceOrientationMaskLandscape;
    }
    return UIInterfaceOrientationMaskPortrait;
}



- (ZFPlayerControlView *)controlView {
    if (!_controlView) {
        _controlView = [ZFPlayerControlView new];
        _controlView.fastViewAnimated = YES;
        _controlView.autoHiddenTimeInterval = 5;
        _controlView.autoFadeTimeInterval = 0.5;
        _controlView.prepareShowLoading = YES;
    }
    return _controlView;
}

- (UIImageView *)fatherContainerView {
    if (!_fatherContainerView) {
        _fatherContainerView = [UIImageView new];
        [_fatherContainerView setImageWithURLString:kVideoCover placeholder:[ZFUtilities imageWithColor:[UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1] size:CGSizeMake(1, 1)]];
    }
    return _fatherContainerView;
}



- (UIButton *)playBtn {
    if (!_playBtn) {
        _playBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_playBtn setImage:ZFPlayer_Image(@"new_allPlay_44x44_") forState:UIControlStateNormal];
        [_playBtn addTarget:self action:@selector(playClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _playBtn;
}




- (UIButton *)changeBtn {
    if (!_changeBtn) {
        _changeBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_changeBtn setTitle:@"Change video" forState:UIControlStateNormal];
        [_changeBtn addTarget:self action:@selector(changeVideo:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _changeBtn;
}

- (UIButton *)nextBtn {
    if (!_nextBtn) {
        _nextBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_nextBtn setTitle:@"Next" forState:UIControlStateNormal];
        [_nextBtn addTarget:self action:@selector(nextClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _nextBtn;
}







#pragma mark == GLMusicPlayerDelegate
- (void)updateProgressWithCurrentPosition:(FSStreamPosition)currentPosition endPosition:(FSStreamPosition)endPosition
{
    //更新进度条
    self.playerControlView.slider.value = currentPosition.position;
    
    self.playerControlView.leftTimeLable.text = [NSString translationWithMinutes:currentPosition.minute seconds:currentPosition.second];
    self.playerControlView.rightTimeLable.text = [NSString translationWithMinutes:endPosition.minute seconds:endPosition.second];
    
    
    
    [ [GLMiniMusicView shareInstance].imageView sd_setImageWithURL:[NSURL URLWithString:@"http://image.biaobaiju.com/uploads/20180707/05/1530913455-KXxOTeLbGm.jpg"] placeholderImage:[UIImage SDplaceholderImage] options:SDWebImageRetryFailed];
  
      [GLMiniMusicView shareInstance].titleLable.text = @"翩翩起舞";
      [GLMiniMusicView shareInstance].slider.value = currentPosition.position;
    
    
    
    
}


- (GLMusicPlayerControlView*)playerControlView
{
    if (nil == _playerControlView) {
     
        _playerControlView = [[GLMusicPlayerControlView alloc] initWithFrame:CGRectMake(0 ,SCHEIGHT-120-StatusBar-NavRect-tabbarHeight-50,SCWIDTH, 120)];
        
        _playerControlView.backgroundColor = [UIColor redColor];
    }
    return _playerControlView;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

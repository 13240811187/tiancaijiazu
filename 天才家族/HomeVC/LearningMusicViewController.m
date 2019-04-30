//
//  LearningMusicViewController.m
//  天才家族
//
//  Created by iOS on 2019/4/25.
//  Copyright © 2019 iOS. All rights reserved.
//

#import "LearningMusicViewController.h"
#import "Header.h"
@interface LearningMusicViewController ()<GLMusicPlayerControlViewDelegate,GLMusicPlayerDelegate>
@property(nonatomic,strong)UIButton * backBtn;

@property (nonatomic,strong) GLMusicPlayerControlView *playerControlView;

@end

@implementation LearningMusicViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [GLMusicPlayer defaultPlayer].glPlayerDelegate = self;
  
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
  
    [GLMusicPlayer defaultPlayer].glPlayerDelegate = nil;
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:self.backBtn];
    
    
   

    
    
    self.playerControlView.delegate = self;
    [self.view addSubview:self.playerControlView];
    
    
    
    
//    [GLMusicPlayer defaultPlayer].loopState = GLForeverLoop;
//    [GLMusicPlayer defaultPlayer].musicListArray = [NSMutableArray arrayWithObjects:@"http://mpge.5nd.com/2009/2009a/x/24352/1.mp3",@"http://mpge.5nd.com/2007/h/20075225298269/52989152.mp3",@"http://mpge.5nd.com/2015/2015-5-6/66943/14.mp3", nil];
//    // [[GLMusicPlayer defaultPlayer] playMusicAtIndex:0];
//
    
    
    //[[GLMusicPlayer defaultPlayer] stop];
    
    //    BOOL playing = [GLMusicPlayer defaultPlayer].isPlaying;
    //
    //    if (!playing) {
    //
    //        [[GLMusicPlayer defaultPlayer] pause];
    //    }

    
    
    if ([self.selectedStr isEqualToString:@"1"]) {
        
        //self.playerControlView.palyMusicButton.selected = YES;
        
        [self.playerControlView.palyMusicButton setImage:[UIImage imageNamed:@"player_btn_pause_normal"] forState:UIControlStateNormal];

        
    }else if([self.selectedStr isEqualToString:@"2"]){
        
        //  self.playerControlView.palyMusicButton.selected = NO;
        
        [self.playerControlView.palyMusicButton setImage:[UIImage imageNamed:@"player_btn_play_normal"] forState:UIControlStateNormal];
        
    }else{
        
        
        
    }
    
    

    
    
    
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




- (void)backBtn:(UIButton *)btn{
 
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


- (UIButton *)backBtn
{
    if (!_backBtn) {
     
        _backBtn = [[UIButton alloc] initWithFrame:CGRectMake(15,StatusBar,40,40)];
        [_backBtn setImage:[UIImage imageNamed:@"player_btn_close_normal"] forState:UIControlStateNormal];
        [_backBtn setImage:[UIImage imageNamed:@"player_btn_close_normal"] forState:UIControlStateSelected];
        [_backBtn addTarget:self action:@selector(backBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backBtn;
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

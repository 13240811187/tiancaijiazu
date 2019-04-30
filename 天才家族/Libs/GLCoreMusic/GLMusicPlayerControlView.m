//
//  GLMusicPlayerControlView.m
//  GLMusicBox
//
//  Created by iOS on 2019/4/24.
//  Copyright © 2019 高磊. All rights reserved.
//

#import "GLMusicPlayerControlView.h"
#import "GLSlider.h"
#import "FSAudioStream.h"
#import "GLMusicPlayer.h"
#import "Header.h"
@interface GLMusicPlayerControlView ()

@property (nonatomic,strong)UIButton *playModeButton;
//前一首歌曲
@property (nonatomic,strong)UIButton *frontMusicButton;
//下一首
@property (nonatomic,strong)UIButton *nextMusicButton;

@property (nonatomic,assign) GLLoopState loopSate;

@end

@implementation GLMusicPlayerControlView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self creatui];
        
        
        self.leftTimeLable.text = @"00:00";
        
        self.rightTimeLable.text = @"03:00";
        
        [self.slider addTarget:self action:@selector(sliderValueChange:) forControlEvents:UIControlEventValueChanged];
        
        self.loopSate = GLForeverLoop;
        
        [self.playModeButton setImage:[UIImage imageNamed:@"miniplayer_btn_repeat_normal"] forState:UIControlStateNormal];
        [self.playModeButton setImage:[UIImage imageNamed:@"miniplayer_btn_repeat_highlight"] forState:UIControlStateHighlighted];
        
    }
    return self;
}

- (void)creatui{
    
    [self addSubview:self.leftTimeLable];
    [self addSubview:self.slider];
    [self addSubview:self.rightTimeLable];
    [self addSubview:self.playModeButton];
    
    [self addSubview:self.frontMusicButton];
    
    [self addSubview:self.palyMusicButton];
    
    [self addSubview:self.nextMusicButton];
    
    
}




#pragma mark == event responder
- (void)sliderValueChange:(GLSlider *)slider
{
    FSStreamPosition position = {};
    unsigned totalSeconds = [GLMusicPlayer defaultPlayer].duration.minute*60 + [GLMusicPlayer defaultPlayer].duration.second;
    unsigned currentSeconds = totalSeconds * slider.value;

    position.second = currentSeconds % 60;
    position.minute = currentSeconds / 60;

    [[GLMusicPlayer defaultPlayer] seekToPosition:position];
}

- (void)frontMusic:(UIButton *)sender
{
    [[GLMusicPlayer defaultPlayer] playFont];
}

- (void)play:(UIButton *)sender
{
    
//    if (self.delegate&&[self.delegate respondsToSelector:@selector(palyMusicButtonClick)]) {
//
//        [self.delegate palyMusicButtonClick];
//
//    }
    
   // sender.selected = !sender.selected;
    //pause对应pause
    /*
     如果流播放，则在调用暂停时暂停流播放。
     否则(流暂停)，调用暂停将继续播放。
     */
  


    if (sender.selected == NO) {

        
//        [[GLMusicPlayer defaultPlayer] play];
        
        [self.palyMusicButton setImage:[UIImage imageNamed:@"player_btn_play_normal"] forState:UIControlStateNormal];
        
        
         [[GLMusicPlayer defaultPlayer] play];
        
        sender.selected = YES;

    }else{
       // [[GLMusicPlayer defaultPlayer] stop];
        

           [self.palyMusicButton setImage:[UIImage imageNamed:@"player_btn_pause_normal"] forState:UIControlStateNormal];
          [[GLMusicPlayer defaultPlayer] pause];
         sender.selected = NO;
    }


  

}

- (void)nextMusic:(UIButton *)sender
{
    [[GLMusicPlayer defaultPlayer] playNext];
}

- (void)changePlayMode:(UIButton *)sender
{
    switch (self.loopSate) {
        case GLSingleLoop:
        {
            self.loopSate = GLForeverLoop;
            [self.playModeButton setImage:[UIImage imageNamed:@"miniplayer_btn_repeat_normal"] forState:UIControlStateNormal];
            [self.playModeButton setImage:[UIImage imageNamed:@"miniplayer_btn_repeat_highlight"] forState:UIControlStateHighlighted];
        }
            break;
        case GLForeverLoop:
        {
            self.loopSate = GLRandomLoop;
            [self.playModeButton setImage:[UIImage imageNamed:@"miniplayer_btn_random_normal"] forState:UIControlStateNormal];
            [self.playModeButton setImage:[UIImage imageNamed:@"miniplayer_btn_random_highlight"] forState:UIControlStateHighlighted];
        }
            break;
        case GLRandomLoop:
        {
            self.loopSate = GLOnceLoop;
            [self.playModeButton setImage:[UIImage imageNamed:@"miniplayer_btn_repeat_onece_normal"] forState:UIControlStateNormal];
            [self.playModeButton setImage:[UIImage imageNamed:@"miniplayer_btn_repeat_once_highlight"] forState:UIControlStateHighlighted];
        }
            break;
        case GLOnceLoop:
        {
            self.loopSate = GLSingleLoop;
            [self.playModeButton setImage:[UIImage imageNamed:@"miniplayer_btn_repeatone_normal"] forState:UIControlStateNormal];
            [self.playModeButton setImage:[UIImage imageNamed:@"miniplayer_btn_repeatone_highlight"] forState:UIControlStateHighlighted];
        }
            break;
        default:
            break;
    }

    [GLMusicPlayer defaultPlayer].loopState = self.loopSate;
}



- (UILabel *)leftTimeLable{
    
    
    if (!_leftTimeLable) {
        
        _leftTimeLable = [[UILabel alloc] initWithFrame:CGRectMake(16,19, 42, 21)];
        _leftTimeLable.font = [UIFont systemFontOfSize:12.0f];
        _leftTimeLable.textAlignment = NSTextAlignmentLeft;
        _leftTimeLable.textColor = [UIColor lightGrayColor];
        
    }
    
    return _leftTimeLable;
}



- (GLSlider *)slider{
    
    
    if (!_slider) {
        
        _slider = [[GLSlider alloc] initWithFrame:CGRectMake(self.leftTimeLable.right + 9,16,SCWIDTH-16*2-42*2-9*2, 26)];
        
    }
    
    return _slider;
}




- (UILabel *)rightTimeLable{
    
    
    if (!_rightTimeLable) {
        
        _rightTimeLable = [[UILabel alloc] initWithFrame:CGRectMake(SCWIDTH-16-42,self.leftTimeLable.y,42, 21)];
        _rightTimeLable.font = [UIFont systemFontOfSize:12.0f];
        _rightTimeLable.textAlignment = NSTextAlignmentLeft;
        _rightTimeLable.textColor = [UIColor lightGrayColor];
        
    }
    
    return _rightTimeLable;
}





- (UIButton *)playModeButton{
    
    if (!_playModeButton) {
        
        _playModeButton = [[UIButton alloc] initWithFrame:CGRectMake(self.leftTimeLable.x,self.leftTimeLable.bottom+15,60,50)];
        
        [_playModeButton setImage:[UIImage imageNamed:@"miniplayer_btn_repeat_normal"] forState:UIControlStateNormal];
        
        [_playModeButton addTarget:self action:@selector(changePlayMode:) forControlEvents:UIControlEventTouchUpInside];
        
        
    }
    
    return _playModeButton;
    
}


- (UIButton *)frontMusicButton{
    
    if (!_frontMusicButton) {
        
        _frontMusicButton = [[UIButton alloc] initWithFrame:CGRectMake(self.playModeButton.right,0,66,64)];
        
        _frontMusicButton.centerY = self.playModeButton.centerY;
        
        [_frontMusicButton setImage:[UIImage imageNamed:@"player_btn_pre_normal"] forState:UIControlStateNormal];
        
        [_frontMusicButton addTarget:self action:@selector(frontMusic:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    return _frontMusicButton;
    
}




- (UIButton *)palyMusicButton{
    
    if (!_palyMusicButton) {
        
        _palyMusicButton = [[UIButton alloc] initWithFrame:CGRectMake(self.frontMusicButton.right+15,0,66,64)];
        
        _palyMusicButton.centerY = self.playModeButton.centerY;
        
        [_palyMusicButton setImage:[UIImage imageNamed:@"player_btn_play_normal"] forState:UIControlStateNormal];
        
        [_palyMusicButton addTarget:self action:@selector(play:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    return _palyMusicButton;
    
}



- (UIButton *)nextMusicButton{
    
    if (!_nextMusicButton) {
        
        _nextMusicButton = [[UIButton alloc] initWithFrame:CGRectMake(self.palyMusicButton.right+15,0,66,64)];
        
        _nextMusicButton.centerY = self.playModeButton.centerY;
        
        [_nextMusicButton setImage:[UIImage imageNamed:@"player_btn_next_normal"] forState:UIControlStateNormal];
        
        [_nextMusicButton addTarget:self action:@selector(nextMusic:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    return _nextMusicButton;
    
}





@end

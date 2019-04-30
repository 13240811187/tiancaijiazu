//
//  GLMusicPlayerControlView.h
//  GLMusicBox
//
//  Created by iOS on 2019/4/24.
//  Copyright © 2019 高磊. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GLSlider.h"

@protocol GLMusicPlayerControlViewDelegate <NSObject>

- (void)palyMusicButtonClick;

@end
@interface GLMusicPlayerControlView : UIView

@property(weak,nonatomic)id<GLMusicPlayerControlViewDelegate>delegate;

@property (strong, nonatomic)GLSlider *slider;
//当前播放时间
@property (strong, nonatomic)UILabel *leftTimeLable;
//总时间
@property (nonatomic,strong)UILabel *rightTimeLable;
//播放、暂停按钮
@property (nonatomic,strong)UIButton *palyMusicButton;

@end

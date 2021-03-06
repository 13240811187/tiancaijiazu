//
//  GLMusicPlayer.h
//  GLMusicBox
//
//  Created by 高磊 on 2017/10/24.
//  Copyright © 2017年 高磊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FSAudioStream.h"

@class GLMusicLRCModel;

typedef NS_ENUM(NSInteger,GLLoopState){
    GLSingleLoop = 0,//单曲循环
    GLForeverLoop,//重复循环
    GLRandomLoop,//随机播放
    GLOnceLoop//列表一次顺序播放
};
typedef enum
{
    ePlayStateUnknow = 0 , //未知
    ePlayStateBuffering ,   //正在缓冲数据准备播放
    ePlayStatePlaying ,   //正在播放
    ePlayStatePause,      //暂停
    ePlayStateStop,       //停止
    ePlayStateDone        //完成
    
}ePlayState;

@protocol GLMusicPlayerDelegate<NSObject>

/**
 *
 实时更新
 *
 **/
- (void)updateProgressWithCurrentPosition:(FSStreamPosition)currentPosition endPosition:(FSStreamPosition)endPosition;

-(void) audioPlayerdidChangeState:(ePlayState)playState;

- (void)updateMusicLrc;

@end

@interface GLMusicPlayer : FSAudioStream

@property (nonatomic,readonly) ePlayState playState;//播放状态



@property (nonatomic,readonly) double currentTime;//已播放时长

@property (nonatomic,readonly) double progress;//播放进度

@property (nonatomic,readonly) double bufferProgress;//缓冲进度
/**
 *
 播放列表
 *
 **/
@property (nonatomic,strong) NSMutableArray *musicListArray;


/**
 当前播放歌曲的歌词
 */
@property (nonatomic,strong) NSMutableArray <GLMusicLRCModel*>*musicLRCArray;

/**
 *
 当前播放
 *
 **/
@property (nonatomic,assign,readonly) NSUInteger currentIndex;

/**
 *
 当前播放的音乐的标题
 *
 **/
@property (nonatomic,strong) NSString *currentTitle;


/**
 是否是暂停状态
 */
@property (nonatomic,assign) BOOL isPause;

@property (nonatomic,weak) id<GLMusicPlayerDelegate>glPlayerDelegate;

//默认 重复循环 GLForeverLoop
@property (nonatomic,assign) GLLoopState loopState;

/**
 *
 单例播放器
 *
 **/
+ (instancetype)defaultPlayer;

/**
 播放队列中的指定的文件 

 @param index 序号
 */
- (void)playMusicAtIndex:(NSUInteger)index;

/**
 播放前一首
 */
- (void)playFont;

/**
 播放下一首
 */
- (void)playNext;



@end

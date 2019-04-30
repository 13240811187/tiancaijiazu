//
//  HomeOnlineVideoTableViewCell.m
//  天才家族
//
//  Created by iOS on 2019/4/27.
//  Copyright © 2019 iOS. All rights reserved.
//
#import "GCVideoInfoItem.h"
#import "HomeOnlineVideoTableViewCell.h"
#import "LastHomeOnlineSonVideoCollectionViewCell.h"
#import "HomeOnlineSonVideoCollectionViewCell.h"

static NSString * const HomeOnlineVideoTableViewCellplayider = @"HomeOnlineVideoTableViewCellplayider";

static NSString * const LastHomeOnlineSonVideoCollectionViewCellplayider = @"LastHomeOnlineSonVideoCollectionViewCellplayider";
@interface HomeOnlineVideoTableViewCell ()<ZFPortraitControlViewTVbtnDelegate,UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong)UIView * BGView;
@property (nonatomic,strong)UILabel * titleLabel;
@property (nonatomic, strong)NSMutableArray * dataArray;

@property (nonatomic, strong) UIImageView * fatherContainerView;//视频播放view

@property (nonatomic,strong)UIView * alphaImageView;

@property (nonatomic, strong) ZFPlayerControlView *controlView;
@property (nonatomic, strong) UIButton *playBtn;


@property (nonatomic,strong)UICollectionView *videoCollectionView;

@property (nonatomic,assign)NSInteger index;

@property (nonatomic, strong)NSIndexPath * selectedIndexPath;
@end

@implementation HomeOnlineVideoTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        
        [self creatUI];
        
      
    }
    
    return self;
}




- (void)creatUI{
    _dataArray = [NSMutableArray array];
    for (int i=0; i<4; i++) {
        GCVideoInfoItem * modele = [[GCVideoInfoItem alloc]init];
        modele.title = @"hahhah";
        [_dataArray addObject:modele];
    }
    
    
     WeakSelf;
    self.index = 0;
    
    [self.contentView addSubview:self.BGView];
    
    [self.BGView addSubview:self.titleLabel];
    
    [self.BGView addSubview:self.fatherContainerView];
    
    
    [self.fatherContainerView addSubview:self.alphaImageView];
    [self.fatherContainerView setImage:[UIImage imageNamed:@"imagedemo"]];

     [self.fatherContainerView addSubview:self.playBtn];
    
     ZFAVPlayerManager *playerManager = [[ZFAVPlayerManager alloc] init];

    
    /// 播放器相关
  self.player = [ZFPlayerController playerWithPlayerManager:playerManager containerView:self.fatherContainerView];//player 加到containerView 上
    
     self.player.controlView = self.controlView;
    /// 设置退到后台继续播放
     self.player.pauseWhenAppResignActive = NO;
    
     self.controlView.TVbtnDelegate = self;
    
   
    
     [self.BGView addSubview:self.videoCollectionView];
    
    
    //当屏幕发生改变时（竖屏isFullScreen = NO; 横屏isFullScreen = YES;
    self.player.orientationWillChange = ^(ZFPlayerController * _Nonnull player, BOOL isFullScreen) {
        
        if (weakSelf.delegate&&[weakSelf.delegate respondsToSelector:@selector(HomeOnlineVideoTableViewCellPlayerOrientationWillChange)]) {
            
            [weakSelf.delegate HomeOnlineVideoTableViewCellPlayerOrientationWillChange];
            
        }
    };
    
    
    
    /// 播放完成
    self.player.playerDidToEnd = ^(id  _Nonnull asset) {
        [weakSelf.player.currentPlayerManager replay];
        [weakSelf.player playTheNext];
        if (!weakSelf.player.isLastAssetURL) {
            //        NSString *title = [NSString stringWithFormat:@"视频标题%zd",weakSelf.player.assetURL[self.index]];
            //                                [weakSelf.controlView showTitle:title coverURLString:nil fullScreenMode:ZFFullScreenModeLandscape];
            
        } else {
            [weakSelf.player stop];
        }
    };
    
    


    self.player.assetURLs = @[[NSURL URLWithString:@"http://flv3.bn.netease.com/tvmrepo/2018/6/H/9/EDJTRBEH9/SD/EDJTRBEH9-mobile.mp4"],
                              [NSURL URLWithString:@"https://www.apple.com/105/media/cn/mac/family/2018/46c4b917_abfd_45a3_9b51_4e3054191797/films/bruce/mac-bruce-tpl-cn-2018_1280x720h.mp4"],[NSURL URLWithString:@"http://tb-video.bdstatic.com/tieba-smallvideo/5_6d3243c354755b781f6cc80f60756ee5.mp4"]];
    
    
     [self SetFirstCollectionViewCellSelected];
    
}



- (void)setVideoModel:(GCVideoInfoItem *)videoModel{
    
    self.titleLabel.text = @"试听课早教";
    
    [self.fatherContainerView setImageWithURLString:@"https://manhua.qpic.cn/operation/0/11_11_23_2a169d0cbfff4864a8888da7c378627e_1528687424498.jpg/0" placeholder:[ZFUtilities imageWithColor:[UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1] size:CGSizeMake(1, 1)]];
    
    if (self.delegate&&[self.delegate respondsToSelector:@selector(HomeOnlineVideoTableViewCellZFPlayerController:)]) {
        
        [self.delegate HomeOnlineVideoTableViewCellZFPlayerController:self.player];
        
    }
    
}




#pragma mark-- tv 按钮代理
- (void)ZFPortraitControlViewTVbtnClick{
    
    
    
}


- (void)playClick:(UIButton *)sender {
    
    [self.player playTheIndex:self.index];
    
    if (self.index==!0) {
        
        [self.controlView showTitle:@"" coverURLString:@"https://manhua.qpic.cn/operation/0/11_11_22_c4de3602c8aff83100c018fce9f52d5c_1528687357296.jpg/0" fullScreenMode:ZFFullScreenModeAutomatic];
        
    }
    
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (self.dataArray.count-1==indexPath.row) {
        LastHomeOnlineSonVideoCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:LastHomeOnlineSonVideoCollectionViewCellplayider forIndexPath:indexPath];
         return cell;
        
    }else{
      HomeOnlineSonVideoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:HomeOnlineVideoTableViewCellplayider forIndexPath:indexPath];
        if (_selectedIndexPath==indexPath) {
            [cell setCowerHidden];
        }
        return cell;
    }
    
    
    
}
-(void)SetFirstCollectionViewCellSelected{
    
    //默认选中第一个
    NSIndexPath * indexpath = [NSIndexPath indexPathForRow:0 inSection:0];
    
    _selectedIndexPath =indexpath;
    [self.videoCollectionView reloadData];
    
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    if (indexPath.row==self.dataArray.count-1) {
        //最后一个
        return ;
    }
    HomeOnlineSonVideoCollectionViewCell * beforecell = (HomeOnlineSonVideoCollectionViewCell * )[collectionView cellForItemAtIndexPath:_selectedIndexPath] ;
    [beforecell setCowerShow];
    _selectedIndexPath = indexPath ;
    
    HomeOnlineSonVideoCollectionViewCell * selectedcell = (HomeOnlineSonVideoCollectionViewCell * )[collectionView cellForItemAtIndexPath:_selectedIndexPath] ;
    
    [selectedcell setCowerHidden];
    
    //self.fatherContainerView 改变image；
    
    
    
    
    
      self.index  = indexPath.row;
      [self.controlView showTitle:@"" coverURLString:@"" fullScreenMode:ZFFullScreenModeAutomatic];
   
    
    
}

-(UIView *)alphaImageView{
    if (!_alphaImageView) {
        _alphaImageView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 343*applicationScale_iphone6, 310*applicationScale_iphone6-2)];
        _alphaImageView.backgroundColor = RGBalpha(0, 0, 0, 0.5);
    }
    return _alphaImageView;
    
}

- (UIView *)BGView{
    
    if (!_BGView) {
        _BGView = [[UIView alloc] initWithFrame:CGRectMake(16*applicationScale_iphone6,1,343*applicationScale_iphone6,310*applicationScale_iphone6-2)];
        _BGView.backgroundColor = [UIColor whiteColor];
        
        _BGView.layer.shadowColor = MainShadowColor.CGColor;//shadowColor阴影颜色
        _BGView.layer.shadowOpacity = 1;
        _BGView.layer.shadowRadius = 10;
        _BGView.layer.shadowOffset = CGSizeMake(0,2);
        
        _BGView.layer.cornerRadius = 5;
      
        
        
    }
    
    return _BGView;
}


- (UILabel *)titleLabel{
    
    if (!_titleLabel) {
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10*applicationScale_iphone6,12,self.BGView.width-20*applicationScale_iphone6,13*applicationScale_iphone6)];
        _titleLabel.font = FontPingFangSC(13);
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.textColor = MainLabelTextColor;
        
    }
    
    return _titleLabel;
}









- (UIImageView *)fatherContainerView {
    if (!_fatherContainerView) {
        _fatherContainerView = [[UIImageView alloc] initWithFrame:CGRectMake(10*applicationScale_iphone6,35*applicationScale_iphone6,self.BGView.width-20*applicationScale_iphone6, 190*applicationScale_iphone6)];
        _fatherContainerView.layer.cornerRadius = 2;
        _fatherContainerView.backgroundColor = [UIColor redColor];
        _fatherContainerView.clipsToBounds = YES;
    }
    return _fatherContainerView;
}



- (UIButton *)playBtn {
    if (!_playBtn) {
        _playBtn = [[UIButton alloc] initWithFrame:CGRectMake(147*applicationScale_iphone6,80*applicationScale_iphone6,30*applicationScale_iphone6,30*applicationScale_iphone6)];
        
      
        [_playBtn setImage:[UIImage imageNamed:@"video_play_big"] forState:UIControlStateNormal];
        [_playBtn addTarget:self action:@selector(playClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _playBtn;
}




- (UICollectionView *)videoCollectionView{
    
    if (!_videoCollectionView) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.itemSize = CGSizeMake(80*applicationScale_iphone6,70*applicationScale_iphone6);
        // 设置最小行间距
        layout.minimumLineSpacing = 5;
        // 设置垂直间距
        layout.minimumInteritemSpacing = 0;
       
       layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _videoCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(10*applicationScale_iphone6,self.BGView.height-79*applicationScale_iphone6,self.BGView.width-20*applicationScale_iphone6,74*applicationScale_iphone6) collectionViewLayout:layout];
        
        _videoCollectionView.delegate = self;
        _videoCollectionView.dataSource = self;
      
         _videoCollectionView.showsHorizontalScrollIndicator = NO;
         _videoCollectionView.showsVerticalScrollIndicator = NO;
        
        _videoCollectionView.backgroundColor = [UIColor whiteColor];
        // 注册
        [_videoCollectionView registerClass:[HomeOnlineSonVideoCollectionViewCell class] forCellWithReuseIdentifier:HomeOnlineVideoTableViewCellplayider];
          [_videoCollectionView registerClass:[LastHomeOnlineSonVideoCollectionViewCell class] forCellWithReuseIdentifier:LastHomeOnlineSonVideoCollectionViewCellplayider];
        
    }
    
    return _videoCollectionView;
    
    
}





- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

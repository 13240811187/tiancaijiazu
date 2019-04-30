//
//  GCHomeViewController.m
//  天才家族
//
//  Created by iOS2 on 2019/4/27.
//  Copyright © 2019 iOS. All rights reserved.
//
#import <objc/message.h>
#import "HomeOnlineVideoTableViewCell.h"
#import "GCtextView.h"
#import "GCCommunityTableViewCell.h"
#import "GCHomeKnowledgeTableViewCell.h"
#import "GCVideoInfoItem.h"
#import "GCHomeVideoTableViewCell.h"
#import "GCHomeTableViewHeader.h"
#import "Header.h"
#import "GCTabviewHeadButtonView.h"
#import "GCHomeViewController.h"
#import "ZXCycleScrollView.h"
#import "GCCommunityFirstTableViewCell.h"
@interface GCHomeViewController ()<ZXCycleScrollViewDelegate,UITableViewDelegate,UITableViewDataSource,HomeOnlineVideoTableViewCellPlayDelegate>
@property (nonatomic,strong) ZXCycleScrollView *scrollView;
@property (nonatomic, strong)UITableView * homeTableView ;
@property (nonatomic,strong) UIView *HeaderView;
@property (nonatomic,strong)NSMutableArray* tempdata;
@property (nonatomic,strong) UITableView *twelveTableView;
@property (nonatomic,strong)UIButton * infomationButton;
@property (nonatomic, strong) ZFPlayerController *player;//接收cell上播放器
@end

@implementation GCHomeViewController
-(void)createHeaderView{
    
    self.title = @"天才家族";
    [self  setLeftItemImageName:@"home_logo" andhighImage:@"home_logo"];
    
    [self  setRightItemImageName:@"audio_blue" andhighImage:@"audio_blue"];
    
    
    [GLMusicPlayer defaultPlayer].loopState = GLForeverLoop;
    [GLMusicPlayer defaultPlayer].musicListArray = [NSMutableArray arrayWithObjects:@"http://mpge.5nd.com/2009/2009a/x/24352/1.mp3",@"http://mpge.5nd.com/2007/h/20075225298269/52989152.mp3",@"http://mpge.5nd.com/2015/2015-5-6/66943/14.mp3", nil];
    self.HeaderView = [[UIView alloc] initWithFrame:CGRectMake(0,0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    self.HeaderView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.HeaderView];
    
    _scrollView = [ZXCycleScrollView  initWithFrame:CGRectMake(0,0,SCREEN_WIDTH,200*applicationScale_iphone6) withMargnPadding:0 withImgWidth: SCREEN_WIDTH dataArray:@[@"http://d.hiphotos.baidu.com/image/pic/item/b7fd5266d016092408d4a5d1dd0735fae7cd3402.jpg"]];
    _scrollView.delegate = self;
    [self.view addSubview:self.scrollView];
    self.scrollView.otherPageControlColor = [UIColor blueColor];
    self.scrollView.curPageControlColor = [UIColor whiteColor];
    
    if (@available(iOS 11.0, *)) {
        self.scrollView.mainScrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentAutomatic;
    } else {
        self.automaticallyAdjustsScrollViewInsets = YES;
    }
    self.scrollView.sourceDataArr = @[@"https://manhua.qpic.cn/operation/0/11_11_22_c4de3602c8aff83100c018fce9f52d5c_1528687357296.jpg/0",@"https://manhua.qpic.cn/operation/0/31_22_55_30aa7716ea9fd9abd139b10909d29d6e_1522508127196.jpg/0",@"https://manhua.qpic.cn/operation/0/11_11_23_18a1debf5a249a4eeda00006ac467d01_1528687408905.jpg/0",@"https://manhua.qpic.cn/operation/0/03_09_42_08ae84d5bd144070a8d5081062eb86b8_1525311724240.jpg/0",@"https://manhua.qpic.cn/operation/0/11_11_23_2a169d0cbfff4864a8888da7c378627e_1528687424498.jpg/0"];
    
    
    self.scrollView.autoScroll = YES;
    
}
-(void)createTableView{
    
        _twelveTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH , SCREEN_HEIGHT-tabbarHeight) style:UITableViewStyleGrouped];
        _twelveTableView.delegate = self;
        _twelveTableView.dataSource = self;
        _twelveTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _twelveTableView.backgroundColor = [UIColor clearColor];
        _twelveTableView.sectionFooterHeight = 0;
    
        [_twelveTableView registerClass:[GCHomeVideoTableViewCell class] forCellReuseIdentifier:@"GCVideoCollectionViewCell"];
    
        [_twelveTableView registerClass:[GCHomeKnowledgeTableViewCell class] forCellReuseIdentifier:@"GCHomeKnowledgeTableViewCell"];
    
    [_twelveTableView registerClass:[GCCommunityFirstTableViewCell class] forCellReuseIdentifier:@"GCCommunityFirstTableViewCell"];
    [_twelveTableView registerClass:[GCCommunityTableViewCell class] forCellReuseIdentifier:@"GCCommunityTableViewCell"];
    
    
    
    [_twelveTableView registerClass:[HomeOnlineVideoTableViewCell class] forCellReuseIdentifier:@"HomeOnlineVideoTableViewCell"];
    
    if (@available(iOS 11.0, *)) {
        self.twelveTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets =NO;
    }
    [self.view addSubview:_twelveTableView];
    [self viewForHeadertableView];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _tempdata = [NSMutableArray array];
    for (int i=0; i<4; i++) {
        
        GCVideoInfoItem * model = [[GCVideoInfoItem alloc]init];
        model.durgion = 31.00;
        model.url = @"https://ss3.baidu.com/9fo3dSag_xI4khGko9WTAnF6hhy/image/h%3D300/sign=87d6daed02f41bd5c553eef461d881a0/f9198618367adab4b025268587d4b31c8601e47b.jpg";
        
        [_tempdata addObject:model];
    }
    
    
    [self createHeaderView];
    
    [self setHeaderViewradian];

    [self createTableView];
    

}

- (void)setHeaderViewradian
{
    
    
    UIView * read = [[UIView alloc] initWithFrame:CGRectMake(0, 200*applicationScale_iphone6-20,SCREEN_WIDTH,21)];
    
    
    [self.view addSubview:read];
    
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame =  CGRectMake(0, 0,SCREEN_WIDTH, read.frame.size.height);
    
    maskLayer.fillColor = [UIColor whiteColor].CGColor;
    UIBezierPath *path = [UIBezierPath bezierPath];
   
    //起点坐标
    [path moveToPoint:CGPointMake(0, 0)];
    
    //下面三个点分别为 终点坐标  控制坐标1 控制坐标2
    [path addQuadCurveToPoint:CGPointMake(SCREEN_WIDTH, 0) controlPoint:CGPointMake(SCREEN_WIDTH/2, 35*applicationScale_iphone6)];
    
    
    [path addLineToPoint:CGPointMake(SCREEN_WIDTH,read.frame.size.height)];
    
    
    [path addLineToPoint:CGPointMake(0, read.frame.size.height)];
    
    
    maskLayer.path = path.CGPath;
    [read.layer addSublayer:maskLayer];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.player.viewControllerDisappear = YES;//离开页面视频暂停播放
    
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}


#pragma mark -- ZXCycleScrollViewDelegate
-(void)zxCycleScrollView:(ZXCycleScrollView *)scrollView didScrollToIndex:(NSInteger)index {
    NSLog(@"index------%lu",index);
}

-(void)zxCycleScrollView:(ZXCycleScrollView *)scrollView didSelectItemAtIndex:(NSInteger)index {
    NSLog(@"点击了----index------%lu",index);
}


#pragma mark-- 视频板块的代理
- (void)HomeOnlineVideoTableViewCellZFPlayerController:(ZFPlayerController*)player{
    
    self.player = player;
    
}

- (void)HomeOnlineVideoTableViewCellPlayerOrientationWillChange{
    
    [self setNeedsStatusBarAppearanceUpdate];
    
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




#pragma mark - UITableViewDelegate & UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 1;
    }else if (section==1){
      return 1;
    }else if (section==2){
        return 1;
    }
    return 10;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
  
    if (indexPath.section==0) {
        static NSString * cellID = @"GCHomeVideoTableViewCell";
    
        GCHomeVideoTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        
        if (!cell) {
            cell = [[GCHomeVideoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
           
        }
        NSDictionary * dic = @{@"data":@[@"",@""]};
         [cell GivetopViewData:dic];
       cell.selectionStyle = UITableViewCellSelectionStyleNone;
       return cell;
        
    }else if (indexPath.section==1){
        static NSString * Knowledgecell = @"GCHomeKnowledgeTableViewCell";
        GCHomeKnowledgeTableViewCell  * cell = [tableView dequeueReusableCellWithIdentifier:Knowledgecell];
        
        if (!cell) {
            cell = [[GCHomeKnowledgeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Knowledgecell];
            
            
        }
        [cell refreshWhichshow:1];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
    }else if (indexPath.section==2){
        static NSString * earlycell = @"HomeOnlineVideoTableCell";
        HomeOnlineVideoTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:earlycell];
        
        if (!cell) {
            cell = [[HomeOnlineVideoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:earlycell];
            
            
        }
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
    }
    else{
        if (indexPath.row==0) {
            static NSString * cellIDrrrrr = @"GCCommunityFirstTableViewCell";
            GCCommunityFirstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIDrrrrr];
            
            if (!cell) {
                cell = [[GCCommunityFirstTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIDrrrrr];
                
                
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }else{
            static NSString * cellIDrrrrr = @"GCCommunityTableViewCell";
            GCCommunityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIDrrrrr];
            
            if (!cell) {
                cell = [[GCCommunityTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIDrrrrr];
                
                
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
            
        }
        
        
        
       
   
    }
}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return 238*applicationScale_iphone6;
    }else if (indexPath.section==1){
        
         return 153*applicationScale_iphone6;
    }else if (indexPath.section==2){
        
         return 310*applicationScale_iphone6;
    }
    
    return 292*applicationScale_iphone6;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 55*applicationScale_iphone6;
   
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0;
}
-(void)infomationButtonclick:(UIButton *)sender{
    
}
-(void)viewForHeadertableView{
    
    UIView * HeadertableView ;
    HeadertableView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 234)];
    HeadertableView.backgroundColor = [UIColor clearColor];
    HeadertableView.userInteractionEnabled = YES;
    
    _infomationButton = [UIButton new];
    [_infomationButton setImage:[UIImage imageNamed:@"audio_white"] forState:UIControlStateNormal];
    [_infomationButton addTarget:self action:@selector(infomationButtonclick:) forControlEvents:UIControlEventTouchUpInside];
    _infomationButton.frame = CGRectMake(SCREEN_WIDTH-27-30, 16*applicationScale_iphone6, 30, 30);
    [HeadertableView  addSubview:_infomationButton];
    
    UIView *  addshadowOpacityView = [[UIView alloc]initWithFrame:CGRectMake(0, 233, SCREEN_WIDTH, 1)];
    addshadowOpacityView.backgroundColor = MainBgColor;
    [HeadertableView addSubview:addshadowOpacityView];
    
    
    GCTabviewHeadButtonView * headButtonView = [[GCTabviewHeadButtonView alloc]initWithFrame:CGRectMake(16*applicationScale_iphone6, 169, 343*applicationScale_iphone6, 64)];
    headButtonView.whichBlock = ^(UIButton * _Nonnull sender) {
        
    };
    headButtonView.layer.shadowColor = [UIColor colorWithRed:84/255.0 green:115/255.0 blue:194/255.0 alpha:0.1].CGColor;
    headButtonView.layer.shadowOffset = CGSizeMake(0,2);
    headButtonView.layer.shadowOpacity = 1;
    headButtonView.layer.shadowRadius = 10;
    headButtonView.layer.cornerRadius = 5;
    
    [HeadertableView addSubview:headButtonView];
    
    _twelveTableView.tableHeaderView = HeadertableView;
    
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    GCtextView * view ;
    view = [[GCtextView alloc]init];
    view.backgroundColor = [UIColor whiteColor];
    view.frame =CGRectMake(0, 0, SCREEN_WIDTH, applicationScale_iphone6*55);
    view.homeTableView = self.homeTableView;
    view.section = section;
    GCHomeTableViewHeader * headbottom = [[GCHomeTableViewHeader alloc]initWithFrame:CGRectMake(0, view.height-55*applicationScale_iphone6, SCREEN_WIDTH, 55*applicationScale_iphone6)];
    switch (section) {
        case 0:
             headbottom.dictData = @{@"title":@"每日早教小视频",@"all":@"全部"};
            break;
        case 1:
             headbottom.dictData = @{@"title":@"每日早教小知识",@"all":@"全部"};
            break;
        case 2:
             headbottom.dictData = @{@"title":@"线上在家早教",@"all":@"进入课堂"};
            break;
            
        case 3:
             headbottom.dictData = @{@"title":@"家族社区热议",@"all":@"全部"};
            break;

            
        default:
            break;
    }
   
    [view addSubview:headbottom];
    return view;
  
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
     [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    
    
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    NSLog(@"scrollView.contentOffset.y%f",scrollView.contentOffset.y);
    CGFloat current =scrollView.contentOffset.y;
    CGFloat target = applicationScale_iphone6*233;
    if (current<target) {
    [self.navigationController setNavigationBarHidden:YES animated:YES];
     _twelveTableView.frame = CGRectMake(0, 0,SCREEN_WIDTH , SCREEN_HEIGHT-tabbarHeight);
    }else{
     [self.navigationController setNavigationBarHidden:NO animated:YES];
        _twelveTableView.frame = CGRectMake(0, 0,SCREEN_WIDTH , SCREEN_HEIGHT-tabbarHeight-NavRectHeight);
    }
    
    
}
@end

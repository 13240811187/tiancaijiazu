//
//  LearnViewController.m
//  天才家族
//
//  Created by iOS on 2019/4/22.
//  Copyright © 2019 iOS. All rights reserved.
//

#import "LearnViewController.h"
#import "Header.h"
#import "LearnHeaderView.h"
#import "LearnTableViewCell.h"
@interface LearnViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)LearnHeaderView * LearnHeaderView;
@property (nonatomic,strong)UIImageView * newPersonView;


@property(nonatomic,strong)UIView * headertabview;
@property(nonatomic,strong)UITableView *tableView;


@end

@implementation LearnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self creatUI];
}


- (void)creatUI{
    
    [self.view addSubview:self.LearnHeaderView];
    
    [self.headertabview addSubview:self.newPersonView];
    
    self.headertabview.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:self.tableView];
    
    self.tableView.backgroundColor = [UIColor whiteColor];
    
    if (iOS11_Later) {
        
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        if ([self.tableView isKindOfClass:[UITableView class]]) {
            // iOS 11的tableView自动算高默认自动开启，不想使用则要这样关闭
            self.tableView.estimatedRowHeight = 0;
            self.tableView.estimatedSectionHeaderHeight = 0;
            self.tableView.estimatedSectionFooterHeight = 0;
        }
        
    }else {
        
        self.automaticallyAdjustsScrollViewInsets = NO;
        
    }
    
}



- (LearnHeaderView *)LearnHeaderView{
    
    if (!_LearnHeaderView) {
        
        _LearnHeaderView = [[LearnHeaderView alloc] initWithFrame:CGRectMake(0,0,SCWIDTH,85*applicationScale_iphone6)];
        
        
    }
    
    return _LearnHeaderView;
    
    
}



- (UIView *)headertabview{
    
    if (!_headertabview) {
        
        _headertabview = [[UIView alloc] initWithFrame:CGRectMake(0,0,SCWIDTH,80*applicationScale_iphone6)];
        
    }
    
    return _headertabview;
    
    
}


- (UIImageView *)newPersonView{
    
    if (!_newPersonView) {
        
        _newPersonView = [[UIImageView alloc] initWithFrame:CGRectMake(15,0,70*applicationScale_iphone6,70*applicationScale_iphone6)];
        
        _newPersonView.contentMode = UIViewContentModeScaleAspectFill;
        [_newPersonView setClipsToBounds:YES];
        
    }
    
    return _newPersonView;
    
    
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 5;
    
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = [UIColor whiteColor];
    view.frame =CGRectMake(0, 0, SCWIDTH, 5);
    return view;
}


- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *MyFriendCellIdentify = @"Home_TeamhomeCelllisdelsitt";
    NSString * idstr = [NSString stringWithFormat:@"%ld,%@",indexPath.row,MyFriendCellIdentify];
    
    LearnTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idstr];
    
    if (!cell) {
        
        cell = [[LearnTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idstr andIndexPath:indexPath];
    }
    
    
    
    return cell;
    
}






- (UITableView *)tableView{
    
    if (!_tableView) {
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,self.LearnHeaderView.bottom, SCWIDTH,SCHEIGHT-StatusBar-NavRect-self.LearnHeaderView.height-tabbarHeight) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 125*applicationScale_iphone6;
        _tableView.tableHeaderView = self.headertabview;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        
    }
    
    return _tableView;
    
}




- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
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


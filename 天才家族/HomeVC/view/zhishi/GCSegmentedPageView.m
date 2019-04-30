//
//  GCSegmentedPageView.m
//  天才家族
//
//  Created by iOS2 on 2019/4/27.
//  Copyright © 2019 iOS. All rights reserved.
//
#import "Header.h"
#import "GCSegmentedPageView.h"

@interface GCSegmentedPageView()

@property(nonatomic,strong)UIButton * leftbutton;

@property(nonatomic,strong)UIButton * rightbutton;

@property(nonatomic,strong)UIView * selectedView;

@property(nonatomic,strong)UIButton * selectedButton;
@end
@implementation GCSegmentedPageView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        [self setUpUI];
    }
    return self;
}
- (void)setUpUI
{
    self.backgroundColor = [UIColor whiteColor];
   self.leftbutton = [UIButton new];
    [self.leftbutton setTitle:@"最新" forState:UIControlStateNormal];
    self.leftbutton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:13];
    [self.leftbutton setTitleColor:[UIColor colorWithHexString:@"#999999"] forState:UIControlStateNormal];
    
    [self.leftbutton setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateSelected];
    self.leftbutton.tag = 1;
    self.leftbutton.selected = YES;
    _selectedButton = self.leftbutton ;
    //默认选中第一个
    [self.leftbutton addTarget:self action:@selector(whichoneclick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.leftbutton];
    self.leftbutton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [self.leftbutton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.mas_left).mas_offset(1);
        make.top.equalTo(self.mas_top).mas_offset(0);
        make.bottom.equalTo(self.mas_bottom).mas_offset(-1);
        make.width.mas_equalTo((SCREEN_WIDTH-34)/2);
        
    }];
    
    
    
   self.rightbutton = [UIButton new];
    [self.rightbutton setTitle:@"最热" forState:UIControlStateNormal];
    self.rightbutton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:13];
    [self.rightbutton setTitleColor:[UIColor colorWithHexString:@"#999999"] forState:UIControlStateNormal];
    
    [self.rightbutton setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateSelected];
    self.rightbutton.tag = 2;
    
    
    //默认选中第一个
    [self.rightbutton addTarget:self action:@selector(whichoneclick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.rightbutton];
    //self.rightbutton.backgroundColor =[UIColor redColor];
    self.rightbutton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [self.rightbutton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(self.mas_right).mas_offset(-1);
        make.top.equalTo(self.mas_top).mas_offset(0);
        make.bottom.equalTo(self.mas_bottom).mas_offset(-1);
        make.width.mas_equalTo((SCREEN_WIDTH-34)/2);
        
    }];
    
    
    
    UIView * lineone = [[UIView alloc]init];
    lineone.backgroundColor = [UIColor colorWithHexString:@"#F3F3F3"];
    [self addSubview:lineone];
    [lineone mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(self.mas_centerY).mas_offset(0);
        make.centerX.equalTo(self.mas_centerX).mas_offset(0);
        make.height.mas_equalTo(13);
        make.width.mas_equalTo(1);
        
    }];
    
    UIView * linebottom = [[UIView alloc]init];
    linebottom.backgroundColor = [UIColor colorWithHexString:@"#F3F3F3"];
    [self addSubview:linebottom];
    [linebottom mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottom).mas_offset(0);
        make.left.equalTo(self.mas_left).mas_offset(0);
        make.right.equalTo(self.mas_right).mas_offset(0);
        make.height.mas_equalTo(1);
        
        
    }];
    
    
    self.selectedView = [[UIView alloc]init];
    self.selectedView.backgroundColor = [UIColor colorWithHexString:@"#6297FF"];
    [self addSubview:self.selectedView];
    [self.selectedView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.selectedButton.mas_centerX).mas_offset(0);
        make.bottom.equalTo(self.mas_bottom).mas_offset(0);
        make.width.mas_equalTo(30);
        make.height.mas_equalTo(2);
        
        
    }];
    
}
-(void)whichoneclick:(UIButton *)sender{
    
    if (sender.tag==_selectedButton.tag) {
        
        return ;
        
        
    }else{
        
        _selectedButton.selected = NO;
        
        _selectedButton = sender;
        _selectedButton.selected = YES;
        
        [self.selectedView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.selectedButton.mas_centerX).mas_offset(0);
            make.bottom.equalTo(self.mas_bottom).mas_offset(0);
            make.width.mas_equalTo(30);
            make.height.mas_equalTo(2);
            
            
        }];
        self.whichOneSelectedBlock(sender.tag);
        
    }
    
}
@end

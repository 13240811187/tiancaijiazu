//
//  GCTabviewHeadButtonView.m
//  天才家族
//
//  Created by 乔光玉 on 2019/4/28.
//  Copyright © 2019年 iOS. All rights reserved.
//
#import "UIButton+Extensions.h"
#import "GCTabviewHeadButtonView.h"
@interface GCTabviewHeadButtonView()



@end

@implementation GCTabviewHeadButtonView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self initView];
    }
    return self;
}
-(void)initView{
    self.userInteractionEnabled = YES;
    
    self.backgroundColor = [UIColor whiteColor];
    NSArray * imagearray = @[@"son_icon",@"up_icon",@"down_icon",@"faimaly_icon"];
    NSArray * titlearray = @[@"育儿百科",@"线上学院",@"线下课堂",@"家族商城"];
    for (int i =0; i<4; i++) {
        UIButton * button = [UIButton new];
        button.frame = CGRectMake(self.frame.size.width/4*i, 0, self.frame.size.width/4, self.frame.size.height);
        [button setImage:[UIImage imageNamed:imagearray[i]] forState:UIControlStateNormal];
        [button setTitle:titlearray[i] forState:UIControlStateNormal];
        button.tag=1+i;
        [button setTitleColor:[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0]forState:UIControlStateNormal];
        
        button.titleLabel.font =[UIFont fontWithName:@"PingFangSC-Regular" size: 12];
        
        [button addTarget:self action:@selector(buttonclick:) forControlEvents:UIControlEventTouchUpInside];
        [button setUpImageAndDownLableWithSpace:3];
        [self addSubview:button];
    }




}
-(void)buttonclick:(UIButton * )sender{
    
    self.whichBlock(sender);
    
}
@end

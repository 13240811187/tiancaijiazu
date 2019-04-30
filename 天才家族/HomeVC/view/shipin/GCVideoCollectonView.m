//
//  GCVideoCollectonView.m
//  天才家族
//
//  Created by 乔光玉 on 2019/4/28.
//  Copyright © 2019年 iOS. All rights reserved.
//
#import "Header.h"
#import "GCVideoCollectonView.h"
@interface GCVideoCollectonView()

@end

@implementation GCVideoCollectonView

-(instancetype)init
{
    self = [super init];
    if (self)
    {
        [self initView];
    }
    return self;
}
-(void)initView{
    
    self.userInteractionEnabled = YES;
    
    self.imageleft = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 111*applicationScale_iphone6, 153*applicationScale_iphone6)];
    self.imageleft.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapFirstGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapFirstView:)];
    [self.imageleft addGestureRecognizer:tapFirstGesture];
    [self addSubview:self.imageleft];
    
    CAGradientLayer *glleft = [CAGradientLayer layer];
    glleft.frame = self.imageleft.bounds;
    glleft.startPoint = CGPointMake(0, 0);
    glleft.endPoint = CGPointMake(1, 1);
    glleft.colors = @[(__bridge id)[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.5].CGColor,(__bridge id)[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.0].CGColor];
    glleft.locations = @[@(0.0),@(1.0f)];
    
    [self.imageleft.layer addSublayer:glleft];
    glleft.cornerRadius = 2;
    
    self.imagemiddle = [[UIImageView alloc]initWithFrame:CGRectMake(116*applicationScale_iphone6, 0, 111*applicationScale_iphone6, 153*applicationScale_iphone6)];
    self.imagemiddle.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapSecondGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapSecondView:)];
    [self.imagemiddle addGestureRecognizer:tapSecondGesture];
    [self addSubview:self.imagemiddle];
    
    CAGradientLayer *glmiddle = [CAGradientLayer layer];
    glmiddle.frame = self.imagemiddle.bounds;
    glmiddle.startPoint = CGPointMake(0, 0);
    glmiddle.endPoint = CGPointMake(1, 1);
    glmiddle.colors = @[(__bridge id)[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.5].CGColor,(__bridge id)[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.0].CGColor];
    glmiddle.locations = @[@(0.0),@(1.0f)];
    
    [self.imagemiddle.layer addSublayer:glmiddle];
    glmiddle.cornerRadius = 2;
    
    self.imageright = [[UIImageView alloc]initWithFrame:CGRectMake(116*applicationScale_iphone6*2, 0, 111*applicationScale_iphone6, 153*applicationScale_iphone6)];
    self.imageright.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapThridGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapThridView:)];
    
    [self.imageright addGestureRecognizer:tapThridGesture];
    [self addSubview:self.imageright];
    
    CAGradientLayer *glright = [CAGradientLayer layer];
    glright.frame = self.imageright.bounds;
    glright.startPoint = CGPointMake(0, 0);
    glright.endPoint = CGPointMake(1, 1);
    glright.colors = @[(__bridge id)[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.5].CGColor,(__bridge id)[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.0].CGColor];
    glright.locations = @[@(0.0),@(1.0f)];
    
    [self.imageright.layer addSublayer:glright];
    glright.cornerRadius = 2;
    
    
    self.labelleft = [[UILabel alloc]initWithFrame:CGRectMake(0, 135*applicationScale_iphone6, 106*applicationScale_iphone6, 15)];
    self.labelleft.textColor = [UIColor colorWithHexString:@"#FFFFFF"];
    self.labelleft.font = [UIFont fontWithName:@"PingFangSC-Regular" size:11];
    self.labelleft.textAlignment = NSTextAlignmentRight;
    
    [self.imageleft addSubview:self.labelleft];
    
    
    self.labelmiddle = [[UILabel alloc]initWithFrame:CGRectMake(0, 135*applicationScale_iphone6, 106*applicationScale_iphone6, 15)];
    self.labelmiddle.textColor = [UIColor colorWithHexString:@"#FFFFFF"];
    self.labelmiddle.font = [UIFont fontWithName:@"PingFangSC-Regular" size:11];
    self.labelmiddle.textAlignment = NSTextAlignmentRight;
    
    [self.imagemiddle addSubview:self.labelmiddle];
    
    
    self.labelright = [[UILabel alloc]initWithFrame:CGRectMake(0, 135*applicationScale_iphone6, 106*applicationScale_iphone6, 15)];
    self.labelright.textColor = [UIColor colorWithHexString:@"#FFFFFF"];
    self.labelright.font = [UIFont fontWithName:@"PingFangSC-Regular" size:11];
    self.labelright.textAlignment = NSTextAlignmentRight;
    
    [self.imageright addSubview:self.labelright];
    
}
-(void)tapFirstView:(UITapGestureRecognizer *)gesture{
    
   self.whichBlock(1);
    
}
-(void)tapSecondView:(UITapGestureRecognizer *)gesture{
    
    self.whichBlock(2);
    
}
-(void)tapThridView:(UITapGestureRecognizer *)gesture{
    
    self.whichBlock(3);
    
}
@end

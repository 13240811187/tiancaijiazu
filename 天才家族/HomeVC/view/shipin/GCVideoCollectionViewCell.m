//
//  GCVideoCollectionViewCell.m
//  天才家族
//
//  Created by iOS2 on 2019/4/27.
//  Copyright © 2019 iOS. All rights reserved.
//
#import "Header.h"
#import "GCVideoCollectonView.h"
#import "GCVideoCollectionViewCell.h"
@interface GCVideoCollectionViewCell()

@property(nonatomic,strong)UIImageView *iconView;
@property(nonatomic,strong)UILabel * titleLabel ;

@end
@implementation GCVideoCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        [self setupUIWithFrame:frame];
        
    }
    
    
    return self;
    
}
- (void)setupUIWithFrame:(CGRect)frame {
    self.backgroundColor = [UIColor whiteColor];
    CAGradientLayer *gl = [CAGradientLayer layer];
    gl.frame = frame;
    gl.startPoint = CGPointMake(0, 0);
    gl.endPoint = CGPointMake(1, 1);
    gl.colors = @[(__bridge id)[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.5].CGColor,(__bridge id)[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.0].CGColor];
    gl.locations = @[@(0.0),@(1.0f)];
    gl.cornerRadius = 2;
    [self.layer insertSublayer:gl atIndex:0];
    self.clipsToBounds = YES;
    
    
    self.iconView = [[UIImageView alloc]init];
    self.iconView.frame = frame;
    [self addSubview:self.iconView];
    
    self.titleLabel = [[UILabel alloc]init];
    self.titleLabel.textColor = [UIColor colorWithHexString:@"#FFFFFF"];
    self.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:11];
    [self addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.right.equalTo(self.mas_right).mas_offset(-5);
        make.bottom.equalTo(self.mas_bottom).mas_offset(-8);
        
    }];
}
-(void)bindWithModel:(GCVideoInfoItem *)model{
    
     [self.iconView sd_setImageWithURL:[NSURL URLWithString:model.url]];
      self.titleLabel.text = [NSString stringWithFormat:@"%f秒",model.durgion];
    
}
@end

//
//  HomeOnlineSonVideoCollectionViewCell.m
//  天才家族
//
//  Created by iOS on 2019/4/27.
//  Copyright © 2019 iOS. All rights reserved.
//

#import "HomeOnlineSonVideoCollectionViewCell.h"
#import "Header.h"
@interface HomeOnlineSonVideoCollectionViewCell ()
@property (nonatomic,strong)UIImageView * iconImageView;

@property (nonatomic,strong)UIView * alphaImageView;

@property (nonatomic,strong)UIImageView * playImageView;

@property (nonatomic,strong)UILabel * titleLabel;
@end
@implementation HomeOnlineSonVideoCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        self.contentView.layer.cornerRadius = 4;
        self.contentView.layer.masksToBounds = YES;
        self.iconImageView.backgroundColor = [UIColor blueColor];
         [self.contentView addSubview:self.iconImageView];
         [self.iconImageView addSubview:self.alphaImageView];
         [self.contentView addSubview:self.playImageView];
        
        
    }
    
    return self;
}

-(void)setCowerHidden{
    self.alphaImageView.hidden = YES;
    self.contentView.layer.borderColor =EaryCellBorderColor.CGColor;
}
-(void)setCowerShow{
    
   self.alphaImageView.hidden = NO;
    self.contentView.layer.borderColor =MainBgColor.CGColor;
}


- (UIImageView *)iconImageView{
    
    
    if (!_iconImageView) {
        
        _iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,self.contentView.width,self.contentView.height)];
        [_iconImageView setImage:[UIImage imageNamed:@"imagedemo"]];
        _iconImageView.contentMode = UIViewContentModeScaleAspectFill;
        [_iconImageView setClipsToBounds:YES];
        
    }
    
    return _iconImageView;
    
}

- (UIView *)alphaImageView{
    
    if (!_alphaImageView) {
        
        _alphaImageView = [[UIView alloc] initWithFrame:CGRectMake(0,0,self.iconImageView.width,self.iconImageView.height)];
        _alphaImageView.backgroundColor = RGBalpha(0, 0, 0, 0.5);
    }
    
    return _alphaImageView;
    
    
}

- (UIImageView *)playImageView{
    
    if (!_playImageView) {
        
        _playImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,22*applicationScale_iphone6,22*applicationScale_iphone6)];
        
        _playImageView.center = self.alphaImageView.center;
    
        _playImageView.image = [UIImage imageNamed:@"video_play"];
        
    }
    
    return _playImageView;
    
    
}

-(UILabel *)titleLabel{
    
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 54*applicationScale_iphone6, self.iconImageView.width, 12*applicationScale_iphone6)];
        _titleLabel.font = FontPingFangSC(12);
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = MainBgColor;
    }
    return _titleLabel;
}



@end

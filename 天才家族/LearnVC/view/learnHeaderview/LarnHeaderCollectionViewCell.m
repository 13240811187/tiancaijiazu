//
//  LarnHeaderCollectionViewCell.m
//  天才家族
//
//  Created by iOS on 2019/4/29.
//  Copyright © 2019 iOS. All rights reserved.
//

#import "LarnHeaderCollectionViewCell.h"
#import "Header.h"

@interface LarnHeaderCollectionViewCell ()
@property (nonatomic,strong)UIImageView * iconImageView;
@property (nonatomic,strong)UILabel * iconLabel;
@end

@implementation LarnHeaderCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self.contentView addSubview:self.iconImageView];
        
        [self.contentView addSubview:self.iconLabel];
        
    }
    
    return self;
}


- (UIImageView *)iconImageView{
    
    if (!_iconImageView) {
        
        _iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,45*applicationScale_iphone6,45*applicationScale_iphone6)];
        _iconImageView.centerX = self.contentView.centerX;

        _iconImageView.contentMode = UIViewContentModeScaleAspectFill;
        [_iconImageView setClipsToBounds:YES];
        
    }
    
    return _iconImageView;
    
    
}

- (UILabel *)iconLabel{
    
    if (!_iconLabel) {
        
        
        _iconLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,self.iconImageView.bottom,self.iconImageView.width,20*applicationScale_iphone6)];
    
        _iconLabel.centerX = self.iconImageView.centerX;
        _iconLabel.font = FontArial(12*applicationScale_iphone6);
        _iconLabel.textAlignment = NSTextAlignmentCenter;
        _iconLabel.textColor = [RGBColor colorWithHexString:@"#666666"];
        
        
    }
    
    return _iconLabel;
}



@end

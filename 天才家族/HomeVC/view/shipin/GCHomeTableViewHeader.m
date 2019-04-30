//
//  GCHomeTableViewHeader.m
//  天才家族
//
//  Created by iOS2 on 2019/4/27.
//  Copyright © 2019 iOS. All rights reserved.
//
#import "Header.h"
#import "GCHomeTableViewHeader.h"

@implementation GCHomeTableViewHeader

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self createUI];
    }
    return self;
}
-(void)createUI{
    
    [self addSubview:self.titleLabel];
    [self addSubview:self.icon];
    [self addSubview:self.allLabel];
    self.titleLabel.textColor = [UIColor colorWithHexString:@"#333333"];
    self.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:17];
    self.titleLabel.adjustsFontSizeToFitWidth = YES;
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).mas_offset(16*applicationScale_iphone6);
        make.top.equalTo(self.mas_top).mas_offset(20*applicationScale_iphone6);
        
    }];
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).mas_offset(-16*applicationScale_iphone6);
        make.centerY.equalTo(self.mas_centerY);
        
    }];
    [self.icon setImage:[UIImage imageNamed:@"more_icon"]];
    //self.icon.backgroundColor = [UIColor redColor];
    self.allLabel.textColor = [UIColor colorWithHexString:@"#999999"];
    self.allLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:17];
    self.allLabel.adjustsFontSizeToFitWidth = YES;
    [self.allLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.icon.mas_left).mas_offset(-3*applicationScale_iphone6);
        make.centerY.equalTo(self.mas_centerY);
        
    }];
    
}
- (void)setDictData:(NSDictionary *)dictData
{
    
    self.titleLabel.text =dictData[@"title"];
    
    self.allLabel.text =dictData[@"all"];
   
    
}
-(UILabel * )titleLabel{
    
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
    }
    return _titleLabel;
}
-(UILabel * )allLabel{
    
    if (!_allLabel) {
        _allLabel = [[UILabel alloc] init];
    }
    return _allLabel;
}
-(UIImageView * )icon{
    
    if (!_icon) {
        _icon = [[UIImageView alloc] init];
    }
    return _icon;
}


@end

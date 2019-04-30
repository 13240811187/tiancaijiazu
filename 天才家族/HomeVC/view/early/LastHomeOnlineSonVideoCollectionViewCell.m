//
//  LastHomeOnlineSonVideoCollectionViewCell.m
//  天才家族
//
//  Created by iOS2 on 2019/4/30.
//  Copyright © 2019 iOS. All rights reserved.
//
#import "Header.h"
#import "LastHomeOnlineSonVideoCollectionViewCell.h"
@interface LastHomeOnlineSonVideoCollectionViewCell ()
@property (nonatomic,strong)UILabel * moreLabel;
@property (nonatomic,strong)UILabel * classroomLabel;
@end

@implementation LastHomeOnlineSonVideoCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        self.contentView.layer.cornerRadius = 4;
        self.contentView.layer.masksToBounds = YES;
        self.contentView.backgroundColor = EaryCellBackgroundColor ;
        [self.contentView addSubview:self.classroomLabel];
        [self.contentView addSubview:self.moreLabel];
        
    }
    
    return self;
}
-(UILabel *)classroomLabel{
    
    if (!_classroomLabel) {
        _classroomLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 24*applicationScale_iphone6, self.contentView.width-20, 12*applicationScale_iphone6)];
        _classroomLabel.font = FontPingFangSC(12);
        _classroomLabel.textAlignment = NSTextAlignmentCenter;
        _classroomLabel.textColor = MainLabelTextColor;
        _classroomLabel.text = @"进入课堂";
    }
    return _classroomLabel;
}

-(UILabel *)moreLabel{
    
    if (!_moreLabel) {
        _moreLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 40*applicationScale_iphone6, self.contentView.width-20, 7*applicationScale_iphone6)];
        _moreLabel.font = FontPingFangSC(12);
        _moreLabel.textAlignment = NSTextAlignmentCenter;
        _moreLabel.textColor = MainLabelTextColor;
        _moreLabel.text= @"more";
    }
    return _moreLabel;
}
@end

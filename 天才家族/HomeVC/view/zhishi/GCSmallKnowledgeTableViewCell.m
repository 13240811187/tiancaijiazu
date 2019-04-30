//
//  GCSmallKnowledgeTableViewCell.m
//  天才家族
//
//  Created by iOS2 on 2019/4/27.
//  Copyright © 2019 iOS. All rights reserved.
//
#import "Header.h"
#import "GCSmallKnowledgeTableViewCell.h"

@implementation GCSmallKnowledgeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initsubviews];
    }
    return self;
}
-(void)initsubviews{
    
    [self addSubview:self.playicon];
    [self.playicon setImage:[UIImage imageNamed:@"audio_play_normal"]];
    [self.playicon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).mas_offset(15);
        make.top.equalTo(self.mas_top).mas_offset(15);
        make.width.mas_equalTo(18);
        make.height.mas_equalTo(18);
        
    }];
    [self addSubview:self.titleLabel];
    self.titleLabel.textColor = [UIColor colorWithHexString:@"#333333"];
    self.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.playicon.mas_right).mas_offset(12);
        make.centerY.equalTo(self.playicon.mas_centerY).mas_offset(0);
        make.right.equalTo(self.mas_right).mas_offset(-16);
        
        
    }];
    
    
}
-(UIImageView * )playicon{
    
    if (!_playicon) {
        _playicon = [[UIImageView alloc] init];
    }
    return _playicon;
    
}

-(UILabel * )titleLabel{
    
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
    }
    return _titleLabel;
    
}
- (void)refreshPlayStatus:(BOOL)playBool{
    
    if (playBool==YES) {
    
     [self.playicon setImage:[UIImage imageNamed:@"audio_play_played"]];
    self.titleLabel.textColor = [UIColor colorWithHexString:@"#6297FF"];
    }else{
     [self.playicon setImage:[UIImage imageNamed:@"audio_play_normal"]];
     self.titleLabel.textColor = [UIColor colorWithHexString:@"#333333"];
    }
    
}
-(void)bindWithModel:(GCAudioInfoItem *)model{
    
    self.titleLabel.text = model.title;
}
@end

//
//  GCCommunityTableViewCell.m
//  天才家族
//
//  Created by 乔光玉 on 2019/4/28.
//  Copyright © 2019年 iOS. All rights reserved.
//
#import "Header.h"
#import "GCCommunityTableViewCell.h"

@implementation GCCommunityTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
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
    
    self.backgroundColor = [UIColor whiteColor];
    
    
    self.bottomview= [[UIView alloc]init];
    self.bottomview.backgroundColor = [UIColor whiteColor];
    self.bottomview.layer.shadowColor = [UIColor colorWithRed:84/255.0 green:115/255.0 blue:194/255.0 alpha:0.1].CGColor;
    self.bottomview.layer.shadowOffset = CGSizeMake(0,2);
    self.bottomview.layer.shadowOpacity = 1;
    self.bottomview.layer.shadowRadius = 10;
    self.bottomview.layer.cornerRadius = 5;
    [self addSubview:self.bottomview];
    [self.bottomview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).mas_offset(16*applicationScale_iphone6);
        make.top.equalTo(self.mas_top).mas_offset(0);
        make.right.equalTo(self.mas_right).mas_offset(-16*applicationScale_iphone6);
        make.bottom.equalTo(self.mas_bottom).mas_offset(0);
        
    }];
    self.bottomview.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
    self.bottomview.layer.shadowColor = [UIColor colorWithRed:84/255.0 green:115/255.0 blue:194/255.0 alpha:0.1].CGColor;
    self.bottomview.layer.shadowOffset = CGSizeMake(0,2);
    self.bottomview.layer.shadowOpacity = 1;
    self.bottomview.layer.shadowRadius = 10;
    self.bottomview.layer.cornerRadius = 5;
    

  
    
    [self addSubview:self.headingLabel];
    self.headingLabel.numberOfLines = 2;
    self.headingLabel.textColor = [UIColor colorWithHexString:@"#333333"];
    self.headingLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:16];
    
    [self.headingLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bottomview.mas_left).mas_offset(16*applicationScale_iphone6);
        make.top.equalTo(self.bottomview.mas_top).mas_offset(21*applicationScale_iphone6);
        make.right.equalTo(self.bottomview.mas_right).mas_offset(-16*applicationScale_iphone6);
       
        
    }];
    
    
    [self addSubview:self.describeLabel];
    self.describeLabel.numberOfLines = 2;
    self.describeLabel.textColor = [UIColor colorWithHexString:@"#666666"];
    self.describeLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:13];
    
    [self.describeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bottomview.mas_left).mas_offset(16*applicationScale_iphone6);
        make.top.equalTo(self.headingLabel.mas_bottom).mas_offset(14*applicationScale_iphone6);
        make.right.equalTo(self.bottomview.mas_right).mas_offset(-16*applicationScale_iphone6);
        
        
    }];
    
    [self addSubview:self.concoctleftImageView];
    self.concoctleftImageView.backgroundColor= [UIColor yellowColor];
    [self.concoctleftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bottomview.mas_left).mas_offset(15*applicationScale_iphone6);
        make.top.equalTo(self.describeLabel.mas_bottom).mas_offset(15*applicationScale_iphone6);
        
        make.width.mas_equalTo(101*applicationScale_iphone6);
        make.height.mas_equalTo(101*applicationScale_iphone6);
        
        
    }];
    [self addSubview:self.concoctmiddleImageView];
    self.concoctmiddleImageView.backgroundColor= [UIColor yellowColor];
    [self.concoctmiddleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.concoctleftImageView.mas_right).mas_offset(5*applicationScale_iphone6);
        make.top.equalTo(self.describeLabel.mas_bottom).mas_offset(15*applicationScale_iphone6);
        
        make.width.mas_equalTo(101*applicationScale_iphone6);
        make.height.mas_equalTo(101*applicationScale_iphone6);
        
        
    }];
    [self addSubview:self.concoctrightImageView];
    self.concoctrightImageView.backgroundColor= [UIColor yellowColor];
    [self.concoctrightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.concoctmiddleImageView.mas_right).mas_offset(5*applicationScale_iphone6);
        make.top.equalTo(self.describeLabel.mas_bottom).mas_offset(15*applicationScale_iphone6);
        
        make.width.mas_equalTo(101*applicationScale_iphone6);
        make.height.mas_equalTo(101*applicationScale_iphone6);
        
        
    }];
    
    [self addSubview:self.authoricon];
    self.authoricon.backgroundColor = [UIColor redColor];
    self.authoricon.layer.cornerRadius = 30*applicationScale_iphone6/2;
    [self.authoricon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bottomview.mas_left).mas_offset(15*applicationScale_iphone6);
        make.top.equalTo(self.concoctrightImageView.mas_bottom).mas_offset(15*applicationScale_iphone6);
        
        make.width.mas_equalTo(30*applicationScale_iphone6);
        make.height.mas_equalTo(30*applicationScale_iphone6);
        
        
    }];
    
    [self addSubview:self.authorLabel];
    self.authorLabel.numberOfLines = 1;
    self.authorLabel.textColor = [UIColor colorWithHexString:@"#999999"];
    self.authorLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
    
    [self.authorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.authoricon.mas_right).mas_offset(5*applicationScale_iphone6);
        make.centerY.equalTo(self.authoricon.mas_centerY).mas_offset(0);

    }];
    UIView * lineview = [[UIView alloc]init];
    lineview.backgroundColor = [UIColor colorWithHexString:@"#EBEBEB"];
    [self addSubview:lineview];
    [lineview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bottomview.mas_left).mas_offset(15*applicationScale_iphone6);
        make.right.equalTo(self.bottomview.mas_right).mas_offset(-15*applicationScale_iphone6);
        make.bottom.equalTo(self.bottomview.mas_bottom).mas_offset(0);
         make.height.mas_equalTo(1);
        
    }];
    
    self.headingLabel.text = @"多地爆发，传染性极强！是你的卡不付款浓缩咖啡呢";
    
    self.describeLabel.text = @"你手机发你你说卡饭能，看房能看房了可能三鹿奶粉空文件时间富婆是免费了，入说了法门寺牢骚满腹……";
    
    self.authorLabel.text = @"有趣的灵魂";
    
}
-(UIImageView * )concoctleftImageView{
    
    if (!_concoctleftImageView) {
        _concoctleftImageView = [[UIImageView alloc] init];
    }
    return _concoctleftImageView;
    
}
-(UIImageView * )concoctmiddleImageView{
    
    if (!_concoctmiddleImageView) {
        _concoctmiddleImageView = [[UIImageView alloc] init];
    }
    return _concoctmiddleImageView;
    
}
-(UIImageView * )concoctrightImageView{
    
    if (!_concoctrightImageView) {
        _concoctrightImageView = [[UIImageView alloc] init];
    }
    return _concoctrightImageView;
    
}
-(UIImageView * )authoricon{
    
    if (!_authoricon) {
        _authoricon = [[UIImageView alloc] init];
    }
    return _authoricon;
    
}

-(UILabel * )headingLabel{
    
    if (!_headingLabel) {
        _headingLabel = [[UILabel alloc] init];
    }
    return _headingLabel;
    
}
-(UILabel * )describeLabel{
    
    if (!_describeLabel) {
        _describeLabel = [[UILabel alloc] init];
    }
    return _describeLabel;
    
}
-(UILabel * )authorLabel{
    
    if (!_authorLabel) {
        _authorLabel = [[UILabel alloc] init];
    }
    return _authorLabel;
    
}
@end

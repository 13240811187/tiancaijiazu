//
//  LearnTableViewCell.m
//  天才家族
//
//  Created by iOS on 2019/4/29.
//  Copyright © 2019 iOS. All rights reserved.
//

#import "LearnTableViewCell.h"
#import "Header.h"
@interface LearnTableViewCell ()

@property (nonatomic,strong)UIView * BGView;
@property (nonatomic,strong)UIImageView * iconImageView;
@property (nonatomic,strong)UIImageView * toolImageView;

@property (nonatomic,strong)UILabel * iconLabel;
@property (nonatomic,strong)UILabel * ageLabel;
@property (nonatomic,strong)UILabel * agedetailsLabel;
@property (nonatomic,strong)UILabel * priceLabel1;
@property (nonatomic,strong)UILabel * priceLabel2;
@property (nonatomic,strong)UILabel * priceLine;



@end


@implementation LearnTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier andIndexPath:(NSIndexPath *)indexPath
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
    
        [self.contentView addSubview:self.BGView];
     
        [self.BGView addSubview:self.iconImageView];
        
           [self.BGView addSubview:self.iconLabel];
            [self.BGView addSubview:self.toolImageView];
           [self.BGView addSubview:self.ageLabel];
           [self.BGView addSubview:self.agedetailsLabel];
           [self.BGView addSubview:self.priceLabel1];
           [self.BGView addSubview:self.priceLabel2];
           [self.priceLabel2 addSubview:self.priceLine];
        
        
        
        self.iconImageView.backgroundColor = [UIColor redColor];
        
        self.BGView.backgroundColor = [UIColor yellowColor];
        
        
        self.iconLabel.text = @"艺术感探索个";
          self.ageLabel.text = @"1岁3个月-4岁";
        
        
        NSAttributedString *attrText = [responseBuilder attrTextLableTitle:@"1岁3个月-4岁z抓的是卢卡库劳动法律考试的卡拉斯弗兰克的萨摩贷款拉萨弗兰克款拉萨弗兰克款拉萨弗兰克" textFont:FontArial(12*applicationScale_iphone6) Emptylen:0 linespacing:4 LabelWidth:self.BGView.width-20-15-self.iconImageView.width];
    
        
        self.agedetailsLabel.attributedText = attrText;
        
        self.priceLabel1.attributedText = [self symbolStr:@"¥" andPriceStr:@"10.3" andPrice2:@"起"];
        
        self.toolImageView.image = [UIImage imageNamed:@"toolImageView"];
        self.priceLabel2.text = @"¥79";
        
        
        
    }
    return self;
}



- (UIView *)BGView{
    
    if (!_BGView) {
        _BGView = [[UIView alloc] initWithFrame:CGRectMake(15,5*applicationScale_iphone6,SCWIDTH-30,120*applicationScale_iphone6)];
        _BGView.backgroundColor = [UIColor whiteColor];
        _BGView.layer.shadowColor =MainShadowColor.CGColor;//shadowColor阴影颜色
        _BGView.layer.shadowOpacity = 1.0f;
        _BGView.layer.shadowRadius = 4;
        _BGView.layer.shadowOffset = CGSizeMake(4,4);
        // _BGView.layer.sh
        _BGView.layer.cornerRadius = 4;
        
    }
    
    return _BGView;
}




- (UIImageView *)iconImageView{
    
    if (!_iconImageView) {
        
        _iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10,10*applicationScale_iphone6,100*applicationScale_iphone6,100*applicationScale_iphone6)];
     
        _iconImageView.layer.cornerRadius = 4;
        _iconImageView.layer.masksToBounds = YES;
        
        _iconImageView.contentMode = UIViewContentModeScaleAspectFill;
        [_iconImageView setClipsToBounds:YES];
        
    }
    
    return _iconImageView;
    
    
}




- (UILabel *)iconLabel{
    
    if (!_iconLabel) {
        
        
        _iconLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.iconImageView.right+15,self.iconImageView.y,110,20*applicationScale_iphone6)];

        _iconLabel.font = FontArial(15*applicationScale_iphone6);
        _iconLabel.textColor = [RGBColor colorWithHexString:@"#666666"];
        
        
    }
    
    return _iconLabel;
}




- (UIImageView *)toolImageView{
    
    if (!_toolImageView) {
        
        _toolImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.iconLabel.right+5,self.iconLabel.y,53,20)];
    
        _toolImageView.contentMode = UIViewContentModeScaleAspectFill;
        [_toolImageView setClipsToBounds:YES];
        
    }
    
    return _toolImageView;
    
    
}



- (UILabel *)ageLabel{
    
    if (!_ageLabel) {
        
        
        _ageLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.iconLabel.x,self.iconLabel.bottom,120,20*applicationScale_iphone6)];
        
        _ageLabel.font = FontArial(12*applicationScale_iphone6);
        _ageLabel.textColor = titleAgeLabelColor;
        
        
    }
    
    return _ageLabel;
}


- (UILabel *)agedetailsLabel{
    
    if (!_agedetailsLabel) {
        
        
        _agedetailsLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.iconLabel.x,self.ageLabel.bottom,self.BGView.width-20-15-self.iconImageView.width,32*applicationScale_iphone6)];
        
        _agedetailsLabel.font = FontArial(11*applicationScale_iphone6);
        _agedetailsLabel.textColor = TitleTextColor;
        _agedetailsLabel.numberOfLines = 0;
        
    }
    
    return _agedetailsLabel;
}



- (UILabel *)priceLabel1{
    
    if (!_priceLabel1) {


        _priceLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(self.iconLabel.x,self.BGView.height-35*applicationScale_iphone6,70,25*applicationScale_iphone6)];

        

    }

    return _priceLabel1;
}


- (UILabel *)priceLabel2{
    
    if (!_priceLabel2) {
        
        
        _priceLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(self.priceLabel1.right+5,self.priceLabel1.y+8*applicationScale_iphone6,30,15*applicationScale_iphone6)];
        _priceLabel2.font = FontArial(11*applicationScale_iphone6);
        _priceLabel2.textColor = TitleTextColor;
        _priceLabel2.textAlignment = NSTextAlignmentCenter;
      

    }
    
    return _priceLabel2;
}



- (UILabel *)priceLine{
    
    if (!_priceLine) {
        
        
        _priceLine = [[UILabel alloc] initWithFrame:CGRectMake(0,8,self.priceLabel2.width,1)];
   
        _priceLine.backgroundColor = TitleTextColor;
        
        
        
    }
    
    return _priceLine;
}




//取消cell高亮
-(void)setSelected:(BOOL)selected animated:(BOOL)animated

{
    
    
}



-(void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated

{
    
    
}



- (NSMutableAttributedString *)symbolStr:(NSString *)symbol andPriceStr:(NSString *)price andPrice2:(NSString *)price2{
    
    NSString * string = [NSString stringWithFormat:@"%@ %@ %@",symbol,price,price2];
    // 创建对象.
    NSMutableAttributedString *mAttStri = [[NSMutableAttributedString alloc] initWithString:string];
    
    NSRange range = [string rangeOfString:symbol];
    NSRange priceran = [string rangeOfString:price];
     NSRange priceran2 = [string rangeOfString:price2];
    
    [mAttStri addAttribute:NSForegroundColorAttributeName value:titlePriceLabelColor range:range];
    [mAttStri addAttribute:NSForegroundColorAttributeName value:titlePriceLabelColor range:priceran];
    [mAttStri addAttribute:NSForegroundColorAttributeName value:MainLabelTextColor range:priceran2];
    
    
     [mAttStri addAttribute:NSFontAttributeName value:FontBold(12) range:range];
     [mAttStri addAttribute:NSFontAttributeName value:FontArial(19) range:priceran];
     [mAttStri addAttribute:NSFontAttributeName value:FontArial(11) range:priceran2];
    
    
    return mAttStri;
    
}






@end

//
//  GCHomeVideoTableViewCell.m
//  天才家族
//
//  Created by iOS2 on 2019/4/27.
//  Copyright © 2019 iOS. All rights reserved.
//
#import "GCVideoCollectonView.h"
#import "GCVideoInfoItem.h"
#import "Header.h"
#import "GCHomeVideoTableViewCell.h"
#import "GCVideoCollectionViewCell.h"
@interface GCHomeVideoTableViewCell()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic,strong)UIView * bottomview ;
@property (nonatomic, strong) NSMutableArray *dataArr;

@end
@implementation GCHomeVideoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

   
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _dataArr = [NSMutableArray array];
        [self initsubviews];
    }
    return self;
}
-(void)initsubviews{
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.bottomview];
    [self.bottomview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).mas_offset(16*applicationScale_iphone6);
        make.top.equalTo(self.mas_top).mas_offset(0);
        make.right.equalTo(self.mas_right).mas_offset(-16*applicationScale_iphone6);
        make.bottom.equalTo(self.mas_bottom).mas_offset(0);
        
    }];
    
    [self addSubview:self.topView];
    self.topView.layer.cornerRadius = 2;
    self.topView.clipsToBounds = YES;
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).mas_offset(16*applicationScale_iphone6);
        make.top.equalTo(self.mas_top).mas_offset(0);
        make.right.equalTo(self.mas_right).mas_offset(-16*applicationScale_iphone6);
        
        make.height.mas_equalTo(153*applicationScale_iphone6);
       
    }];
    [self addSubview:self.advertisementImageView];
    self.advertisementImageView.backgroundColor = [UIColor yellowColor];
    [self.advertisementImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).mas_offset(16*applicationScale_iphone6);
        make.bottom.equalTo(self.mas_bottom).mas_offset(0);
        make.right.equalTo(self.mas_right).mas_offset(-16*applicationScale_iphone6);
       make.height.mas_equalTo(65*applicationScale_iphone6);
        
    }];
    
}
-(void)GivetopViewData:(NSDictionary *)dictData{
    
    
    for (int i = 0; i<3; i++) {
        GCVideoInfoItem * model = [[GCVideoInfoItem alloc]init];
        model.url = @"http://flv3.bn.netease.com/tvmrepo/2018/6/H/9/EDJTRBEH9/SD/EDJTRBEH9-mobile.mp4";
        model.durgion = 30.00;
        [self.dataArr addObject:model];
    }
    [self.topView reloadData];
    
}
-(UIView*)bottomview{
    
    if (!_bottomview) {
        _bottomview = [[UIView alloc] init];
        _bottomview.backgroundColor = [UIColor whiteColor];
    }
    return _bottomview;
}

-(UIImageView * )advertisementImageView{
    
    if (!_advertisementImageView) {
        _advertisementImageView = [[UIImageView alloc] init];
    }
    return _advertisementImageView;
    
}
-(UICollectionView * )topView{
    
    if (!_topView) {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        
        layout.itemSize = CGSizeMake(111*applicationScale_iphone6, 153*applicationScale_iphone6);
       
        layout.minimumLineSpacing = 5;
        // 设置垂直间距
        layout.minimumInteritemSpacing = 5;
        _topView.showsHorizontalScrollIndicator = NO;
        _topView.showsVerticalScrollIndicator = NO;
        
        _topView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)
                                      collectionViewLayout:layout];
        _topView.dataSource = self;
        _topView.delegate = self;
        [_topView registerClass:[GCVideoCollectionViewCell class]
     forCellWithReuseIdentifier:@"GCVideoCollectionViewCell"];
        _topView.backgroundColor = [UIColor yellowColor];
        
    }
    return _topView;
}
#pragma mark - UICollectionViewDataSource,UICollectionViewDelegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.delegate respondsToSelector:@selector(didSelectItemAtIndexPath:)]) {
        
        [self.delegate didSelectItemAtIndexPath:indexPath];
    }
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    GCVideoCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GCVideoCollectionViewCell"
                                                                                 forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    GCVideoInfoItem * photoItem = self.dataArr[indexPath.row];
    [cell bindWithModel:photoItem];
    
    
    return cell;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    
    return 5;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    
    return 5;
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
   
    return CGSizeMake(111*applicationScale_iphone6, 153*applicationScale_iphone6);
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    return nil;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    return CGSizeZero;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    
    return CGSizeZero;
}

@end

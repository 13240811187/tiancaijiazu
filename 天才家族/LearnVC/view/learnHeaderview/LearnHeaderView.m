//
//  LearnHeaderView.m
//  天才家族
//
//  Created by iOS on 2019/4/29.
//  Copyright © 2019 iOS. All rights reserved.
//

#import "LearnHeaderView.h"
#import "Header.h"
#import "LarnHeaderCollectionViewCell.h"

@interface LearnHeaderView ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong)UICollectionView *collectionView;



@end
@implementation LearnHeaderView

static NSString * const LarnHeaderCollectionViewCellindentifer = @"LarnHeaderCollectionViewCellindentifer";

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self addSubview:self.collectionView];
    
        
        
    }
    
    return self;
}







- (UICollectionView *)collectionView{
    
    if (!_collectionView) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.itemSize = CGSizeMake(SCWIDTH/4,65*applicationScale_iphone6);
        // 设置最小行间距
        layout.minimumLineSpacing = 0;
        // 设置垂直间距
        layout.minimumInteritemSpacing = 0;
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        //设置自动滚动的方向 横向
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0,0,SCWIDTH,85*applicationScale_iphone6) collectionViewLayout:layout];
        
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor redColor];
        _collectionView.showsHorizontalScrollIndicator = NO;
         _collectionView.showsVerticalScrollIndicator = NO;
        
        // 注册
        [_collectionView registerClass:[LarnHeaderCollectionViewCell class] forCellWithReuseIdentifier:LarnHeaderCollectionViewCellindentifer];
        
        
    }
    
    return _collectionView;
    
    
}






- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LarnHeaderCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:LarnHeaderCollectionViewCellindentifer forIndexPath:indexPath];
    
//    HomeModel2 * Model = [self.NewMerchantsArray objectAtIndex:indexPath.row];
//    cell.Model = Model;
    
    return cell;
    
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
//    HomeModel2 * Model = [self.NewMerchantsArray objectAtIndex:indexPath.row];
//
//    if (self.NewMerchantsDelegate&&[self.NewMerchantsDelegate respondsToSelector:@selector(NewMerchantsViewdidSelectItemHomeModel:)]) {
//
//        [self.NewMerchantsDelegate NewMerchantsViewdidSelectItemHomeModel:Model];
//
//    }
    
    
}



@end

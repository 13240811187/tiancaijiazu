//
//  GCHomeVideoTableViewCell.h
//  天才家族
//
//  Created by iOS2 on 2019/4/27.
//  Copyright © 2019 iOS. All rights reserved.
//
#import "GCVideoCollectonView.h"
#import <UIKit/UIKit.h>
#import "GCVideoInfoItem.h"
NS_ASSUME_NONNULL_BEGIN
@protocol GCHomeVideoTableViewCellDelegate <NSObject>

/** 点击的CollectionView Cell */
- (void)didSelectItemAtIndexPath:(NSIndexPath *)indexPath;
@end

@interface GCHomeVideoTableViewCell : UITableViewCell

@property (nonatomic,strong) UICollectionView * topView;

@property (nonatomic,strong)UIImageView * advertisementImageView;

@property (nonatomic , assign) id<GCHomeVideoTableViewCellDelegate> delegate;


-(void)GivetopViewData:(NSDictionary *)dictData;


@end

NS_ASSUME_NONNULL_END

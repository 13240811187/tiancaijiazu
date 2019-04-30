//
//  GCVideoCollectionViewCell.h
//  天才家族
//
//  Created by iOS2 on 2019/4/27.
//  Copyright © 2019 iOS. All rights reserved.
//
#import "GCVideoInfoItem.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GCVideoCollectionViewCell : UICollectionViewCell


- (void)bindWithModel:(GCVideoInfoItem *)model;
@end

NS_ASSUME_NONNULL_END

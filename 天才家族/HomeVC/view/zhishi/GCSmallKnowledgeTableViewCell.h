//
//  GCSmallKnowledgeTableViewCell.h
//  天才家族
//
//  Created by iOS2 on 2019/4/27.
//  Copyright © 2019 iOS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GCAudioInfoItem.h"
NS_ASSUME_NONNULL_BEGIN

@interface GCSmallKnowledgeTableViewCell : UITableViewCell

@property(nonatomic,strong)UIImageView * playicon ;

@property(nonatomic,strong)UILabel * titleLabel;


- (void)refreshPlayStatus:(BOOL)playBool;


- (void)bindWithModel:(GCAudioInfoItem *)model;

@end

NS_ASSUME_NONNULL_END

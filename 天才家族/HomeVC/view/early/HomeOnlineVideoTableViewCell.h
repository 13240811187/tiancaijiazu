//
//  HomeOnlineVideoTableViewCell.h
//  天才家族
//
//  Created by iOS on 2019/4/27.
//  Copyright © 2019 iOS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Header.h"

@class GCVideoInfoItem;
@protocol HomeOnlineVideoTableViewCellPlayDelegate <NSObject>

- (void)HomeOnlineVideoTableViewCellZFPlayerController:(ZFPlayerController*)player;
- (void)HomeOnlineVideoTableViewCellPlayerOrientationWillChange;

@end
@interface HomeOnlineVideoTableViewCell : UITableViewCell
//视频
@property (nonatomic, strong) ZFPlayerController *player;

@property(weak,nonatomic)id<HomeOnlineVideoTableViewCellPlayDelegate>delegate;

-(void)SetFirstCollectionViewCellSelected;

@property (nonatomic, strong)GCVideoInfoItem * videoModel;


@end

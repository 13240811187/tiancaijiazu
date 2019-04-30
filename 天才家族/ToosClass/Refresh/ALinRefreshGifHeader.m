//
//  ALinRefreshGifHeader.m
//  MiaowShow
//
//  Created by ALin on 16/6/14.
//  Copyright © 2016年 ALin. All rights reserved.
//

#import "ALinRefreshGifHeader.h"

@implementation ALinRefreshGifHeader

- (instancetype)init
{
    if (self = [super init]) {
        self.lastUpdatedTimeLabel.hidden = YES;
        self.stateLabel.hidden = YES;
        [self setImages:@[[UIImage imageNamed:@"hold1_60x72"], [UIImage imageNamed:@"hold2_60x72"], [UIImage imageNamed:@"hold3_60x72"]]  forState:MJRefreshStateRefreshing];
        [self setImages:@[[UIImage imageNamed:@"hold1_60x72"], [UIImage imageNamed:@"hold2_60x72"], [UIImage imageNamed:@"hold3_60x72"]]  forState:MJRefreshStatePulling];
        [self setImages:@[[UIImage imageNamed:@"hold1_60x72"], [UIImage imageNamed:@"hold2_60x72"], [UIImage imageNamed:@"hold3_60x72"]]  forState:MJRefreshStateIdle];
    }
    return self;
}

@end

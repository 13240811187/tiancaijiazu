//
//  GCTabviewHeadButtonView.h
//  天才家族
//
//  Created by 乔光玉 on 2019/4/28.
//  Copyright © 2019年 iOS. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^whichbuttonclick)(UIButton * sender);


@interface GCTabviewHeadButtonView : UIView


@property (nonatomic, copy) whichbuttonclick whichBlock;


@end

NS_ASSUME_NONNULL_END

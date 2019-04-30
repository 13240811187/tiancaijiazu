//
//  GCSegmentedPageView.h
//  天才家族
//
//  Created by iOS2 on 2019/4/27.
//  Copyright © 2019 iOS. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^WhichOneSelected)(NSInteger teger);

@interface GCSegmentedPageView : UIView

@property (nonatomic,strong) WhichOneSelected whichOneSelectedBlock;

@end

NS_ASSUME_NONNULL_END

//
//  LearnHeaderView.h
//  天才家族
//
//  Created by iOS on 2019/4/29.
//  Copyright © 2019 iOS. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LearnHeaderViewSelectItemDelegate <NSObject>



@end

@interface LearnHeaderView : UIView

@property(weak,nonatomic)id<LearnHeaderViewSelectItemDelegate>delegate;


@end


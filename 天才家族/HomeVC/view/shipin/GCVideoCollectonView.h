//
//  GCVideoCollectonView.h
//  天才家族
//
//  Created by 乔光玉 on 2019/4/28.
//  Copyright © 2019年 iOS. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^whichNSIntegerImageView)(NSInteger whichmageView);


@interface GCVideoCollectonView : UIView

@property (nonatomic, copy) whichNSIntegerImageView whichBlock;
@property(nonatomic,strong)UIImageView * imageleft ;
@property(nonatomic,strong)UIImageView * imagemiddle ;
@property(nonatomic,strong)UIImageView * imageright ;
@property(nonatomic,strong)UILabel * labelleft;
@property(nonatomic,strong)UILabel * labelmiddle;
@property(nonatomic,strong)UILabel * labelright;
@end

NS_ASSUME_NONNULL_END

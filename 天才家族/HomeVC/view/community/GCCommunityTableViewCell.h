//
//  GCCommunityTableViewCell.h
//  天才家族
//
//  Created by 乔光玉 on 2019/4/28.
//  Copyright © 2019年 iOS. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GCCommunityTableViewCell : UITableViewCell
@property (nonatomic,strong)UIView * bottomview ;
@property (nonatomic,strong)UILabel  *  headingLabel;
@property (nonatomic,strong)UILabel  *  describeLabel;
@property (nonatomic,strong)UIImageView * concoctleftImageView;
@property (nonatomic,strong)UIImageView * concoctmiddleImageView;
@property (nonatomic,strong)UIImageView * concoctrightImageView;
@property (nonatomic,strong)UIImageView * authoricon;
@property (nonatomic,strong)UILabel  *  authorLabel;
@end

NS_ASSUME_NONNULL_END

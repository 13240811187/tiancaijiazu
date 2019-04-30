//
//  GCCommunityFirstTableViewCell.h
//  天才家族
//
//  Created by iOS2 on 2019/4/29.
//  Copyright © 2019 iOS. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GCCommunityFirstTableViewCell : UITableViewCell
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

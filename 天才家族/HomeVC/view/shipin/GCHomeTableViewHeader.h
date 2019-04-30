//
//  GCHomeTableViewHeader.h
//  天才家族
//
//  Created by iOS2 on 2019/4/27.
//  Copyright © 2019 iOS. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GCHomeTableViewHeader : UIView

@property(nonatomic,strong)UILabel * titleLabel;

@property(nonatomic,strong)UIImageView * icon ;

@property(nonatomic,strong)UILabel * allLabel;

@property (nonatomic,strong) NSDictionary *dictData;
@end

NS_ASSUME_NONNULL_END

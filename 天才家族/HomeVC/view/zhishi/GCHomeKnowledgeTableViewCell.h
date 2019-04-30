//
//  GCHomeKnowledgeTableViewCell.h
//  天才家族
//
//  Created by iOS2 on 2019/4/27.
//  Copyright © 2019 iOS. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol GCHomeKnowledgeTableViewCellDelegate <NSObject>

/** 点击的UITableViewCell Cell */
- (void)didSelectKnowledgeTableViewItemAtIndexPath:(NSIndexPath *)indexPath Whichshow:(NSInteger) whichshow;
@end
@interface GCHomeKnowledgeTableViewCell : UITableViewCell

@property(nonatomic,strong)NSMutableArray * leftMutableArray;

@property(nonatomic,strong)NSMutableArray * rightMutableArray;

@property(nonatomic,strong)UIView * backgroundview ;

@property (nonatomic,strong) UITableView *twelveTableView;

@property (nonatomic , assign) id<GCHomeKnowledgeTableViewCellDelegate> delegate;

- (void)refreshWhichshow:(NSInteger) whichshow;

-(void)SetNormalModel;

@end

NS_ASSUME_NONNULL_END

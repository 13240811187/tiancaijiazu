//
//  GCHomeKnowledgeTableViewCell.m
//  天才家族
//
//  Created by iOS2 on 2019/4/27.
//  Copyright © 2019 iOS. All rights reserved.
//
#import "GCAudioInfoItem.h"

#import "GCSmallKnowledgeTableViewCell.h"
#import "GCSegmentedPageView.h"
#import "GCHomeKnowledgeTableViewCell.h"
#import "Header.h"
@interface GCHomeKnowledgeTableViewCell()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)GCSegmentedPageView * sengmentpageView;
@property (nonatomic,assign)NSInteger which;

@property (nonatomic,strong)GCAudioInfoItem * selectedmodel;
@end
@implementation GCHomeKnowledgeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
   self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initsubviews];
    }
    return self;
}
-(void)initsubviews{
    self.backgroundColor = [UIColor whiteColor];
    self.leftMutableArray = [NSMutableArray array];
    self.rightMutableArray = [NSMutableArray array];
    for (int i=0 ; i<3; i++) {
        GCAudioInfoItem * model = [[GCAudioInfoItem alloc]init];
        model.title = @"12345678";
        [self.leftMutableArray addObject:model];
        [self.rightMutableArray addObject:model];
    }
    _backgroundview= [[UIView alloc]initWithFrame:CGRectMake(16*applicationScale_iphone6,1 , 343*applicationScale_iphone6, 153*applicationScale_iphone6-2)];
    _backgroundview.backgroundColor = [UIColor redColor];
    _backgroundview.layer.shadowColor = [UIColor colorWithRed:84/255.0 green:115/255.0 blue:194/255.0 alpha:0.1].CGColor;
    _backgroundview.layer.shadowOffset = CGSizeMake(0,2);
    _backgroundview.layer.shadowOpacity = 1;
    _backgroundview.layer.shadowRadius = 10;
    _backgroundview.layer.cornerRadius = 5;
    [self addSubview:_backgroundview];
    
    
    self.sengmentpageView = [[GCSegmentedPageView alloc]initWithFrame:CGRectMake(0, 0, _backgroundview.width, 31*applicationScale_iphone6)];
    
    self.sengmentpageView.whichOneSelectedBlock = ^(NSInteger teger) {
        
    };
    [_backgroundview addSubview:self.sengmentpageView];
    _twelveTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 31*applicationScale_iphone6,_backgroundview.width ,122*applicationScale_iphone6-2 ) style:UITableViewStylePlain];
    _twelveTableView.delegate = self;
    _twelveTableView.dataSource = self;
    _twelveTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [_backgroundview addSubview:_twelveTableView];
    [_twelveTableView reloadData];
    
}

#pragma mark - UITableViewDelegate & UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (_which==1) {
        
     return self.leftMutableArray.count;
    }else{
     return self.rightMutableArray.count;
        
    }
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    GCSmallKnowledgeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GCSmallKnowledgeTableViewCell"];
    if (!cell) {
        cell = [[GCSmallKnowledgeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"GCSmallKnowledgeTableViewCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    GCAudioInfoItem * model;
    if (_which==1) {
        model = self.leftMutableArray[indexPath.row];
        
        
        
    }else{
        
        model = self.rightMutableArray[indexPath.row];
       
    }
    [cell bindWithModel:model];
    if (model ==_selectedmodel) {
        
        [cell refreshPlayStatus:YES];
        
    }else{
        
         [cell refreshPlayStatus:NO];
    }
    return cell;
    
}
- (void)refreshWhichshow:(NSInteger) whichshow{
    _which = whichshow;
    [self.twelveTableView reloadData];
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return 35*applicationScale_iphone6;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if ([self.delegate respondsToSelector:@selector(didSelectKnowledgeTableViewItemAtIndexPath:Whichshow:)]) {
        [self.delegate didSelectKnowledgeTableViewItemAtIndexPath:indexPath Whichshow:_which];
    }
    GCAudioInfoItem * model;
    switch (_which) {
        case 1:
            model = self.leftMutableArray[indexPath.row];
            break;
            
        default:
            model = self.rightMutableArray[indexPath.row];
            break;
    }
    
    if (model !=_selectedmodel) {
        
        _selectedmodel = model;
        [self.twelveTableView reloadData];
        
        
    }
    
}
-(void)SetNormalModel{
    
    _selectedmodel = nil;
    [self.twelveTableView reloadData];
    
}
@end

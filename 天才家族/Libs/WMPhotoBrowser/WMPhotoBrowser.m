//
//  WMPhotoBrowser.m
//  WMPhotoBrowser
//
//  Created by zhengwenming on 2018/1/2.
//  Copyright © 2018年 zhengwenming. All rights reserved.
//

#import "WMPhotoBrowser.h"
#import "WMPhotoBrowserCell.h"
#import "WMCollectionViewFlowLayout.h"
#import "UIViewController+WMExtension.h"
#import "UIView+SetRect.h"
#import "Header.h"

@interface WMPhotoBrowser ()<UICollectionViewDataSource,UICollectionViewDelegate,UIScrollViewDelegate> {
    
}
@property(nonatomic,assign)BOOL isHideNaviBar;
@property(nonatomic,strong) UICollectionView *collectionView;
@property(nonatomic,strong) UIPageControl *pageControl;
@property(nonatomic,strong) UILabel *pageLabel;

@end

@implementation WMPhotoBrowser
- (BOOL)fullScreenGestureShouldBegin{
    return NO;
}
// 是否支持自动转屏
- (BOOL)shouldAutorotate {
    return NO;
}
// 支持哪些屏幕方向
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAllButUpsideDown;
}
// 默认的屏幕方向（当前ViewController必须是通过模态出来的UIViewController（模态带导航的无效）方式展现出来的，才会调用这个方法）
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationPortrait;
}
- (instancetype)init{
    self = [super init];
    if (self) {
        if (@available(ios 11.0,*)) {
            UIScrollView.appearance.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            UITableView.appearance.estimatedRowHeight = 0;
            UITableView.appearance.estimatedSectionFooterHeight = 0;
            UITableView.appearance.estimatedSectionHeaderHeight = 0;
        }else{
            if([self respondsToSelector:@selector(automaticallyAdjustsScrollViewInsets)]){
                self.automaticallyAdjustsScrollViewInsets=NO;
            }
        }
    }
    return self;
}


- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}
-(void)deleteTheImage:(UIBarButtonItem *)sender{
        if (self.dataSource.count==1) {
            
            [self.dataSource removeObjectAtIndex:0];
            
            if (self.delegate&&[self.delegate respondsToSelector:@selector(WMPhotoBrowserDeleteTag:)]) {
                
                [self.delegate WMPhotoBrowserDeleteTag:self.currentPhotoIndex];
                
            }
            
            [self.navigationController popViewControllerAnimated:YES];
            
            
            
        }else{
            
            if (self.dataSource.count==0) {
                
                return;
            }
            
            
            [self.dataSource removeObjectAtIndex:self.currentPhotoIndex];
            
            
            if (self.delegate&&[self.delegate respondsToSelector:@selector(WMPhotoBrowserDeleteTag:)]) {
                
                [self.delegate WMPhotoBrowserDeleteTag:self.currentPhotoIndex];
                
            }
            
            NSString * cur = [NSString stringWithFormat:@"%ld", self.currentPhotoIndex + 1];
        
            NSString * s = [NSString stringWithFormat:@"%@ / %d", cur,(int)self.dataSource.count];
            
            NSMutableAttributedString * attriS = [[NSMutableAttributedString alloc] initWithString:s];
            [attriS addAttribute:NSForegroundColorAttributeName
                           value:MainColor
                           range:NSMakeRange(0, cur.length)];
            
            self.pageLabel.attributedText = attriS;
       
            self.pageControl.numberOfPages = self.dataSource.count;
            self.pageControl.currentPage = self.currentPhotoIndex;
            [self.collectionView reloadData];
            
        }
    
    if (self.deleteBlock) {
        self.deleteBlock(self.dataSource,self.currentPhotoIndex,self.collectionView);
    }
    
    
}


- (UILabel *)pageLabel{
   
    if (!_pageLabel) {
        _pageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,SCHEIGHT-40,SCWIDTH, 30)];
        
        _pageLabel.backgroundColor = [UIColor clearColor];
        _pageLabel.textAlignment = NSTextAlignmentCenter;
        _pageLabel.textColor = [UIColor whiteColor];
        
    }
    
    return _pageLabel;
}


-(UICollectionView *)collectionView{
    if (_collectionView==nil) {
        WMCollectionViewFlowLayout *layout = [[WMCollectionViewFlowLayout alloc] init];
        layout.imgaeGap = 20;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width , self.view.frame.size.height) collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor blackColor];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.pagingEnabled = YES;
        _collectionView.scrollsToTop = NO;
        [_collectionView registerClass:[WMPhotoBrowserCell class] forCellWithReuseIdentifier:@"WMPhotoBrowserCell"];
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.contentOffset = CGPointMake(0, 0);
        _collectionView.contentSize = CGSizeMake(self.view.frame.size.width * self.dataSource.count, self.view.frame.size.height);
    }
    return _collectionView;
}
// 如果实现了iOS8以后的方法, 则旧版方法会覆盖

//视图发生了大小改变的时候会调用此方法   大小改变 == 横竖切换
- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    NSLog(@"size; %@", NSStringFromCGSize(size));
    if ([UIDevice currentDevice].orientation == UIDeviceOrientationLandscapeLeft || [UIDevice currentDevice].orientation == UIDeviceOrientationLandscapeRight) {
        NSLog(@"横屏");
        self.collectionView.frame = CGRectMake(0, 0,size.width,size.height);
        self.pageControl.frame = CGRectMake(0, size.height-30,size.width,30);
        self.pageControl.centerX = self.view.centerX;
        self.pageLabel.frame = CGRectMake(0,size.height-40,size.width, 30);
        
        self.pageLabel.centerX = self.view.centerX;
        
    }else{
        self.collectionView.frame = CGRectMake(0, 0,size.width,size.height);
        self.pageControl.frame = CGRectMake(0, size.height-30,size.width,30);
        self.pageControl.centerX = self.view.centerX;
         self.pageLabel.frame = CGRectMake(0,size.height-40,size.width, 30);
        self.pageLabel.centerX = self.view.centerX;
        
    }
    
}
#pragma mark
#pragma mark viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor blackColor];

    self.isHideNaviBar = NO;
    [self.view addSubview:self.collectionView];
    if (self.dataSource.count) {
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:(self.currentPhotoIndex) inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    }
    
    
    //[self.view addSubview:self.pageControl];
    self.pageControl.numberOfPages = self.dataSource.count;
    self.pageControl.currentPage = self.currentPhotoIndex;
    
    if (self.downLoadNeeded) {
        UIButton *_saveImageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _saveImageBtn.frame = CGRectMake(SCWIDTH-40-15,StatusBar, 40, 40);
        _saveImageBtn.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        [_saveImageBtn setImage:[UIImage imageNamed:@"savePicture"] forState:UIControlStateNormal];
        [_saveImageBtn setImage:[UIImage imageNamed:@"savePicture"] forState:UIControlStateHighlighted];
        [_saveImageBtn addTarget:self action:@selector(saveImage) forControlEvents:UIControlEventTouchUpInside];
        [self.view insertSubview:_saveImageBtn aboveSubview:self.collectionView];
        
    }else if(self.deleteNeeded){
    
        UIButton *_TrashImageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _TrashImageBtn.frame = CGRectMake(SCWIDTH-40-15,StatusBar, 40, 40);
        _TrashImageBtn.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        [_TrashImageBtn setImage:[UIImage imageNamed:@"delectedPhoto"] forState:UIControlStateNormal];
        [_TrashImageBtn setImage:[UIImage imageNamed:@"delectedPhoto"] forState:UIControlStateHighlighted];
        [_TrashImageBtn addTarget:self action:@selector(deleteTheImage:) forControlEvents:UIControlEventTouchUpInside];
        [self.view insertSubview:_TrashImageBtn aboveSubview:self.collectionView];
    
    }
    
  
    [self.view insertSubview:self.pageLabel aboveSubview:self.collectionView];
    
    
    if (self.dataSource.count==1) {
        
    }else{
        
    
        NSString * cur = [NSString stringWithFormat:@"%ld", self.currentPhotoIndex + 1];
        
        
        NSString * s = [NSString stringWithFormat:@"%@ / %d", cur,(int)self.dataSource.count];
        
        NSMutableAttributedString * attriS = [[NSMutableAttributedString alloc] initWithString:s];
        [attriS addAttribute:NSForegroundColorAttributeName
                       value:MainColor
                       range:NSMakeRange(0, cur.length)];
        
        self.pageLabel.attributedText = attriS;
        
    }
    
    
    
    
}
-(UIPageControl *)pageControl{
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-30, self.view.frame.size.width, 30)];
        _pageControl.numberOfPages = 5;
        _pageControl.pageIndicatorTintColor = [UIColor darkGrayColor];
        _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
        _pageControl.backgroundColor = [UIColor clearColor];
    }
    return _pageControl;
}
- (void)saveImage{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:self.currentPhotoIndex inSection:0];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            WMPhotoBrowserCell *currentCell = (WMPhotoBrowserCell *)[_collectionView cellForItemAtIndexPath:indexPath];
            UIImageWriteToSavedPhotosAlbum(currentCell.imageView.image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
        });
    });
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    if (error) {
        [MBProgressHUD showErrorWithText:@"保存失败"];
    } else {
        [MBProgressHUD showSuccessWithText:@"保存成功"];
    }
    if (self.downLoadBlock) {
        self.downLoadBlock(self.dataSource,image,error);
    }
}
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGPoint offSet = scrollView.contentOffset;
    
    self.currentPhotoIndex = offSet.x / self.view.width;
    
    
    NSString * cur = [NSString stringWithFormat:@"%ld", self.currentPhotoIndex + 1];
    
    
    NSString * s = [NSString stringWithFormat:@"%@ / %d", cur,(int)self.dataSource.count];
    
    NSMutableAttributedString * attriS = [[NSMutableAttributedString alloc] initWithString:s];
    [attriS addAttribute:NSForegroundColorAttributeName
                   value:MainColor
                   range:NSMakeRange(0, cur.length)];
    
    self.pageLabel.attributedText = attriS;
    
    self.pageControl.currentPage = self.currentPhotoIndex;
    
    
}



#pragma mark - UICollectionViewDataSource && Delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    WMPhotoBrowserCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"WMPhotoBrowserCell" forIndexPath:indexPath];
    cell.model = self.dataSource[indexPath.row];
    __weak typeof(self) weakSelf = self;
    if (!cell.singleTapGestureBlock) {
        cell.singleTapGestureBlock = ^(){
            if (weakSelf.isHideNaviBar==YES) {
                [weakSelf.navigationController popViewControllerAnimated:YES];
            }else{
               [weakSelf.navigationController popViewControllerAnimated:YES];
            }
            weakSelf.isHideNaviBar = !weakSelf.isHideNaviBar;
            [weakSelf dismissViewControllerAnimated:YES completion:^{
                
            }];
        };
    }
    
    
    if (!cell.longPressGestureBlock) {
        cell.longPressGestureBlock = ^(WMPhotoBrowserCell *cell) {
            
            UIAlertController *alertAction = [UIAlertController alertControllerWithTitle:@"保存图片" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
            [alertAction addAction:[UIAlertAction actionWithTitle:@"保存到相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                UIImageWriteToSavedPhotosAlbum(cell.imageView.image, weakSelf,
                                               @selector(image:didFinishSavingWithError:contextInfo:), nil);
            }]];
            
            [alertAction addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                NSLog(@"取消");
            }]];
            [weakSelf presentViewController:alertAction animated:YES completion:^{
                
            }];
        };
    }
    
    cell.currentIndexPath = indexPath;
    NSString * cur = [NSString stringWithFormat:@"%ld", self.currentPhotoIndex + 1];
    
    
    NSString * s = [NSString stringWithFormat:@"%@ / %d", cur,(int)self.dataSource.count];
    
    NSMutableAttributedString * attriS = [[NSMutableAttributedString alloc] initWithString:s];
    [attriS addAttribute:NSForegroundColorAttributeName
                   value:MainColor
                   range:NSMakeRange(0, cur.length)];
    
    self.pageLabel.attributedText = attriS;
    
    
    return cell;
}

- (void)dealloc{
    NSLog(@"%s",__FUNCTION__);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end


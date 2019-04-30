//
//  FirstLoginViewController.m
//  xibao
//
//  Created by work on 15/7/2.
//  Copyright (c) 2015年 klgz. All rights reserved.
//

#import "FirstLoginViewController.h"
#import "AppDelegate.h"
#import "Header.h"
#import "THNavigationController.h"
@interface FirstLoginViewController ()<UIScrollViewDelegate>

@end

@implementation FirstLoginViewController
{
    UIPageControl *pageControl;
    UIScrollView *topScrollview;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"背景图片"]];
    [self createUIAction];
}

- (void)createUIAction{

    
    NSMutableArray *array = [NSMutableArray arrayWithObjects:@"yindao1",@"yindao2",@"yindao3",@"yindao4",nil];
    
    topScrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCWIDTH, SCHEIGHT)];

    topScrollview.contentSize = CGSizeMake(SCWIDTH * array.count, SCHEIGHT);
    topScrollview.showsVerticalScrollIndicator = NO;
    topScrollview.showsHorizontalScrollIndicator = NO;
    topScrollview.scrollEnabled = YES;
    topScrollview.pagingEnabled = YES;
    topScrollview.delegate = self;
    topScrollview.bounces = NO;
    [self.view addSubview:topScrollview];
    // 添加 对应图片
    for (int i = 0; i < array.count; i ++) {
        
        UIImageView *imageView = [[YYAnimatedImageView alloc] initWithFrame:CGRectMake(SCWIDTH * i, 0, SCWIDTH, SCHEIGHT)];
       imageView.contentMode = UIViewContentModeScaleAspectFill;
        [imageView setClipsToBounds:YES];
        
       
        imageView.image = [UIImage imageNamed:array[i]];
        
        imageView.userInteractionEnabled = YES;
        [topScrollview addSubview:imageView];
        if (array.count - 1 == i) {
            UIButton *aBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCWIDTH / 2-175/2, SCHEIGHT - 100,175,40)];
            [aBtn addTarget:self action:@selector(abtnaaa) forControlEvents:UIControlEventTouchUpInside];
            [imageView addSubview:aBtn];


            UIImageView *imagess = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,175,40)];
           imagess.image = [UIImage imageNamed:@"jinquApp"];
            [aBtn addSubview:imagess];

        }
    }
    pageControl = [[UIPageControl alloc]init];
    pageControl.frame = CGRectMake(SCWIDTH / 2 - 10, SCHEIGHT - 50, 20, 20);
//    pageControl.currentPageIndicatorTintColor = [UIColor redColor];
//    pageControl.pageIndicatorTintColor = [UIColor blackColor];
    
    [pageControl setValue:[UIImage imageNamed:@"page_indicator_unfocused.png"] forKeyPath:@"pageImage"];
    [pageControl setValue:[UIImage imageNamed:@"page_indicator_focused.png"] forKeyPath:@"currentPageImage"];
    pageControl.userInteractionEnabled = NO;
    pageControl.numberOfPages = array.count;
    //[self.view addSubview:pageControl];
}
// scrollview delegate
- (void)scrollViewDidScroll:(UIScrollView *)sender {
    int pages = topScrollview.contentOffset.x / SCWIDTH;
    pageControl.currentPage = pages;
    
//    int pagesKey = pages+1;
//    NSString * gifKey = [NSString stringWithFormat:@"%d.gif",pagesKey];
//    YYImageCache *cache = [YYWebImageManager sharedManager].cache;
//      [cache removeImageForKey:gifKey];
//
    
}

// 点击立即体验进入 TabBar
- (void)abtnaaa{
 
//    AppDelegate *aDelegate=(AppDelegate *)[UIApplication sharedApplication].delegate;
//    LogInViewController *mytab=[[LogInViewController alloc]init];
//    aDelegate.window.rootViewController = mytab;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

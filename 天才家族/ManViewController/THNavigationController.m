//
//  THNavigationController.m
//  umengtongji
//
//  Created by Crab on 16/7/15.
//  Copyright © 2016年 Crab. All rights reserved.
//

#import "THNavigationController.h"
#import "Header.h"
#import "UIBarButtonItem+item.h"
#import "CYTabBarController.h"
#define TGColor(r,g,b) [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:1]
#define NavTinColor [TGColor(251,216,95) colorWithAlphaComponent:1]

@implementation THNavigationController


- (void)viewDidLoad {
    [super viewDidLoad];
    
////设置导航栏标题颜色 和 字体大小
self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[RGBColor colorWithHexString:@"#333333"],NSFontAttributeName:[UIFont systemFontOfSize:18.0f]};
   
    
    //完美解决还是用图片吧
    UINavigationBar *bar = [UINavigationBar appearance];
    [bar setBackgroundImage:[UIImage yy_imageWithColor:[UIColor whiteColor]] forBarMetrics:UIBarMetricsDefault];

    
   //设置状态栏的颜色 
 //[self setNeedsStatusBarAppearanceUpdate];
    
}

//设置状态栏的颜色
//-(UIStatusBarStyle)preferredStatusBarStyle
//{
//    return UIStatusBarStyleLightContent;
//    
//}



/**
 *  第一次使用这个类的时候会调用(1个类只会调用1次)
 */
+ (void)initialize
{
    

    // 1.设置导航栏主题
    [self setupNavBarTheme];
    
    // 2.设置导航栏按钮主题
    [self setupBarButtonItemTheme];
}

/**
 *  设置导航栏按钮主题
 */
+ (void)setupBarButtonItemTheme

{
    
   
   // UIBarButtonItem *item = [UIBarButtonItem appearance];
    
//    // 设置背景
//    if (!iOS7) {
//        [item setBackgroundImage:[UIImage imageWithName:@"navigationbar_button_background"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
//        [item setBackgroundImage:[UIImage imageWithName:@"navigationbar_button_background_pushed"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
//        [item setBackgroundImage:[UIImage imageWithName:@"navigationbar_button_background_disable"] forState:UIControlStateDisabled barMetrics:UIBarMetricsDefault];
//    }
    
//    // 设置文字属性
//    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
//    textAttrs[UITextAttributeTextColor] = iOS7 ? [UIColor orangeColor] : [UIColor grayColor];
//    textAttrs[UITextAttributeTextShadowOffset] = [NSValue valueWithUIOffset:UIOffsetZero];
//    textAttrs[UITextAttributeFont] = [UIFont systemFontOfSize:iOS7 ? 14 : 12];
//    [item setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
//    [item setTitleTextAttributes:textAttrs forState:UIControlStateHighlighted];
}

/**
 *  设置导航栏主题
 */
+ (void)setupNavBarTheme
{
    
    
    
//    UINavigationBar *navBar = [UINavigationBar appearance];
//    
//    navBar.backgroundColor = [UIColor blackColor];
    
    
    // 取出appearance对象
  //  UINavigationBar *navBar = [UINavigationBar appearance];
    
//    // 设置背景
//    if (!iOS7) {
//        [navBar setBackgroundImage:[UIImage imageWithName:@"navigationbar_background"] forBarMetrics:UIBarMetricsDefault];
//        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleBlackOpaque;
//    }
    
    // 设置标题属性
//    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
//    textAttrs[UITextAttributeTextColor] = [UIColor blackColor];
//    textAttrs[UITextAttributeTextShadowOffset] = [NSValue valueWithUIOffset:UIOffsetZero];
//    textAttrs[UITextAttributeFont] = [UIFont boldSystemFontOfSize:19];
//    [navBar setTitleTextAttributes:textAttrs];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
  if (self.childViewControllers.count) {
   viewController.hidesBottomBarWhenPushed = NO;// //viewController是下个页面控制器  tabbar隐藏的属性 这个比较特殊 用的NO 一般用YES
      
//      viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem backItemWithimage:[UIImage imageNamed:@"navigationButtonReturnClick"] highImage:[UIImage imageNamed:@"navigationButtonReturn"]  target:self action:@selector(back) title:@"返回"];
      
      // 如果自定义返回按钮后, 滑动返回可能失效, 需要添加下面的代码
      __weak typeof(viewController)Weakself = viewController;
      self.interactivePopGestureRecognizer.delegate = (id)Weakself;

     
    }
    
    [super pushViewController:viewController animated:animated];
    
    
}


- (void)back{
    // 判断两种情况: push 和 present
    if ((self.presentedViewController || self.presentingViewController) && self.childViewControllers.count == 1) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }else
        [self popViewControllerAnimated:YES];

}



@end

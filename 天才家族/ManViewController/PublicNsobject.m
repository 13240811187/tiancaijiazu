//
//  PublicNsobject.m
//  umengtongji
//
//  Created by Crab on 16/8/1.
//  Copyright © 2016年 Crab. All rights reserved.
//

#import "PublicNsobject.h"
#import "FirstLoginViewController.h"
#import "AppDelegate.h"
#import "THNavigationController.h"
#import "CYTabBarController.h"
#import "Header.h"

#import "HomeViewController.h"
#import "LearnViewController.h"
#import "ParentingViewController.h"
#import "MallViewController.h"
#import "MineViewController.h"
#import "GCHomeViewController.h"
@implementation PublicNsobject

+(NSString *)GetBundleVersion{
    
   NSString * version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
    return version;
}
+ (void)mainRootVieController{
    
    //获取工程的版本号
    NSString * version = [PublicNsobject GetBundleVersion];
    
    NSUserDefaults * users = [NSUserDefaults standardUserDefaults];
   
    BOOL bundelVersion = [[users objectForKey:UsersbundelVersion]boolValue];
    
    NSString * versionUsers = [users objectForKey:Usersversion];
    
    
    BOOL userVersion = [versionUsers isEqualToString:version];
    
    
    AppDelegate *aDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;

    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    NSString * token = [userDefaults objectForKey:UsersToken];
    
   // if (bundelVersion&&userVersion&&token) {
        
      
         [PublicNsobject jumpToTabbar];//跳到主页
    
    //}else if (bundelVersion&&userVersion) {
        

//        LogInViewController * tabbar = [[LogInViewController alloc] init];
//
//        aDelegate.window.rootViewController =tabbar;
//
        
//    }else{
//        
//
//        FirstLoginViewController * firstLogin = [[FirstLoginViewController alloc]init];
//        
//        aDelegate.window.rootViewController =firstLogin;
//        
//        [users removeObjectForKey:@"Token"];
//        [users removeObjectForKey:@"PassWordString"];
//        [users removeObjectForKey:@"UserID"];
//    
//        
//        [users setBool:YES forKey:@"bundelVersion"];
//        
//        if (userVersion==NO) {
//            
//            [users removeObjectForKey:@"version"];
//            
//            [users synchronize];
//            
//        }
//        
//       [users setObject:version forKey:@"version"];
//        
//        // 同步
//        [users synchronize];
//      }
//    

}


+ (void)jumpToTabbar{
    
            CYTabBarController *tabbar = [[CYTabBarController alloc]init];
    
    
            /**
             *  配置外观
             */
    [CYTabBarConfig shared].selectedTextColor = TableBarLightedTextColor;//选中状态下文字的颜色
    [CYTabBarConfig shared].textColor = TableBarNormalTextColor;//普通状态下 文字的颜色
    //[CYTabBarConfig shared].backgroundColor = [UIColor greenColor];//tabBar 的背景颜色
    [CYTabBarConfig shared].selectIndex = 0;
    //[CYTabBarConfig shared].centerBtnIndex = 2; 中间按钮所在位置
    
    [CYTabBarConfig shared].HidesBottomBarWhenPushedOption = HidesBottomBarWhenPushedAlone;
    
            /**
             *  style 1 (中间按钮突出 ， 设为按钮 , 底部有文字 ， 闲鱼)
             */
            THNavigationController *nav1 = [[THNavigationController alloc]initWithRootViewController:[GCHomeViewController new]];
            [tabbar addChildController:nav1 title:@"首页" imageName:@"tabar_homeicon_normal" selectedImageName:@"tabar_homeicon_selected"];
    
            THNavigationController *nav2 = [[THNavigationController alloc]initWithRootViewController:[LearnViewController new]];
            [tabbar addChildController:nav2 title:@"学院" imageName:@"tabar_collegeicon_normal" selectedImageName:@"tabar_collegeicon_selected"];
    
    
//        THNavigationController *nav3 = [[THNavigationController alloc]initWithRootViewController:[YReleaseViewController new]];
//        [tabbar addCenterController:nav3 bulge:YES  title:@"发布" imageName:@"popupnomal" selectedImageName:@"popupnomal"];

    
    THNavigationController *nav3 = [[THNavigationController alloc]initWithRootViewController:[ParentingViewController new]];
    [tabbar addChildController:nav3 title:@"天才家族" imageName:@"tabar_geniusicon_normal" selectedImageName:@"tabar_geniusicon_selected"];
    
    
    
            THNavigationController *nav4 = [[THNavigationController alloc]initWithRootViewController:[MallViewController new]];
            [tabbar addChildController:nav4 title:@"社区" imageName:@"tabar_communityicon_normal" selectedImageName:@"tabar_communityicon_selected"];
    
    THNavigationController *nav5 = [[THNavigationController alloc]initWithRootViewController:[MineViewController new]];
    [tabbar addChildController:nav5 title:@"我的" imageName:@"tabar_myicon_normal" selectedImageName:@"tabar_myicon_selected"];
    

        AppDelegate *aDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
      aDelegate.window.rootViewController =tabbar;
    
    
}



@end

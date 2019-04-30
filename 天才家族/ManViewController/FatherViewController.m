//
//  fatherViewController.m
//  鱿鱼
//
//  Created by 优站创意 on 2017/8/11.
//  Copyright © 2017年 优站创意. All rights reserved.
//

#import "FatherViewController.h"
#import "Header.h"
//#import "LogInViewController.h"

@interface FatherViewController ()

@end

@implementation FatherViewController


- (void)viewWillAppear:(BOOL)animated{
    
    [GLMiniMusicView shareInstance].frame = CGRectMake(-SCWIDTH,SCHEIGHT-tabbarHeight-40-10, 40, 40);
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [super viewWillAppear:animated];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];

    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(Requestfailedforbidden:) name:@"Requestfailedforbidden" object:nil];
    
  
}


- (void)Requestfailedforbidden:(NSNotification*)n{
    
    UIAlertController * alerController= [UIAlertController alertControllerWithTitle:@"您的账号在其他设备上已登录" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    
    
    [alerController addAction:({UIAlertAction * aleraction = [UIAlertAction actionWithTitle:@"重新登录" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
//        LogInViewController * tabbar = [[LogInViewController alloc] init];
//
//        AppDelegate *aDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
//
//        aDelegate.window.rootViewController =tabbar;
//
//        
        
    }];
        aleraction;
    })];
    
    
    [self presentViewController:alerController animated:YES completion:nil];
    
}





- (void)setLeftItemImageName:(NSString *)imageName andhighImage:(NSString *)image andLeftTitle:(NSString *)title{
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem backItemWithimage:[UIImage imageNamed:imageName] highImage:[UIImage imageNamed:image]  target:self action:@selector(navibarLeftBtnTitle:) title:title];
  
}



- (void)setLeftItemImageName:(NSString *)imageName andhighImage:(NSString *)image
{
  
//    self.navigationItem.leftBarButtonItem = [UIBarButtonItem backItemWithimage:[UIImage imageNamed:imageName] highImage:[UIImage imageNamed:image]  target:self action:@selector(navibarLeftBtnClick) title:@"返回"];
    
    self.navigationItem.leftBarButtonItem  = [UIBarButtonItem itemWithImageName:imageName highImageName:image target:self action:@selector(navibarLeftBtnClick)];
    


}


- (void)setRightItemImageName:(NSString *)imageName andhighImage:(NSString *)image 
{
//     self.navigationItem.rightBarButtonItem = [UIBarButtonItem backItemWithimage:[UIImage imageNamed:imageName] highImage:[UIImage imageNamed:image]  target:self action:@selector(navibarRightBtnClick) title:@"返回"];
    
    self.navigationItem.rightBarButtonItem  = [UIBarButtonItem itemWithImageName:imageName highImageName:image target:self action:@selector(navibarRightBtnClick)];

    
}


- (void)setRightItemBtnTitle:(NSString *)title
{
    //     self.navigationItem.rightBarButtonItem = [UIBarButtonItem backItemWithimage:[UIImage imageNamed:imageName] highImage:[UIImage imageNamed:image]  target:self action:@selector(navibarRightBtnClick) title:@"返回"];
    
    self.navigationItem.rightBarButtonItem  = [UIBarButtonItem itemWithColor:[UIColor blackColor] highColor:nil target:self action:@selector(navibarRightBtnClick) title:title];
    
    
}

- (void)navibarLeftBtnTitle:(UIButton *)LeftBtn{
    
    
}


- (void)navibarRightBtnClick{
    
    
}


-(void)navibarLeftBtnClick{
    // 判断两种情况: push 和 present
    if ((self.presentedViewController || self.presentingViewController) && self.childViewControllers.count == 1) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }else
        
        [self.navigationController popViewControllerAnimated:YES];
    
}

//提示框 一秒后消失
- (void)showToastWithMessage:(NSString *)message{
    
    [self.view makeToast:message duration:1 position:@"center"];
}


- (void)dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
    

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

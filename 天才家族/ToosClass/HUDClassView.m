//
//  HUDClassView.m
//  优站
//
//  Created by 优站创意 on 2017/6/29.
//  Copyright © 2017年 优站创意. All rights reserved.
//

#import "HUDClassView.h"
#import "Header.h"
@interface HUDClassView ()
@property (nonatomic,strong)MBProgressHUD * HUD;

@end
@implementation HUDClassView
+ (HUDClassView *)sharedManager
{
    static HUDClassView *sharedAccountManagerInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedAccountManagerInstance = [[self alloc] init];
    });
    return sharedAccountManagerInstance;
}


// 动画菊花视图
- (void)showHUD:(NSString *)text icon:(NSString *)icon
{
    //显示提示信息
    UIView *view = [[UIApplication sharedApplication].delegate window];
    _HUD = [MBProgressHUD showHUDAddedTo:view animated:YES];

    //    //设置背景的 大小
    //    hud.minSize = CGSizeMake(200,200);
    //
    
    NSString *path = [[NSBundle mainBundle] pathForResource:icon ofType:@"gif"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    _HUD.color=[UIColor clearColor];//默认颜色太深了
    _HUD.mode = MBProgressHUDModeCustomView;
    _HUD.labelText = text;
    
    UIImageView * imageView = [[UIImageView alloc]init];
    imageView.userInteractionEnabled = YES;
    imageView.frame = CGRectMake(0, 0,29,5);
    
    imageView.image = [UIImage sd_animatedGIFWithData:data];
    
    _HUD.customView= imageView;
    

}



//隐藏菊花视图
-(void)HUDhideView{
    
    UIView *view = [[UIApplication sharedApplication].delegate window];
    [MBProgressHUD hideHUDForView:view animated:YES];
    
}



- (void)AddNODataImageView:(UIView *)view{
    
//    self.NoDataImageView = [[UIImageView alloc] initWithFrame:CGRectMake(view.frame.size.width/2-128/2,view.frame.size.height/2-170/2, 128, 170)];
    
    self.NoDataImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,SCWIDTH,SCHEIGHT)];
       self.NoDataImageView.image = [UIImage imageNamed:@"zanwu.png"];
       //self.NoDataImageView.backgroundColor = [UIColor redColor];
      [view addSubview:self.NoDataImageView];
    
}





@end

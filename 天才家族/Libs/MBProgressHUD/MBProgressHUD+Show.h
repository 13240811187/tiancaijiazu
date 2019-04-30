//
//  MBProgressHUD+Show.h
//  weibo
//
//  Created by apple on 13-9-1.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
@interface MBProgressHUD (Show)

+ (void)showErrorWithText:(NSString *)text;
+ (void)showSuccessWithText:(NSString *)text;

@end

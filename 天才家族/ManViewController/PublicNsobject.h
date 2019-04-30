//
//  PublicNsobject.h
//  umengtongji
//
//  Created by Crab on 16/8/1.
//  Copyright © 2016年 Crab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PublicNsobject : NSObject
// 判断跟控制器  是否进去引导页
+ (void)mainRootVieController;
+ (void)jumpToTabbar;
+(NSString *)GetBundleVersion;
@end

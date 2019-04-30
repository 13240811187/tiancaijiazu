	//
//  BaseHttpClient.m
//  tanghuangOA
//
//  Created by Orangels on 2017/5/4.
//  Copyright © 2017年 ls. All rights reserved.
//

#import "BaseHttpClient.h"
#import "HUDClassView.h"
#define nonceStr @"84EDB09777B94D588F8E9F6D6B4A5A55"

@implementation BaseHttpClient

- (instancetype)init
{
    self = [super init];
    if (self) {
        
       _manager=[AFHTTPSessionManager manager];
         _manager.requestSerializer.timeoutInterval = 15;
        _manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        
        [_manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept" ];
        _manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json",@"text/html", @"text/plain",nil];
//        //处理 response 中的空值
//        ((AFJSONResponseSerializer *)_manager.responseSerializer).removesKeysWithNullValues = YES;
    
    }
    return self;
}

+(BaseHttpClient *)sharedBaseHttpClient{
    static BaseHttpClient* shareClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareClient = [[BaseHttpClient alloc] init];
    });
    return shareClient;
}




#pragma mark -- 请求接口
+(void)requestWithHttpType:(HTTP_TYPE)type andParameters:(NSDictionary*)parameters andURL:(NSString*)url andSucHandler:(HttpSuc)sucHandler andFailHandler:(HttpFail)failHandler{
    switch (type) {
        case GET:
            [BaseHttpClient httpGetWithURL:url andParameters:parameters andSucHandler:sucHandler andFailHandler:failHandler];
            break;
        case POST:
            [BaseHttpClient httpPostWithURL:url andParameters:parameters  andSucHandler:sucHandler andFailHandler:failHandler];
            break;
        default:
            break;
    }
}

+ (void)httpGetWithURL:(NSString*)url andParameters:(NSDictionary*)param andSucHandler:(HttpSuc)sucHandler andFailHandler:(HttpFail)failHandler{
    

    url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    
    
//    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
//    NSString * token = [userDefaults objectForKey:@"Token"];
//
    
    
  AFHTTPSessionManager  * manager=[AFHTTPSessionManager manager];
    
    // 设置超时时间
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = 15.f;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];

    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
   // [manager.requestSerializer setValue:token forHTTPHeaderField:@"token"];
    
//
//    NSString * random = [MD5 changeDateToString];
//    NSString * Nonce = [NSString stringWithFormat:@"%@%@",nonceStr,random];
//    NSString * signature = [MD5 md532BitLower:Nonce];
//    [manager.requestSerializer setValue:random forHTTPHeaderField:@"nonce"];
//    [manager.requestSerializer setValue:signature forHTTPHeaderField:@"signature"];
//
//
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json",@"text/html", @"text/plain",nil];
    
    
    
    [[HUDClassView sharedManager] showHUD:nil icon:@"YOUYU"];

    [manager GET:url parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    
        if (responseObject) {
            
            id obj = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            dispatch_async(dispatch_get_main_queue(), ^{
                //隐藏菊花视图
                [[HUDClassView sharedManager]  HUDhideView];
                sucHandler(obj);
            });
            
           
         

            
        }else{
            NSError* error = [[NSError alloc] initWithDomain:@"请求数据返回为空" code:9999 userInfo: nil];
            failHandler(error);
 
            //隐藏菊花视图
              [[HUDClassView sharedManager]  HUDhideView];
          
            
        }
        
      

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        
         [[HUDClassView sharedManager]  HUDhideView];
//        NSLog(@"error.code=========%@",error.userInfo[@"NSLocalizedDescription"]);
        
        //Request failed: forbidden (403)
        if ([error.userInfo[@"NSLocalizedDescription"] isEqualToString:@"Request failed: forbidden (403)"]) {
            
            [[NSNotificationCenter defaultCenter]postNotificationName:@"Requestfailedforbidden" object:nil];
        }else{
    
        dispatch_async(dispatch_get_main_queue(), ^{
            //隐藏菊花视图

            failHandler(error);
        });
            
    }
              
}];
    
    
    
}

+ (void)httpPostWithURL:(NSString*)url andParameters:(NSDictionary*)param andSucHandler:(HttpSuc)sucHandler andFailHandler:(HttpFail)failHandler{
    
    
    url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];

//    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
//    NSString * token = [userDefaults objectForKey:@"Token"];
//
    
    AFHTTPSessionManager  * manager=[AFHTTPSessionManager manager];
    // 设置超时时间
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = 15.f;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];

    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    // [manager.requestSerializer setValue:token forHTTPHeaderField:@"token"];
 
//    NSString * random = [MD5 changeDateToString];
//    NSString * Nonece = [NSString stringWithFormat:@"%@%@",nonceStr,random];
//    NSString * signature = [MD5 md532BitLower:Nonece];
//    [manager.requestSerializer setValue:random forHTTPHeaderField:@"nonce"];
//    [manager.requestSerializer setValue:signature forHTTPHeaderField:@"signature"];
//
    
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json",@"text/html", @"text/plain",nil];
    
    
    
    [[HUDClassView sharedManager] showHUD:nil icon:@"YOUYU"];
    
    
    [manager POST:url parameters:param progress:^(NSProgress * _Nonnull uploadProgress) {
        
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject) {
            
            id obj = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            dispatch_async(dispatch_get_main_queue(), ^{
                //隐藏菊花视图
                [[HUDClassView sharedManager]  HUDhideView];
                sucHandler(obj);
            });
            
           
            
            
        }else{
            NSError* error = [[NSError alloc] initWithDomain:@"请求数据返回为空" code:9999 userInfo: nil];
            failHandler(error);
            
            //隐藏菊花视图
           [[HUDClassView sharedManager]  HUDhideView];
         
            
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        //隐藏菊花视图
        [[HUDClassView sharedManager]  HUDhideView];
        
        if ([error.userInfo[@"NSLocalizedDescription"] isEqualToString:@"Request failed: forbidden (403)"]) {
            
            [[NSNotificationCenter defaultCenter]postNotificationName:@"Requestfailedforbidden" object:nil];
        }else{
            
            dispatch_async(dispatch_get_main_queue(), ^{
               
                failHandler(error);
            });
            
        }
        

    }];

    

}


#pragma mark - 没有菊花视图的加载请求
+(void)HiddenHUDrequestWithHttpType:(HTTP_TYPE)type andParameters:(NSDictionary*)parameters andURL:(NSString*)url andSucHandler:(HttpSuc)sucHandler andFailHandler:(HttpFail)failHandler{
    
    switch (type) {
        case GET:
            [BaseHttpClient HiddenHUDhttpGetWithURL:url andParameters:parameters andSucHandler:sucHandler andFailHandler:failHandler];
            break;
        case POST:
            [BaseHttpClient HiddenHUDhttpPostWithURL:url andParameters:parameters  andSucHandler:sucHandler andFailHandler:failHandler];
            break;
        default:
            break;
    }
    
}


#pragma mark - 没有菊花视图的加载请求 GET
+ (void)HiddenHUDhttpGetWithURL:(NSString*)url andParameters:(NSDictionary*)param andSucHandler:(HttpSuc)sucHandler andFailHandler:(HttpFail)failHandler{
    
    
    url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
//    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
//    NSString * token = [userDefaults objectForKey:@"Token"];
//
    
    AFHTTPSessionManager  * manager=[AFHTTPSessionManager manager];
    
    // 设置超时时间
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = 15.f;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    //[manager.requestSerializer setValue:token forHTTPHeaderField:@"token"];
  
//    NSString * random = [MD5 changeDateToString];
//    NSString * Nonece = [NSString stringWithFormat:@"%@%@",nonceStr,random];
//    NSString * signature = [MD5 md532BitLower:Nonece];
//    [manager.requestSerializer setValue:random forHTTPHeaderField:@"nonce"];
//    [manager.requestSerializer setValue:signature forHTTPHeaderField:@"signature"];
//
//
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json",@"text/html", @"text/plain",nil];
    

    [manager GET:url parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (responseObject) {
            
            id obj = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            dispatch_async(dispatch_get_main_queue(), ^{
            
                sucHandler(obj);
            });
            
            
        }else{
            
            NSError* error = [[NSError alloc] initWithDomain:@"请求数据返回为空" code:9999 userInfo: nil];
            failHandler(error);
            
           
        }
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
       
        if ([error.userInfo[@"NSLocalizedDescription"] isEqualToString:@"Request failed: forbidden (403)"]) {
            
            [[NSNotificationCenter defaultCenter]postNotificationName:@"Requestfailedforbidden" object:nil];
        }else{
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                failHandler(error);
            });
            
        }
        
        
        //打印错误信息
//        NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:error.userInfo[@"com.alamofire.serialization.response.error.data"] options:NSJSONReadingMutableContainers error:nil];
//
//        NSLog(@"%@",dic[@"Message"]);
//
        
    }];
    
    
    
}


#pragma mark - 没有菊花视图的加载请求 Post
+ (void)HiddenHUDhttpPostWithURL:(NSString*)url andParameters:(NSDictionary*)param andSucHandler:(HttpSuc)sucHandler andFailHandler:(HttpFail)failHandler{
    
    
    url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
//    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
//    NSString * token = [userDefaults objectForKey:@"Token"];
//
    
    AFHTTPSessionManager  * manager=[AFHTTPSessionManager manager];
    // 设置超时时间
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = 15.f;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
//    [manager.requestSerializer setValue:token forHTTPHeaderField:@"token"];
//
//    NSString * random = [MD5 changeDateToString];
//    NSString * Nonece = [NSString stringWithFormat:@"%@%@",nonceStr,random];
//    NSString * signature = [MD5 md532BitLower:Nonece];
//    [manager.requestSerializer setValue:random forHTTPHeaderField:@"nonce"];
//    [manager.requestSerializer setValue:signature forHTTPHeaderField:@"signature"];
//
    
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json",@"text/html", @"text/plain",nil];
    
//    userAgent = [NSString stringWithFormat:@"%@/%@ (%@ %@; Apple x64; JpushToken %@; uniqueId %@; source AppStore) ooyby/%@", [[NSBundle mainBundle] infoDictionary][(__bridge NSString *)kCFBundleExecutableKey] ?: [[NSBundle mainBundle] infoDictionary][(__bridge NSString *)kCFBundleIdentifierKey], [[NSBundle mainBundle] infoDictionary][@"CFBundleShortVersionString"] ?: [[NSBundle mainBundle] infoDictionary][(__bridge NSString *)kCFBundleVersionKey], [[UIDevice currentDevice] systemName], [[UIDevice currentDevice] systemVersion],[JPUSHService registrationID],[JPUSHService registrationID],@"20170630"];
//

    

    [manager POST:url parameters:param progress:^(NSProgress * _Nonnull uploadProgress) {
        
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject) {
            
            id obj = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            dispatch_async(dispatch_get_main_queue(), ^{
            
                sucHandler(obj);
            });
            
            
            
            
        }else{
            NSError* error = [[NSError alloc] initWithDomain:@"请求数据返回为空" code:9999 userInfo: nil];
            failHandler(error);
            
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
      
        if ([error.userInfo[@"NSLocalizedDescription"] isEqualToString:@"Request failed: forbidden (403)"]) {
            
            [[NSNotificationCenter defaultCenter]postNotificationName:@"Requestfailedforbidden" object:nil];
        }else{
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                failHandler(error);
            });
            
        }
        
    }];
    
    
    
}




- (void)dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}



+(void)cancelHttpOperations{
    [[BaseHttpClient sharedBaseHttpClient].manager.operationQueue cancelAllOperations];
}


+ (BOOL)isDataClass:(NSMutableArray *)array
{
    if ([array isKindOfClass:[NSMutableArray class]] && array.count>=1) {
        return YES;
    }
    return NO;
}


@end

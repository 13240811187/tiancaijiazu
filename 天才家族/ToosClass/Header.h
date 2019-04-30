//
//  Header.h
//  yanshi
//
//  Created by 优站创意 on 2017/6/22.
//  Copyright © 2017年 优站创意. All rights reserved.
//

#ifndef Header_h
#define Header_h
#define SCWIDTH [UIScreen mainScreen].bounds.size.width
#define SCHEIGHT [UIScreen mainScreen].bounds.size.height
#import "PublicNsobject.h"
#import "BRPickerView.h"
#import "BRPickerViewMacro.h"
#import "AppDelegate.h"
#import "UIBarButtonItem+item.h"
#import "toolClass.h"
#import "MD5.h"
#import "Toast+UIView.h"
#import "BaseHttpClient.h"
#import "MJExtension.h"
#import "MJRefresh.h"
#import "CustomDialogView.h"
#import "responseBuilder.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"
#import "UIImage+GIF.h"
#import "RGBColor.h"
#import "UIView+SetRect.h"
#import "UIImage+ALinExtension.h"
#import "UIImage+UIImageScale.h"
#import "YYWebImage.h"
#import "MBProgressHUD+Show.h"
#import "HUDClassView.h"

//视频
#import "ZFPlayer.h"
#import "ZFAVPlayerManager.h"
#import "ZFIJKPlayerManager.h"
#import "KSMediaPlayerManager.h"
#import "ZFPlayerControlView.h"
#import "UIImageView+ZFCache.h"
#import "ZFUtilities.h"


//音频
#import "NSString+translation.h"
#import "GLMusicPlayerControlView.h"
#import "GLMusicPlayer.h"
#import "GLMiniMusicView.h"



#import "UIColor+category.h"
////融云
//#import <RongIMLib/RongIMLib.h>
//#import <RongIMKit/RongIMKit.h>
//#import <RongIMKit/RCConversationViewController.h>
////极光tuisong
//#import "JPUSHService.h"
//#import <AdSupport/AdSupport.h>
//#import <UserNotifications/UserNotifications.h>
////高德基础定位类
//#import <AMapFoundationKit/AMapFoundationKit.h>
//#import <AMapLocationKit/AMapLocationKit.h>
////UM分享第三方登录
//#import <UMSocialCore/UMSocialCore.h>
//#import <UShareUI/UShareUI.h>
//#import "UMSocialQQHandler.h"
//#import <UMCommon/UMCommon.h>
//#import <UMAnalytics/MobClick.h>
////微信支付
//#import "WXApi.h"
//#import "WeiXinModel.h"
//#import "WXApiObject.h"


//NSUserDefaults
#define Usersversion @"version"

#define UsersToken @"Token"

#define UsersbundelVersion @"bundelVersion"









//设置default
#define KEY_IN_USERDEFAULT(key) [[NSUserDefaults standardUserDefaults] objectForKey:key]

#define KEY_IN_USERDEFAULT_BOOL(key) [[NSUserDefaults standardUserDefaults] boolForKey:key]

#define  SET_OBJ_FOR_KEY_IN_USERDEFAULT(_obj_,_key_) [[NSUserDefaults standardUserDefaults] setObject:_obj_ forKey:_key_]
#define  SET_VALUE_FOR_KEY_IN_USERDEFAULT(_value_,_key_) [[NSUserDefaults standardUserDefaults] setValue:_value_ forKey:_key_]
#define  SET_BOOL_FOR_KEY_IN_USERDEFAULT(_bool_,_key_) [[NSUserDefaults standardUserDefaults] setBool:_bool_ forKey:_key_]

#define  SET_SYNCHRONIZE(_synchronize) [[NSUserDefaults standardUserDefaults] _synchronize]



#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define RGB(r, g, b)    [UIColor colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f alpha:1]

#define RGBalpha(a,b,c,d) [UIColor colorWithRed:(a)/255.0 green:(b)/255.0 blue:(c)/255.0 alpha:(d)]

#define  applicationScale_iphone6  ([UIScreen mainScreen].bounds.size.width/375.0f)
#define WEAKSELF  __weak typeof(self) myself =self;
#define WeakSelf typeof(self) __weak weakSelf = self;

#define MainColor [RGBColor colorWithHexString:@"#ffea84"]

#define ChooseBtnBgColor [UIColor colorWithRed:240/255.0f green:240/255.0f blue:244/255.0f alpha:1]

#define iOS11_Later ([UIDevice currentDevice].systemVersion.floatValue >= 11.0f)

#define BrokenNetworkString [NSString stringWithFormat:@"%@",@"网络异常请稍后重新加载!"]

#define MainBgColor [RGBColor colorWithHexString:@"#FFFFFF"]//主背景色

#define MainShadowColor [UIColor colorWithRed:84/255.0 green:115/255.0 blue:194/255.0 alpha:0.1]//悬浮阴影色

#define MainfengeColor [RGBColor colorWithHexString:@"#666666"]

#define TitleTextColor [RGBColor colorWithHexString:@"#999999"]
//tableviewcell_bottomline
#define TableViewLineColor [RGBColor colorWithHexString:@"#EBEBEB"]
//tablebar_selectedColor

#define TableBarNormalTextColor  [RGBColor colorWithHexString:@"#BEBEBE"]

#define TableBarLightedTextColor  [RGBColor colorWithHexString:@"#4080FC"]
//home_big_titleColor
#define MainLabelTextColor  [RGBColor colorWithHexString:@"#333333"]


#define titleAgeLabelColor [RGBColor colorWithHexString:@"#FFBA16"]//年龄 暗黄色

#define titlePriceLabelColor [RGBColor colorWithHexString:@"#F54922"]//价钱红色

#define EaryCellBackgroundColor [RGBColor colorWithHexString:@"#E7E9EB"]

#define EaryCellBorderColor [RGBColor colorWithHexString:@"#6297FF"]

#define  Font(a) [UIFont systemFontOfSize:(a)]
#define  FontBold(a) [UIFont fontWithName:@"Helvetica-Bold" size:(a)]
#define  FontArial(a) [UIFont fontWithName:@"Arial" size:(a)]
#define  FontPingFangSC(a) [UIFont fontWithName:@"PingFangSC-Regular" size:(a)]

// 状态栏(statusbar)
#define StatusBar [[UIApplication sharedApplication] statusBarFrame].size.height

//标题栏
#define NavRect  self.navigationController.navigationBar.frame.size.height

//然后将高度相加，便可以动态计算顶部高度。
#define JCNew64 [[UIApplication sharedApplication] statusBarFrame].size.height + self.navigationController.navigationBar.frame.size.height    


#define tabbarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49) // 适配iPhone x 底栏高度

#define NavRectHeight (self.navigationController.navigationBar.frame.size.height>20?64:88) // 适配iPhone x 导航栏栏高度
//_tabBarView.frame = CGRectMake(0, CurrentScreenHeight - TabbarHeight, CurrentScreenWidth, TabbarHeight);


#define umloginStr [[NSUserDefaults standardUserDefaults] objectForKey:@"UMshareLogin"]

#define MineUserId [[NSUserDefaults standardUserDefaults] objectForKey:@"UserID"]

#define MineUserPhoto [[NSUserDefaults standardUserDefaults] objectForKey:@"UserPhoto"]













#define MainUrl @"http://api.youyulm.com"
#define uploadUrl @"http://res.api.youyulm.com"//上传图片

 #define  HomeUrl  [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/Main/Home?x=%@&y=%@"] //首页

#define ThemUrl [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/Theme/GetTickets"]//（精选）主题

#define CircleUrl [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/Team/SearchTeam"]//圈子

#define EditTeamUrl [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/Team/EditTeam"]//编辑圈子信息

#define CircleDetailsUrl [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/Team/GetTeamInfo?teamId=%ld"]//(精选)圈子详情

#define GetMyJoinTeamUrl [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/Team/GetMyJoinTeam"]//得到我加入的圈子（聊天室大厅）

#define GetActiveTeamsUrl [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/Team/GetActiveTeams"]//得到活跃圈子


#define JoinChatRoomUrl [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/Team/JoinChatRoom?groupId=%@"]//加入聊天室

#define ThemDetailsUrl [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/Theme/GetTicket?ticketId=%ld"]//（精选）主题详情

#define ThemZuDuiUrl [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/Theme/GetSeasonsWithTeam?ticketId=%ld&date=%@"]//（精选）主题详情下面的组队信息

#define CreateWxOrderUrl [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/Order/CreateWxOrder?orderNO=%@"]//提交订单失败后凋起微信生成订单

#define GetWxPayResultUrl [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/Order/GetWxPayResult?orderNO=%@"]//查询微信支付是否成功



#define HomeSearchUrl [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/Resource/GetThemeSearchData"]//首页上方搜索 主题搜索button


#define HomeSearchThemUrl [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/Theme/GetThemeTypes"] //首页上方搜索 主题搜索button 单个主题

#define HomeSearchThemTickets [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/Theme/GetTickets"]//搜索票务主题

#define GetCatalogAdsUrl [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/Main/GetCatalogAds"]//得到分类的广告位


#define GetThemeTypesUrl [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/Theme/GetThemeTypes"]//分类

#define GetRecommendTenantsUrl [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/Tenant/GetRecommendTenants"]//分类推荐商家


#define MyVCUrl [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/User/GetOutlineInfo?userId=%@"]//我的页面

#define MyFocusUrl [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/User/GetMyFocusUser"]//我的页面(关注数)

#define MyFansUrl [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/User/GetMyFans"]//我的页面(粉丝数)

#define MyJoinTeamUrl [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/Team/GetMyJoinTeam"]//得到我加入的圈子


#define MyFansCancel [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/User/Focus?userId=%@"]//我的页面(关注和取消关注)

#define MyNewsURl [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/User/GetMessage"]//我的页面(我的消息)

#define MyUserInfoURl [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/User/GetFocusUserInfo?userId=%@"]//得到用户基本信息

#define MyRequestPhotoURl [NSString stringWithFormat:@"%@%@",uploadUrl,@"/Resource/UploadMany"]//上传相册

#define MyUploadPhotoURl [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/User/PostAlbum?image=%@"]//上传相册2

#define MyDeletePhotoURl [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/User/DeleteAlbum?imageId=%@"]//删除相册图片


#define MyFootURl [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/User/GetTrack?userId=%@"]//足迹

#define GetAlbumURl [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/User/GetAlbum?userId=%@"]//得到我的相册


#define MyAllOrders [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/Order/GetPayOrders"]//已支付订单

#define MyPayingOrders [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/Order/GetPayingOrders"]//待付款订单

#define MyCancelOrder [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/Order/CancelOrder?orderId=%@"]//待付款取消订单


#define MyPayOrders [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/Order/GeOkOrders"]//已完成订单


#define PostUserInfoURl [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/User/PostUserInfo"]//修改个人信息




#define LogInUrl [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/User/Login"]//登录

#define RegisterUrl [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/User/Register"]//注册
#define SendSmsCodeUrl [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/User/SendSmsCode?key=%@&phone=%@"]//验证码

#define FindPwdUrl [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/User/FindPwd"]//找回密码

#define BindSocialInfoUrl [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/User/BindSocialInfo"]//绑定社交账号手机号

#define UMLonginUrl [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/User/Login3"]//第三方登录绑定

#define GetTenantWithTicketsUrl [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/Tenant/GetTenantWithTickets?tenantId=%@"]//商家以及主题详情

#define MerchantsGetNewsTypeUrl [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/News/GetNewsType"]//发现界面的类型

#define MerchantsGetNewsDetalisUrl [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/News/GetNewsByType?type=%@&page=%d"]//发现界面的详情数据

#define MerchantsGetBrandTenantsUrl [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/Tenant/GetBrandTenants"]//品牌商户

#define MerchantsGetActiveUserUrl [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/User/GetActiveUser"]//高能达人

#define MerchantsGetTenantNewsUrl  [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/News/GetTenantNews?tenantId=%@"] //得到商家主页的资讯

#define MerchantsGetRecommendTenantsUrl  [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/Tenant/GetRecommendTenants"]//推荐 商家


#define GetHobbyTeamsUrl  [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/Team/GetHobbyTeams"]//得到主题聊天室大厅


#define GetUserCouponInfosUrl  [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/Coupon/GetMyCouponInfos?userId=%@"]//用户优惠券

#define GetThemeCouponInfosUrl  [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/Coupon/GetUserCouponInfos?ticketId=%ld"]//该主题是否有优惠券


#define HomeGetNewUserCouponUrl  [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/Coupon/GetNewUserCoupon"]//首页获取新人第一次的优惠券信息


#define HomeGiveCouponToNewUserUrl  [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/Coupon/GiveCouponToNewUser"]//首页获取新人第一次的优惠券 领取优惠券


#define CommentFeedbackUrl  [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/Comment/Feedback"]//提交反馈


#define GetTeamByGroupIdUrl  [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/Team/GetTeamByGroupId?groupid=%@"]//通过聊天室ID 找到名字

#define GetVersionInfoUrl  [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/Main/GetVersionInfo"]//更新APP 接口


#define SignForScoreUrl  [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/Score/SignForScore"]//签到接口

#define GetSign7DayScoreUrl  [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/Score/GetSign7DayScore"]//获取连续签到7天接口

#define GetSign7ForScoreGiftUrl  [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/Score/Sign7ForScore"]//连续7天后点击大礼包接口


#define  HomeTeamNeed  [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/TeamNeed/GetNeeds?searchModel.xY.x=%@&searchModel.xY.y=%@"] //首页 tabviewcell 需求内容

#define  HomeTeamNeedThemeType  [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/TeamNeed/GetNeeds?searchModel.themeType=%ld&searchModel.xY.x=%@&searchModel.xY.y=%@"] //首页 主题搜索

#define  HomeTeamNeedSex  [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/TeamNeed/GetNeeds?searchModel.sex=%ld&searchModel.xY.x=%@&searchModel.xY.y=%@"] //首页 高级筛选男女搜索

#define  HomeTeamNeedSortType  [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/TeamNeed/GetNeeds?searchModel.sortType=%@&searchModel.xY.x=%@&searchModel.xY.y=%@"] //首页排序搜索2是人气3是距离



#define  TeamNeedGetNeedInfo  [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/TeamNeed/GetNeedInfo?needId=%@"] //首页组局支付


#define  TeamNeedFavor  [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/TeamNeed/Favor?needId=%@"] //首页cell点赞


#define  GetRecommendTenants  [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/Tenant/GetRecommendTenants"]//推荐商家 


#define  GetTenantWithTickets  [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/Tenant/GetTenantWithTickets?tenantId=%@"]//商家详情和商家主题信息

#define MerchantsHomeGetTicket [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/Theme/GetTicket?ticketId=%@"]// 商家首页 日期和主题详情


#define GetSeasonsWithTeamAndNeed [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/Theme/GetSeasonsWithTeamAndNeed?ticketId=%@&date=%@"]// 商家首页 日期下的场次信息


#define SubmitOrderUrl [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/Order/SubmitTicketOrder"]//提交订单


#define SubmitNeedOrder [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/Order/SubmitNeedOrder"]//发布需求

#define SubmitJoinOrderUel [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/Order/SubmitJoinOrder"]//提交订单



#define SearchTenants [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/Tenant/SearchTenants"]//搜索商家


#define UploadPootoURl [NSString stringWithFormat:@"%@%@",uploadUrl,@"/resource/upload"]//上传头像


#define AddTagURl [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/User/AddTag"]//给用户打标签

#define GetMyWalletUrl [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/User/GetMyWallet"]//得到我的钱包


#define GetThemeSearchData [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/Resource/GetThemeSearchData"]//判断是否显示三方登录


#define brandGetBrandTenants [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/Tenant/GetBrandTenants?x=%@&y=%@"]//品牌商户（精选商户）

#define brandGetHotTenants [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/Tenant/GetHotTenants?x=%@&y=%@"]//品牌商户（最新好店）

#define brandGetNearbyTenants [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/Tenant/GetNearbyTenants?x=%@&y=%@"]//品牌商户（周边商户）


#define brandGetRecommendTenants [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/Tenant/GetRecommendTenants?x=%@&y=%@"]//品牌商户（热门）

#define MerEveryDayGetUserAssetUrl [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/User/GetUserAsset"]//每日福利 我的资产



#define GetReceivingScoreUrl [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/Score/GetReceivingScore"]//得到要领取的积分天赋

#define ReceiveScoreUrl [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/Score/ReceiveScore?scoreId=%@"]//领取积分天赋

#define FavorTentantUrl [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/Tenant/FavorTentant?tenantId=%@"]//收藏商家


#define GetHobbyTeamInfoUrl [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/Team/GetHobbyTeamInfo?teamId=%@"]//得到兴趣圈详情

#define JoinHobbyTeamUrl [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/Team/JoinHobbyTeam?teamdId=%@"]//关注兴趣圈

 #define  GetFavorTenantsUrl [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/Tenant/GetFavorTenants?x=%@&y=%@"] //得到收藏的商家

#define  AddCommentUrl [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/Comment/AddComment"] //评论兴趣圈

#define  ShareForScoreUrl [NSString stringWithFormat:@"%@%@",MainUrl,@"/api/Score/ShareForScore"] //分享成功后


#endif /* Header_h */

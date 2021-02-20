//
//  AppUtils.m
//  GoodDemo_Weberson
//
//  Created by Weberson on 15/9/15.
//  Copyright (c) 2015年 Weberson. All rights reserved.
//

#import "AppUtils.h"


@implementation AppUtils

//获取app的版本号
+ (NSString *)getMyApplicationVersion{
    NSDictionary *info = [[NSBundle mainBundle] infoDictionary];
    NSString *version = [info objectForKey:@"CFBundleShortVersionString"];
    return version;
}

//获取AppStore app的版本号
+ (NSString *)getMyApplicationVersionFromAppStore
{
    // 构建应用链接
    NSURL *versionUrl = [NSURL URLWithString:@"https://itunes.apple.com/lookup?id=951610982"];
    NSError *error = nil;
    //获取版本号
    NSString *versioninfo = [NSString stringWithContentsOfURL:versionUrl encoding:NSUTF8StringEncoding error:nil];
    NSData *jsonData = [versioninfo dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *versionDict = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableLeaves error:&error];
    
    
    if (!error && versioninfo) {
        // 返回没有错误
        NSArray *resultArr = versionDict[@"results"];
        NSDictionary *resultDict = [resultArr firstObject];
        //版本号
        NSString *versionStr = resultDict[@"version"];
        //打印版本号
        return versionStr;
    }else{
        
       return [NSString stringWithFormat:@"VersionError"];
    }
}

/*******************--- 时间问题 ---*********************/
//根据字符串获取到NSdate类型的数据
+ (NSDate *)getDateFromString:(NSString *)string{
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd-HH-mm-ss"];
    NSDate *date = [formatter dateFromString:string];
    return date;
}

//根据NSDate类型转换成字符串
+ (NSString *)getStringFromNSDate:(NSDate *)date{
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd-HH-mm-ss"];
    NSString *str= [formatter stringFromDate:date];
    return str;
}

/*********************--保存和取出数据-NSUserDefaults---******************/
+ (void)setValue:(id)valuem key:(NSString *)key{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:valuem forKey:key];
    [defaults synchronize];
}

+ (void)setBool:(BOOL)boo key:(NSString *)key{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:boo forKey:key];
    [defaults synchronize];
}

+ (id)ObjectforKey:(NSString *)key{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:key];
}

+ (BOOL)BooltforKey:(NSString *)key{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults boolForKey:key];
}

/*******************--检测--******************************/
//验证手机合法性
+ (BOOL)checkPhoneNumber:(NSString *)phoneNumber{
    
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    BOOL res1 = [regextestmobile evaluateWithObject:phoneNumber];
    BOOL res2 = [regextestcm evaluateWithObject:phoneNumber];
    BOOL res3 = [regextestcu evaluateWithObject:phoneNumber];
    BOOL res4 = [regextestct evaluateWithObject:phoneNumber];
    
    if (res1 || res2 || res3 || res4 )
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

//检测空格是不是空 或者  是空格
+ (BOOL)isBlankString:(NSString *)string{
    
    if (string == nil) {
        return YES;
    }
    
    if (string == NULL) {
        return YES;
    }
    
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}

//随机颜色
+ (UIColor *)randomColor{
    CGFloat red=arc4random()%256/255.0;
    CGFloat green=arc4random()%256/255.0;
    CGFloat blue=arc4random()%256/255.0;
    UIColor *randomColor=[UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    return randomColor;
}


/// 占位文字 文字大小 文字颜色
-(void)textField:(UITextField *)textField FontSize:(CGFloat)fontSize placeHolderTextColor:(UIColor *)textColor{
    
    [textField setValue:[UIFont systemFontOfSize:fontSize] forKeyPath:@"_placeholderLabel.font"];
    
    if (textColor != nil) {
        [textField setValue: textColor forKeyPath:@"_placeholderLabel.textColor"];
    }
}

/// 检测是否是字母
+(BOOL)isAlphabetWithstring:(NSString *)string{
    NSString* number=@"^[A-Za-z]+$";
    NSPredicate *numberPre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",number];
    return  [numberPre evaluateWithObject:string];
}
/// 检测是否是中文
+ (BOOL)isChineseWithstring:(NSString *)string{

    NSString *match = @"(^[\u4e00-\u9fa5]+$)";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF matches %@", match];
    return [predicate evaluateWithObject:string];
}

@end



/****************************       随笔记录一下         ******************************
 
 PM是个温柔的SB
 
 〇// 定义公共key值
 //    NSString *key = (NSString *)kCFBundleVersionKey;
 //    //plist里面的 "Build" 的号
 //    NSString *currentVersionCode = [NSBundle mainBundle].infoDictionary[key];
 
 ①： 定义公共key值
 //    NSString *key = (NSString *)kCFBundleVersionKey;
 //    //plist里面的 "Build" 的号
 //    NSString *currentVersionCode = [NSBundle mainBundle].infoDictionary[key];
 
 ②: 设置 TextField 占位文字的大小和颜色
 [lastNameTfd setValue:[UIFont systemFontOfSize:14] forKeyPath:@"_placeholderLabel.font"];
 [lastNameTfd setValue:[UIColor redColor] forKeyPath:@"_placeholderLabel.textColor"];
 
 ③: 设置导航条 图片渲染模式
 
 UIImage *shareImage = [UIImage imageNamed:@"naviShare@2x"];
 UIBarButtonItem *shareButton = [[UIBarButtonItem alloc]initWithImage:shareImage style:UIBarButtonItemStyleDone target:self action:@selector(shareButtonDidClick)];
 shareButton.image = [shareImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
 
 ④: 设置导航条 白色返回按钮
 // 统一设置左侧的返回按钮 用图片代替
 UIImage *backImage = [UIImage imageNamed:@"getback@3x"];
 [[UIBarButtonItem appearance] setBackButtonBackgroundImage:[backImage resizableImageWithCapInsets:UIEdgeInsetsMake(0, backImage.size.width, 0, 0)]forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
 [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(-233, 0) forBarMetrics:UIBarMetricsDefault];
 
 ****************************       随笔记录信息         ******************************/




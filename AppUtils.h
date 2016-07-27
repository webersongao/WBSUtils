//
//  AppUtils.h
//  GoodDemo_Weberson
//
//  Created by Weberson on 15/9/15.
//  Copyright (c) 2015年 Weberson. All rights reserved.
//


/**
 工具类
 */

#import <Foundation/Foundation.h>
#import "SVProgressHUD.h"

@interface AppUtils : NSObject

//获取app的版本号
+ (NSString *)getMyApplicationVersion;

/********************* 时间问题 **********************/
//根据字符串获取到NSdate类型的数据  yyyy-MM-dd-HH-mm-ss
+ (NSDate *)getDateFromString:(NSString *)string;
//根据NSDate类型转换成字符串  yyyy-MM-dd-HH-mm-ss
+ (NSString *)getStringFromNSDate:(NSDate *)date;

/********************* 保存和取出数据 ——偏好设置 **********************/
+ (void)setValue:(id)valuem key:(NSString *)key;

+ (void)setBool:(BOOL)boo key:(NSString *)key;

+ (id)ObjectforKey:(NSString *)key;

+ (BOOL)BooltforKey:(NSString *)key;

/********************* SVProgressHUD **********************/
+ (void)showProgressMessage:(NSString *)message;

+ (void)showSuccessMessage:(NSString *)message;

+ (void)showErrorMessage:(NSString *)message;

+ (void)showWithStatus:(NSString *)message;

+ (void)showInfoWithStatus:(NSString*)message;

+ (void)dismissHUD;
/********************* 检测,确认合法性 **********************/
//验证手机号的合法性
+ (BOOL)checkPhoneNumber:(NSString *)phoneNumber;

//检测字符串是不是空的 或者 是空格
+ (BOOL)isBlankString:(NSString *)string;

//随机的颜色
+ (UIColor *)randomColor;

/********************* UITextField 属性修改 **********************/
/// 占位文字 文字大小 文字颜色
-(void)textField:(UITextField *)textField FontSize:(CGFloat)fontSize placeHolderTextColor:(UIColor *)textColor;

/// 检测是否是字母
+(BOOL)isAlphabetWithstring:(NSString *)string;

/// 检测是否是中文
+ (BOOL)isChineseWithstring:(NSString *)string{

@end

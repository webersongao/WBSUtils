//
//  EaseChineseToPinyin.h
//  WBSUtilsDemo
//
//  Created by Weberson on 16/7/27.
//  Copyright © 2016年 Weberson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EaseChineseToPinyin : NSObject

+ (NSString *)pinyinFromChineseString:(NSString *)string;

+ (char)sortSectionTitle:(NSString *)string; 

@end
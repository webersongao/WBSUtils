//
//  UIViewController+DismissKeyboard.h
//  WBSUtilsDemo
//
//  Created by Weberson on 16/7/27.
//  Copyright © 2016年 Weberson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EaseConvertToCommonEmoticonsHelper : NSObject

+ (NSString *)convertToCommonEmoticons:(NSString *)text;

+ (NSString *)convertToSystemEmoticons:(NSString *)text;

@end

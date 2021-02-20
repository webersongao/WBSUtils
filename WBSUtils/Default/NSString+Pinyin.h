//
//  NSString+Pinyin.h
//  UtilsDemo
//
//  Created by WebersonGao on 2021/2/20.
//  Copyright © 2021 Weberson. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Pinyin)

+ (NSString *)pinyinFromChineseString:(NSString *)string;

+ (char)sortSectionTitle:(NSString *)string;

@end

NS_ASSUME_NONNULL_END

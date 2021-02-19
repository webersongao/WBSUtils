//
//  NSString+Valid.m
//  WBSUtilsDemo
//
//  Created by Weberson on 16/7/27.
//  Copyright © 2016年 Weberson. All rights reserved.
//

#import "NSString+Valid.h"

@implementation NSString (Valid)

- (BOOL)isChinese
{
    NSString *match = @"(^[\u4e00-\u9fa5]+$)";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF matches %@", match];
    return [predicate evaluateWithObject:self];
}

@end

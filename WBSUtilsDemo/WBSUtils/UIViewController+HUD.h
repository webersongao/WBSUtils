//
//  UIViewController+DismissKeyboard.h
//  WBSUtilsDemo
//
//  Created by Weberson on 16/7/27.
//  Copyright © 2016年 Weberson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (HUD)

- (void)showHudInView:(UIView *)view hint:(NSString *)hint;

- (void)hideHud;

- (void)showHint:(NSString *)hint;

- (void)showHint:(NSString *)hint yOffset:(float)yOffset;

@end

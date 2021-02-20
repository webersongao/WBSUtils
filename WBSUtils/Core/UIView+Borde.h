//
//  UIView+Borde.h
//  WBSUtilsDemo
//
//  Created by Weberson on 16/7/26.
//  Copyright © 2016年 Weberson. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{
    
    //上
    UIViewBorderDirectTop=0,
    
    //左
    UIViewBorderDirectLeft,
    
    //下
    UIViewBorderDirectBottom,
    
    //右
    UIViewBorderDirectRight,
    
    
}UIViewBorderDirect;

@interface UIView (Extension)

/**
 *  添加边框：注给scrollView添加会出错
 *
 *  @param direct 方向
 *  @param color  颜色
 *  @param width  线宽
 */
-(void)addSingleBorder:(UIViewBorderDirect)direct color:(UIColor *)color width:(CGFloat)width;


/**
 *  自动从xib创建视图
 */
+(instancetype)viewFromXIB;




@end

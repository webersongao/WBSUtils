//
//  UIView+Extension.m
//  WBSUtilsDemo
//
//  Created by Weberson on 16/7/26.
//  Copyright © 2016年 Weberson. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)



/**
 *  添加边框：注给scrollView添加会出错
 *
 *  @param direct 方向
 *  @param color  颜色
 *  @param width  线宽
 */
-(void)addSingleBorder:(UIViewBorderDirect)direct color:(UIColor *)color width:(CGFloat)width{
    
    UIView *line=[[UIView alloc] init];
    
    //设置颜色
    line.backgroundColor=color;
    
    //添加
    [self addSubview:line];
    
    //禁用ar
    line.translatesAutoresizingMaskIntoConstraints=NO;
    
    NSDictionary *views=NSDictionaryOfVariableBindings(line);
    NSDictionary *metrics=@{@"w":@(width),@"y":@(self.KHeight - width),@"x":@(self.KWidth - width)};
    
    
    NSString *vfl_H=@"";
    NSString *vfl_W=@"";
    
    //上
    if(UIViewBorderDirectTop==direct){
        vfl_H=@"H:|-0-[line]-0-|";
        vfl_W=@"V:|-0-[line(==w)]";
    }
    
    //左
    if(UIViewBorderDirectLeft==direct){
        vfl_H=@"H:|-0-[line(==w)]";
        vfl_W=@"V:|-0-[line]-0-|";
    }
    
    //下
    if(UIViewBorderDirectBottom==direct){
        vfl_H=@"H:|-0-[line]-0-|";
        vfl_W=@"V:[line(==w)]-0-|";
    }
    
    //右
    if(UIViewBorderDirectRight==direct){
        vfl_H=@"H:|-x-[line(==w)]";
        vfl_W=@"V:|-0-[line]-0-|";
    }
    
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vfl_H options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vfl_W options:0 metrics:metrics views:views]];
}



/**
 *  自动从xib创建视图
 */
+(instancetype)viewFromXIB{
    
    NSString *name=NSStringFromClass(self);
    
    UIView *xibView=[[[NSBundle mainBundle] loadNibNamed:name owner:nil options:nil] firstObject];
    
    if(xibView==nil){
        NSLog(@"CoreXibView：从xib创建视图失败，当前类是：%@",name);
    }
    
    return xibView;
}




- (void)setKX:(CGFloat)KX
{
    CGRect frame = self.frame;
    frame.origin.x = KX;
    self.frame = frame;
}

- (void)setKY:(CGFloat)KY
{
    CGRect frame = self.frame;
    frame.origin.y = KY;
    self.frame = frame;
}

- (CGFloat)KX
{
    return self.frame.origin.x;
}

- (CGFloat)KY
{
    return self.frame.origin.y;
}

- (void)setKWidth:(CGFloat)KWidth
{
    CGRect frame = self.frame;
    frame.size.width = KWidth;
    self.frame = frame;
}

- (void)setKHeight:(CGFloat)KHeight
{
    CGRect frame = self.frame;
    frame.size.height = KHeight;
    self.frame = frame;
}

- (CGFloat)KHeight
{
    return self.frame.size.height;
}

- (CGFloat)KWidth
{
    return self.frame.size.width;
}

- (void)setKSize:(CGSize)KSize
{
    CGRect frame = self.frame;
    frame.size = KSize;
    self.frame = frame;
}

- (CGSize)KSize
{
    return self.frame.size;
}

- (void)setKOrigin:(CGPoint)KOrigin
{
    CGRect frame = self.frame;
    frame.origin = KOrigin;
    self.frame = frame;
}

- (CGPoint)KOrigin
{
    return self.frame.origin;
}

#pragma mark  圆角处理
/// 圆角处理
-(void)setRadius:(CGFloat)radius{
    
    if(radius<=0) radius=self.frame.size.width * .5f;
    
    //圆角半径
    self.layer.cornerRadius=radius;
    
    //强制
    self.layer.masksToBounds=YES;
}

-(CGFloat)radius{
    return 0;
}


@end

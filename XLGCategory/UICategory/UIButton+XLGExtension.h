//
//  UIButton+XLGExtension.h
//  XLGCategoryDemo
//  Notes：UIButton的一些处理方法
//
//  Created by Jason_hzb on 2018/6/28.
//  Copyright © 2018年 小灵狗出行. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (XLGExtension)

typedef NS_ENUM(NSUInteger,ButtonEdgeInsetsStyle)
{
    ButtonEdgeInsetsStyleTop,//image在上，label在下
    ButtonEdgeInsetsStyleLeft,//image在左,label在右
    ButtonEdgeInsetsStyleBottom,//image在下，label在上
    ButtonEdgeInsetsStyleRight//image在右,label在左
};

#pragma mark - 设置button内部的image和title的布局样式
- (void)layoutButtonWithEdgeInsetsStyle:(ButtonEdgeInsetsStyle)style imageTitleSpace:(CGFloat)space;

#pragma mark - 设置导航条右侧按钮
+ (UIButton *)rightBarButtonItemWithTitle:(NSString *)title
                                    image:(UIImage *)image
                              highlighted:(UIImage *)highlightedImage
                               frameWidth:(CGFloat)width
                               frameHight:(CGFloat)hight
                            setTitleColor:(UIColor *)setColor
                                   target:(id)target
                                 selector:(SEL)selector;

#pragma mark - 设置导航条左侧按钮
+ (UIButton *)leftBarButtonItemWithTitle:(NSString *)title
                                   image:(UIImage *)image
                             highlighted:(UIImage *)highlightedImage
                              frameWidth:(CGFloat)width
                              frameHight:(CGFloat)hight
                           setTitleColor:(UIColor *)setColor
                                  target:(id)target
                                selector:(SEL)selector;
#pragma mark - 圆角 背景图
+ (UIButton *)buttonWithType:(UIButtonType)type frame:(CGRect)frame cornerRadius:(CGFloat)cornerRadius backgroundImage:(UIImage *)backgroundImage target:(id)target andAction:(SEL)selector;

#pragma mark - 圆角 背景图 tag
+ (UIButton *)buttonWithType:(UIButtonType)type frame:(CGRect)frame cornerRadius:(CGFloat)cornerRadius backgroundImage:(UIImage *)backgroundImage tag:(NSInteger)tag target:(id)target andAction:(SEL)selector;

#pragma mark - 圆角 背景色 tag
+ (UIButton *)buttonWithType:(UIButtonType)type frame:(CGRect)frame cornerRadius:(CGFloat)cornerRadius backgroundColor:(UIColor *)backgroundColor tag:(NSInteger)tag target:(id)target andAction:(SEL)selector;

#pragma mark - 圆角 背景色
+ (UIButton *)buttonWithType:(UIButtonType)type frame:(CGRect)frame cornerRadius:(CGFloat)cornerRadius backgroundColor:(UIColor *)backgroundColor target:(id)target andAction:(SEL)selector;

#pragma mark - 背景图 选中图
+ (UIButton *)buttonWithType:(UIButtonType)type frame:(CGRect)frame normalBackgroundImage:(UIImage *)normalBackgroundImage selectedBackgroundImage:(UIImage *)selectedBackgroundImage target:(id)target andAction:(SEL)selector;

#pragma mark - 背景图 选中图 tag
+ (UIButton *)buttonWithType:(UIButtonType)type frame:(CGRect)frame normalBackgroundImage:(UIImage *)normalBackgroundImage selectedBackgroundImage:(UIImage *)selectedBackgroundImage tag:(NSInteger)tag target:(id)target andAction:(SEL)selector;

#pragma mark - title 选中颜色
+ (UIButton *)buttonWithType:(UIButtonType)type frame:(CGRect)frame title:(NSString *)title normalTitleColor:(UIColor *)normalTitleColor highlightedColor:(UIColor *)highlightedColor target:(id)target andAction:(SEL)selector;

#pragma mark - title 选中颜色 tag
+ (UIButton *)buttonWithType:(UIButtonType)type frame:(CGRect)frame title:(NSString *)title normalTitleColor:(UIColor *)normalTitleColor highlightedColor:(UIColor *)highlightedColor tag:(NSInteger)tag target:(id)target andAction:(SEL)selector;


#pragma mark - 圆角 背景色 title 选中颜色
+ (UIButton *)buttonWithType:(UIButtonType)type frame:(CGRect)frame cornerRadius:(CGFloat)cornerRadius backgroundColor:(UIColor *)backgroundColor title:(NSString *)title normalTitleColor:(UIColor *)normalTitleColor highlightedTitleColor:(UIColor *)highlightedTitleColor font:(CGFloat)font target:(id)target andAction:(SEL)selector;

#pragma mark - 圆角 背景色 title 选中颜色 tag
+ (UIButton *)buttonWithType:(UIButtonType)type frame:(CGRect)frame cornerRadius:(CGFloat)cornerRadius backgroundColor:(UIColor *)backgroundColor title:(NSString *)title normalTitleColor:(UIColor *)normalTitleColor highlightedTitleColor:(UIColor *)highlightedTitleColor font:(CGFloat)font tag:(NSInteger)tag target:(id)target andAction:(SEL)selector;

#pragma mark - 圆角 背景色 title 边框线
+ (UIButton *)buttonWithType:(UIButtonType)type frame:(CGRect)frame title:(NSString *)title cornerRadius:(CGFloat)cornerRadius normalTitleColor:(UIColor *)normalTitleColor borderColor:(UIColor *)color target:(id)target andAction:(SEL)selector;

@end

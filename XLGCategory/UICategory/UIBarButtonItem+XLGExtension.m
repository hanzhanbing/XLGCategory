//
//  UIBarButtonItem+XLGExtension.m
//  XLGCategoryDemo
//  Notes：
//
//  Created by Jason_hzb on 2018/6/28.
//  Copyright © 2018年 小灵狗出行. All rights reserved.
//

#import "UIBarButtonItem+XLGExtension.h"

@implementation UIBarButtonItem (XLGExtension)


/**
 快速创建一个显示图片的UIBarButtonItem

 @param icon 正常图片
 @param highIcon 高亮图片
 @param target self
 @param action 方法
 @return UIBarButtonItem实例
 */
+ (UIBarButtonItem *)itemWithIcon:(NSString *)icon highIcon:(NSString *)highIcon target:(id)target action:(SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:highIcon] forState:UIControlStateHighlighted];
    button.frame = (CGRect){CGPointZero, button.currentBackgroundImage.size};
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

@end

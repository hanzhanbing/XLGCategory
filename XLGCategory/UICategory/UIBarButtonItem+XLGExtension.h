//
//  UIBarButtonItem+XLGExtension.h
//  XLGCategoryDemo
//  Notes：快速创建显示图片的UIBarButtonItem
//
//  Created by Jason_hzb on 2018/6/28.
//  Copyright © 2018年 小灵狗出行. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (XLGExtension)

#pragma mark - 快速创建一个显示图片的UIBarButtonItem
+ (UIBarButtonItem *)itemWithIcon:(NSString *)icon highIcon:(NSString *)highIcon target:(id)target action:(SEL)action;

@end

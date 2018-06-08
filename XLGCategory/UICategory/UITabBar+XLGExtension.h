//
//  UITabBar+XLGExtension.h
//  SharenGo
//  Notes：UITabBar 小红点的设置方法
//
//  Created by Jason_hzb on 2018/5/14.
//  Copyright © 2018年 小灵狗出行. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBar (XLGExtension)

/**
 显示小红点附带数字
 
 @param index Tab Index
 @param count 数字
 */
- (void)showBadgeOnItemIndex:(NSInteger)index andCount:(NSString *)count;

/**
 显示小红点
 
 @param index Tab Index
 */
- (void)showBadgeOnItemIndex:(NSInteger)index;

/**
 隐藏小红点
 
 @param index Tab Index
 */
- (void)hideBadgeOnItemIndex:(NSInteger)index;

@end

//
//  UIDevice+XLGExtension.h
//  SharenGo
//  Notes：获取设备信息
//
//  Created by Jason_hzb on 2018/5/7.
//  Copyright © 2018年 小灵狗出行. All rights reserved.
//

#import <UIKit/UIKit.h>

#ifndef kSystemVersion
#define kSystemVersion [UIDevice systemVersion]
#endif

@interface UIDevice (XLGExtension)

#pragma mark - 获取系统版本
+ (double)systemVersion;

#pragma mark - 判断设备是否是模拟器
@property (nonatomic, readonly) BOOL isSimulator;

@end

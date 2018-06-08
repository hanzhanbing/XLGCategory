//
//  NSTimer+XLGEocBlockSupports.h
//  SharenGo
//  Notes：NSTimer 封装
//
//  Created by Jason_hzb on 2018/5/7.
//  Copyright © 2018年 小灵狗出行. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (XLGEocBlockSupports)

/**
 NSTimer封装，添加block回调

 @param timeInterval 时间间隔
 @param block 回调
 @param repeat 是否重复
 @return NSTimer实例
 */
+ (NSTimer *)eocScheduledTimerWithTimeInterval:(NSTimeInterval)timeInterval
                                         block:(void(^)(void)) block
                                       repeats:(BOOL)repeat;

@end

//
//  NSTimer+XLGEocBlockSupports.m
//  SharenGo
//  Notes：
//
//  Created by Jason_hzb on 2018/5/9.
//  Copyright © 2018年 小灵狗出行. All rights reserved.
//

#import "NSTimer+XLGEocBlockSupports.h"

@implementation NSTimer (XLGEocBlockSupports)

+ (NSTimer *)eocScheduledTimerWithTimeInterval:(NSTimeInterval)timeInterval
                                         block:(void(^)(void)) block
                                       repeats:(BOOL)repeat {
    
    return  [self scheduledTimerWithTimeInterval:timeInterval
                                          target:self
                                        selector:@selector(startTimer:)
                                        userInfo:[block copy]
                                         repeats:repeat];
}

//定时器所执行的方法
+ (void)startTimer:(NSTimer *)timer {
    void(^block)(void) = timer.userInfo;
    if (block) {
        block();
    }
}

@end

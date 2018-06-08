//
//  UIDevice+XLGExtension.m
//  SharenGo
//  Notes：
//
//  Created by Jason_hzb on 2018/5/9.
//  Copyright © 2018年 小灵狗出行. All rights reserved.
//

#import "UIDevice+XLGExtension.h"

@implementation UIDevice (XLGExtension)

+ (double)systemVersion {
    static double version;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        version = [UIDevice currentDevice].systemVersion.doubleValue;
    });
    return version;
}

- (BOOL)isSimulator {
    static dispatch_once_t one;
    static BOOL simu;
    dispatch_once(&one, ^{
        simu = NSNotFound != [[self model] rangeOfString:@"Simulator"].location;
    });
    return simu;
}

@end

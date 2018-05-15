//
//  NSString+XLGAdd.m
//  SharenGo
//  Notes：
//
//  Created by Jason on 2018/5/9.
//  Copyright © 2018年 小灵狗出行. All rights reserved.
//

#import "NSString+XLGAdd.h"

@implementation NSString (XLGAdd)


/**
 去掉两端的空格

 @return 处理后的字符串
 */
- (NSString *)trimSpaceFromBothEnds {
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    return [self stringByTrimmingCharactersInSet:set];
}

@end

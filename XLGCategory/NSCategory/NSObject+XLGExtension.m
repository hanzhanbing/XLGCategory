//
//  NSObject+XLGExtension.m
//  SharenGo
//  Notes：
//
//  Created by Jason_hzb on 2018/5/14.
//  Copyright © 2018年 小灵狗出行. All rights reserved.
//

#import "NSObject+XLGExtension.h"

@implementation NSObject (XLGExtension)

#pragma mark - 私有方法

/**
 将NSDictionary中的Null类型的项目转化成@""
 
 @param myDic 原始字典
 @return 处理后的字典
 */
+ (NSDictionary *)nullDic:(NSDictionary *)myDic {
    
    NSArray *keyArr = [myDic allKeys];
    NSMutableDictionary *resDic = [[NSMutableDictionary alloc]init];
    
    for (int i = 0; i < keyArr.count; i ++) {
        id obj = [myDic objectForKey:keyArr[i]];
        obj = [self changeType:obj];
        [resDic setObject:obj forKey:keyArr[i]];
    }
    return resDic;
}

/**
 将NSArray中的Null类型的项目转化成@""
 
 @param myArr 原始数组
 @return 处理后的数组
 */
+ (NSArray *)nullArr:(NSArray *)myArr {
    
    NSMutableArray *resArr = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < myArr.count; i ++) {
        id obj = myArr[i];
        obj = [self changeType:obj];
        [resArr addObject:obj];
    }
    return resArr;
}

/**
 将NSString类型的原路返回
 
 @param str 字符串
 @return 字符串
 */
+ (NSString *)stringToString:(NSString *)str {
    if (str.length == 0) {
        return @"";
    }
    return str;
}

/**
 将Null类型的项目转化成@""
 
 @return @""
 */
+ (NSString *)nullToString {
    return @"";
}

#pragma mark - 公有方法

/**
 将所有的NSNull类型转化成@""
 
 @param obj 对象
 @return 处理后的对象
 */
+ (id)changeType:(id)obj {
    if ([obj isKindOfClass:[NSDictionary class]]) {
        return [self nullDic:obj];
    } else if([obj isKindOfClass:[NSArray class]]) {
        return [self nullArr:obj];
    } else if([obj isKindOfClass:[NSString class]]) {
        return [self stringToString:obj];
    } else if([obj isKindOfClass:[NSNull class]]) {
        return [self nullToString];
    } else {
        return obj;
    }
}

@end

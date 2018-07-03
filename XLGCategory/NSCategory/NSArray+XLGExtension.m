//
//  NSArray+XLGExtension.m
//  SharenGo
//  Notes：
//
//  Created by Jason_hzb on 2018/5/14.
//  Copyright © 2018年 小灵狗出行. All rights reserved.
//

#import "NSArray+XLGExtension.h"

@implementation NSArray (XLGExtension)

/**
 判断数组是否为空

 @param array 数组
 @return YES：空
 */
+ (BOOL)isEmpty:(id)array {
    
    if (array == nil) {
        return YES;
    }
    if (array == NULL) {
        return YES;
    }
    if ([array isEqual:[NSNull null]]) {
        return YES;
    }
    
    NSArray *arr = (NSArray *)array;
    if (arr.count==0) {
        return YES;
    }
    
    return NO;
}

/**
 输出json字符串【一整行】
 
 @return json字符串
 */
- (NSString *)jsonStringEncoded {
    if ([NSJSONSerialization isValidJSONObject:self]) {
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:0 error:&error];
        NSString *json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        return json;
    }
    return nil;
}

/**
 输出json字符串【格式化输出】
 
 @return json字符串
 */
- (NSString *)jsonPrettyStringEncoded {
    if ([NSJSONSerialization isValidJSONObject:self]) {
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&error];
        NSString *json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        return json;
    }
    return nil;
}

/**
 数组转json data
 
 @return json data数据
 */
- (NSData *)toJSONData {
    NSData *data = [NSJSONSerialization dataWithJSONObject:self
                                                   options:NSJSONWritingPrettyPrinted
                                                     error:nil];
    return data;
}

/**
 打印中文正常显示

 @return 字符串
 */
- (NSString *)description {
    
    NSMutableString *str = [NSMutableString stringWithString:@"(\n"];
    
    [self enumerateObjectsUsingBlock:^(id obj,NSUInteger idx,BOOL *stop) {
        
        [str appendFormat:@"\t%@,\n", obj];
    }];
    
    [str appendString:@")"];
    
    return str;
}

- (NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString *string = [NSMutableString string];
    
    // 开头有个[
    [string appendString:@"[\n"];
    
    // 遍历所有的元素
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [string appendFormat:@"\t%@,\n", obj];
    }];
    
    // 结尾有个]
    [string appendString:@"]"];
    
    // 查找最后一个逗号
    NSRange range = [string rangeOfString:@"," options:NSBackwardsSearch];
    if (range.location != NSNotFound)
        [string deleteCharactersInRange:range];
    
    return string;
}

@end

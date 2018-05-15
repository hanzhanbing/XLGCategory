//
//  NSArray+XLGAdd.m
//  SharenGo
//  Notes：
//
//  Created by Jason on 2018/5/14.
//  Copyright © 2018年 小灵狗出行. All rights reserved.
//

#import "NSArray+XLGAdd.h"

@implementation NSArray (XLGAdd)

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

@end

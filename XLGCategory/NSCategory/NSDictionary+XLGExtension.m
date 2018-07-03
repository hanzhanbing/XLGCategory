//
//  NSDictionary+XLGExtension.m
//  SharenGo
//  Notes：
//
//  Created by Jason_hzb on 2018/5/9.
//  Copyright © 2018年 小灵狗出行. All rights reserved.
//

#import "NSDictionary+XLGExtension.h"

@implementation NSDictionary (XLGExtension)

/**
 判断字典是否为空

 @param dictionary 字典
 @return YES：空
 */
+ (BOOL)isEmpty:(id)dictionary {
    
    if (dictionary == nil) {
        return YES;
    }
    if (dictionary == NULL) {
        return YES;
    }
    if ([dictionary isEqual:[NSNull null]]) {
        return YES;
    }
    
    NSDictionary *dic = (NSDictionary *)dictionary;
    if (dic.allKeys.count==0) {
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
    
    NSMutableString *str = [NSMutableString stringWithString:@"{\n"];
    
    [self enumerateKeysAndObjectsUsingBlock:^(id key,id obj,BOOL *stop) {
        
        [str appendFormat:@"\t%@ = %@;\n", key, obj];
    }];
    
    [str appendString:@"}\n"];
    
    str = [NSString stringWithCString:[str cStringUsingEncoding:NSUTF8StringEncoding] encoding:NSNonLossyASCIIStringEncoding];
    
    return str;
}


- (NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString *string = [NSMutableString string];
    
    // 开头有个{
    [string appendString:@"{\n"];
    
    // 遍历所有的键值对
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [string appendFormat:@"\t%@", key];
        [string appendString:@" : "];
        [string appendFormat:@"%@,\n", obj];
    }];
    
    // 结尾有个}
    [string appendString:@"}"];
    
    // 查找最后一个逗号
    NSRange range = [string rangeOfString:@"," options:NSBackwardsSearch];
    if (range.location != NSNotFound)
        [string deleteCharactersInRange:range];
    return string;
}

@end

//
//  NSDictionary+XLGExtension.h
//  SharenGo
//  Notes：添加字典处理的相关方法
//
//  Created by Jason_hzb on 2018/5/7.
//  Copyright © 2018年 小灵狗出行. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (XLGExtension)

#pragma mark - 判断字典是否为空
+ (BOOL)isEmpty:(id)dictionary;

#pragma mark - 字典转json字符串【一整行，NSString/NSNumber/NSDictionary/NSArray适用】
- (nullable NSString *)jsonStringEncoded;

#pragma mark - 字典转json字符串【格式化输出】
- (nullable NSString *)jsonPrettyStringEncoded;

#pragma mark - 字典转json data
- (NSData *)toJSONData;

#pragma mark - 打印中文正常显示
- (NSString *)description;

@end

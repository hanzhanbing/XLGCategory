//
//  NSArray+XLGExtension.h
//  SharenGo
//  Notes：添加数组处理的相关方法
//
//  Created by Jason_hzb on 2018/5/14.
//  Copyright © 2018年 小灵狗出行. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (XLGExtension)

#pragma mark - 判断数组是否为空
+ (BOOL)isEmpty:(id)array;

#pragma mark - 数组转json字符串【一整行，NSString/NSNumber/NSDictionary/NSArray适用】
- (nullable NSString *)jsonStringEncoded;

#pragma mark - 数组转json字符串【格式化输出】
- (nullable NSString *)jsonPrettyStringEncoded;

#pragma mark - 数组转json data
- (NSData *)toJSONData;

#pragma mark - 打印中文正常显示
- (NSString *)description;

@end

//
//  NSString+XLGExtension.h
//  SharenGo
//  Notes：添加字符串处理的相关方法
//
//  Created by Jason_hzb on 2018/5/7.
//  Copyright © 2018年 小灵狗出行. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (XLGExtension)

#pragma mark - 判断字符串是否为空
+ (BOOL)isEmpty:(id)string;

#pragma mark - url编码
- (NSString *)urlEncoding;

#pragma mark - url解码
- (NSString *)urlDecoding;

#pragma mark - md5
- (NSString *)md5;

#pragma mark - md5To32bit
- (NSString *)md5To32bit;

#pragma mark - 去掉两端的空格
- (NSString *)trimSpaceFromBothEnds;

#pragma mark - 根据字体大小、行高获取文本宽度
- (CGFloat)getTextWidthWithFont:(UIFont *)font height:(CGFloat)height;

#pragma mark - 根据字体大小、行宽获取文本高度
- (CGFloat)getTextHeightWithFont:(UIFont *)font width:(CGFloat)width;

#pragma mark - 通过CGSize范围和字体重新计算CGSize
- (CGSize)getSize:(CGSize)containSize font:(UIFont *)font;

#pragma mark - 时间转时间戳
+ (NSString*)timeToTimestamp:(NSString*)time;

@end

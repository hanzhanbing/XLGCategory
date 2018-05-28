//
//  NSString+XLGAdd.h
//  SharenGo
//  Notes：添加字符串处理的相关方法
//
//  Created by Jason on 2018/5/7.
//  Copyright © 2018年 小灵狗出行. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (XLGAdd)

#pragma mark - url编码
- (NSString *)urlEncoding;

#pragma mark - url解码
- (NSString *)urlDecoding;

#pragma mark - md5To32bit
- (NSString *)md5To32bit;

#pragma mark - 去掉两端的空格
- (NSString *)trimSpaceFromBothEnds;

#pragma mark - 根据字体大小、行高获取文本宽度
- (CGFloat)getTextWidthWithFont:(UIFont *)font height:(CGFloat)height;

#pragma mark - 根据字体大小、行宽获取文本高度
- (CGFloat)getTextHeightWithFont:(UIFont *)font width:(CGFloat)width;

@end

//
//  NSString+XLGAdd.m
//  SharenGo
//  Notes：
//
//  Created by Jason_hzb on 2018/5/9.
//  Copyright © 2018年 小灵狗出行. All rights reserved.
//

#import "NSString+XLGAdd.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (XLGAdd)

/**
 url编码
 
 @return 编码字符串
 */
- (NSString *)urlEncoding {
    
    return [self stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
}

/**
 url解码
 
 @return 解码字符串
 */
- (NSString *)urlDecoding {
    
    return [self stringByRemovingPercentEncoding];
}

/**
 字符串md5转32位
 
 @return 处理后的字符串
 */
- (NSString *)md5To32bit {
    
    const char *cStr = [self UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, (CC_LONG)cStr, digest);
    NSMutableString *result = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [result appendFormat:@"%02x", digest[i]];
    return result;
}

/**
 去掉两端的空格

 @return 处理后的字符串
 */
- (NSString *)trimSpaceFromBothEnds {
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    return [self stringByTrimmingCharactersInSet:set];
}


/**
 根据字体大小、行高获取文本宽度

 @param font 字体
 @param height 高度
 @return 宽度
 */
- (CGFloat)getTextWidthWithFont:(UIFont *)font height:(CGFloat)height {
    
    CGSize contentSize;
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    
    NSDictionary *attributes = @{NSFontAttributeName: font};
    
    contentSize = [self boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, height) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    
    return contentSize.width;
}


/**
 根据字体大小、行宽获取文本高度

 @param font 字体
 @param width 宽度
 @return 高度
 */
- (CGFloat)getTextHeightWithFont:(UIFont *)font width:(CGFloat)width {
    CGSize contentSize;
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    
    NSDictionary *attributes = @{NSFontAttributeName: font};
    
    contentSize = [self boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    
    return contentSize.height;
}

@end

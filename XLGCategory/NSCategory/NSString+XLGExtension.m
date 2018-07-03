//
//  NSString+XLGExtension.m
//  SharenGo
//  Notes：
//
//  Created by Jason_hzb on 2018/5/9.
//  Copyright © 2018年 小灵狗出行. All rights reserved.
//

#import "NSString+XLGExtension.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (XLGExtension)

/**
 判断字符串是否为空

 @param string 字符串
 @return YES：空
 */
+ (BOOL)isEmpty:(id)string {
    
    if (string == nil) {
        return YES;
    }
    if (string == NULL) {
        return YES;
    }
    if ([string isEqual:[NSNull null]]) {
        return YES;
    }
    
    NSString *str = (NSString *)string;
    if ([str isEqualToString:@"(null)"]) {
        return YES;
    }
    if ([str isEqualToString:@"null"]) {
        return YES;
    }
    if([str isEqualToString:@"<null>"]) {
        return YES;
    }
    if ([str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length==0) {
        return YES;
    }
    
    return NO;
}

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
 字符串md5

 @return 处理后的字符串
 */
- (NSString *)md5 {
    const char *cStr = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, (int)strlen(cStr), result ); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

/**
 字符串md5转32位
 
 @return 处理后的字符串
 */
- (NSString *)md5To32bit {
    
    const char *cStr = [self UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, strlen(cStr), digest);
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

/**
 通过CGSize范围和字体重新计算CGSize

 @param containSize CGSize范围
 @param font 字体大小
 @return 计算过的CGSize
 */
- (CGSize)getSize:(CGSize)containSize font:(UIFont *)font {
    CGSize size = CGSizeZero;
    NSDictionary *attribute = @{NSFontAttributeName: font};
    
    size = [self boundingRectWithSize:containSize
                              options: NSStringDrawingTruncatesLastVisibleLine|
            NSStringDrawingUsesLineFragmentOrigin|
            NSStringDrawingUsesFontLeading
                           attributes:attribute
                              context:nil].size;
    return size;
}

/**
 时间转时间戳

 @param time 时间
 @return 时间戳
 */
+ (NSString*)timeToTimestamp:(NSString*)time {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    //指定时间显示样式: HH表示24小时制 hh表示12小时制
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSDate *lastDate = [formatter dateFromString:time];
    //以 1970/01/01 GMT为基准，得到lastDate的时间戳
    long firstStamp = [lastDate timeIntervalSince1970];
    
    return [NSString stringWithFormat:@"%ld",firstStamp];
}

@end

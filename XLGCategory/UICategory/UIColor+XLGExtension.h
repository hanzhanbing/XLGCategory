//
//  UIColor+XLGExtension.h
//  SharenGo
//  Notes：通过Hex获取颜色
//
//  Created by Jason_hzb on 2018/5/14.
//  Copyright © 2018年 小灵狗出行. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 Create UIColor with a hex string.
 Example: UIColorHex(0xF0F), UIColorHex(66ccff), UIColorHex(#66CCFF88)
 
 Valid format: #RGB #RGBA #RRGGBB #RRGGBBAA 0xRGB ...
 The `#` or "0x" sign is not required.
 */
#ifndef UIColorHex
#define UIColorHex(_hex_)   [UIColor colorWithHexString:((__bridge NSString *)CFSTR(#_hex_))]
#endif

@interface UIColor (XLGExtension)

#pragma mark - 通过Hex获取颜色【Example: @"0xF0F", @"66ccff", @"#66CCFF88"，default alpha = 1.0】
+ (UIColor *)colorWithHexString:(NSString *)hexStr;

#pragma mark - 通过Hex获取颜色【可以设置透明度】
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(float)alpha;

@end

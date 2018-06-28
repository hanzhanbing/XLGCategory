//
//  NSData+XLGExtension.h
//  SharenGo
//  Notes：AES加密、AES解密、NSData转字符串
//
//  Created by Jason_hzb on 2018/6/22.
//  Copyright © 2018年 小灵狗出行. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (XLGExtension)

#pragma mark - AES加密
- (NSData *)AES256EncryptWithKey:(NSString *)key;

#pragma mark - AES解密
- (NSData *)AES256DecryptWithKey:(NSString *)key;

#pragma mark - NSData转字符串
- (NSString *)convertDataToHexStr;

@end

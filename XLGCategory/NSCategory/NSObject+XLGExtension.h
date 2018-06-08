//
//  NSObject+XLGExtension.h
//  SharenGo
//  Notes：将所有的NSNull类型转化成@""
//
//  Created by Jason_hzb on 2018/5/14.
//  Copyright © 2018年 小灵狗出行. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (XLGExtension)

#pragma mark - 将所有的NSNull类型转化成@""
+ (id)changeType:(id)obj;

@end

//
//  NSDate+Add.h
//  SharenGo
//  Notes：添加年月日属性，以及获取日期字符串
//
//  Created by Jason_hzb on 2018/5/7.
//  Copyright © 2018年 小灵狗出行. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (XLGAdd)

@property (nonatomic, readonly) NSInteger year; ///< Year component
@property (nonatomic, readonly) NSInteger month; ///< Month component (1~12)
@property (nonatomic, readonly) NSInteger day; ///< Day component (1~31)
@property (nonatomic, readonly) NSInteger hour; ///< Hour component (0~23)
@property (nonatomic, readonly) NSInteger minute; ///< Minute component (0~59)
@property (nonatomic, readonly) NSInteger second; ///< Second component (0~59)

/**
 Returns a formatted string representing this date.
 see http://www.unicode.org/reports/tr35/tr35-31/tr35-dates.html#Date_Format_Patterns
 for format description.
 
 @param format   String representing the desired date format.
 e.g. @"yyyy-MM-dd HH:mm:ss"
 
 @return NSString representing the formatted date string.
 */
- (nullable NSString *)stringWithFormat:(NSString *)format;

@end

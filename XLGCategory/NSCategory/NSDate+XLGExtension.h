//
//  NSDate+XLGExtension.h
//  SharenGo
//  Notes：时间处理相关方法
//
//  Created by Jason_hzb on 2018/5/7.
//  Copyright © 2018年 小灵狗出行. All rights reserved.
//

#import <Foundation/Foundation.h>

#define D_MINUTE    60
#define D_HOUR      3600
#define D_DAY       86400
#define D_WEEK      604800
#define D_YEAR      31556926

@interface NSDate (XLGExtension)

@property (nonatomic, readonly) NSInteger year; ///< Year component
@property (nonatomic, readonly) NSInteger month; ///< Month component (1~12)
@property (nonatomic, readonly) NSInteger day; ///< Day component (1~31)
@property (nonatomic, readonly) NSInteger hour; ///< Hour component (0~23)
@property (nonatomic, readonly) NSInteger minute; ///< Minute component (0~59)
@property (nonatomic, readonly) NSInteger second; ///< Second component (0~59)
@property (nonatomic, readonly) NSInteger week;
@property (nonatomic, readonly) NSInteger weekday;

/**
 时间格式化

 @param format @"yyyy-MM-dd HH:mm:ss"
 @return 格式化时间
 */
- (NSString *)stringWithFormat:(NSString *)format;

+ (NSDateFormatter *)dateFormatterWithFormat:(NSString *)format;

- (NSString *)timeIntervalDescription;//距离当前的时间间隔描述
- (NSString *)minuteDescription;/*精确到分钟的日期描述*/
- (NSString *)formattedTime;
- (NSString *)formattedDateDescription;//格式化日期描述
- (double)timeIntervalSince1970InMilliSecond;
+ (NSDate *)dateWithTimeIntervalInMilliSecondSince1970:(double)timeIntervalInMilliSecond;
+ (NSString *)formattedTimeFromTimeInterval:(long long)time;

// Relative dates from the current date
+ (NSDate *)dateTomorrow;
+ (NSDate *)dateYesterday;
+ (NSDate *)dateWithDaysFromNow: (NSInteger) days;
+ (NSDate *)dateWithDaysBeforeNow: (NSInteger) days;
+ (NSDate *)dateWithHoursFromNow: (NSInteger) dHours;
+ (NSDate *)dateWithHoursBeforeNow: (NSInteger) dHours;
+ (NSDate *)dateWithMinutesFromNow: (NSInteger) dMinutes;
+ (NSDate *)dateWithMinutesBeforeNow: (NSInteger) dMinutes;

// Comparing dates
- (BOOL)isEqualToDateIgnoringTime: (NSDate *) aDate;
- (BOOL)isToday;
- (BOOL)isTomorrow;
- (BOOL)isYesterday;
- (BOOL)isSameWeekAsDate: (NSDate *) aDate;
- (BOOL)isThisWeek;
- (BOOL)isNextWeek;
- (BOOL)isLastWeek;
- (BOOL)isSameMonthAsDate: (NSDate *) aDate;
- (BOOL)isThisMonth;
- (BOOL)isSameYearAsDate: (NSDate *) aDate;
- (BOOL)isThisYear;
- (BOOL)isNextYear;
- (BOOL)isLastYear;
- (BOOL)isEarlierThanDate: (NSDate *) aDate;
- (BOOL)isLaterThanDate: (NSDate *) aDate;
- (BOOL)isInFuture;
- (BOOL)isInPast;

// Date roles
- (BOOL)isTypicallyWorkday;
- (BOOL)isTypicallyWeekend;

// Adjusting dates
- (NSDate *)dateByAddingDays:(NSInteger) dDays;
- (NSDate *)dateBySubtractingDays:(NSInteger) dDays;
- (NSDate *)dateByAddingHours:(NSInteger) dHours;
- (NSDate *)dateBySubtractingHours:(NSInteger) dHours;
- (NSDate *)dateByAddingMinutes:(NSInteger) dMinutes;
- (NSDate *)dateBySubtractingMinutes:(NSInteger) dMinutes;
- (NSDate *)dateAtStartOfDay;

// Retrieving intervals
- (NSInteger)minutesAfterDate:(NSDate *) aDate;
- (NSInteger)minutesBeforeDate:(NSDate *) aDate;
- (NSInteger)hoursAfterDate:(NSDate *) aDate;
- (NSInteger)hoursBeforeDate:(NSDate *) aDate;
- (NSInteger)daysAfterDate:(NSDate *) aDate;
- (NSInteger)daysBeforeDate:(NSDate *) aDate;
- (NSInteger)distanceInDaysToDate:(NSDate *)anotherDate;

@end

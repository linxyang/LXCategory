//
//  NSDate+Interval.m
//  日期处理
//
//  Created by yanglinxia on 15/1/12.
//  Copyright © 2015年 阳林霞. All rights reserved.
//

#import "NSDate+Interval.h"
#import "NSCalendar+Init.h"

/****** LXDateInterval - begin ******/
@implementation LXDateInterval

@end
/****** LXDateInterval - end ******/


/****** NSDate (Interval) - begin ******/
@implementation NSDate (Interval)

/**
 *  判断是否为今年
 *
 *  @return 是与否
 */
- (BOOL)lx_isInThisYear
{
    NSCalendar *calendar = [NSCalendar lx_calendar];
    
    NSDateComponents *nowCmps = [calendar components:NSCalendarUnitYear fromDate:[NSDate date]];
    NSDateComponents *selfCmps = [calendar components:NSCalendarUnitYear fromDate:self];
    
    // NSDateComponents重写了isEqual:方法, 只要各种元素一样, 那么isEqual:就返回YES
    return [nowCmps isEqual:selfCmps];
}

/**
 *  判断是否为今天
 *
 *  @return 是与否
 */
- (BOOL)lx_isInToday
{
    NSCalendar *calendar = [NSCalendar lx_calendar];
    
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    
    // NSDateComponents重写了isEqual:方法, 只要各种元素一样, 那么isEqual:就返回YES
    return [nowCmps isEqual:selfCmps];
//    return nowCmps.year == selfCmps.year
//    && nowCmps.month == selfCmps.month
//    && nowCmps.day == selfCmps.day;
}

/**
 *  判断是否为昨天
 *
 *  @return 真或假
 */
- (BOOL)lx_isInYesterday
{
    // 判断self是否为昨天
    
    // self == 2015-01-31 23:10:10 -> 2015-01-31 00:00:00
    // now  == 2015-02-01 01:10:10 -> 2015-02-01 00:00:00
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyyMMdd";
    
    // 生成只有年月日的字符串(没有时分秒, 时分秒已经被抛弃了)
    NSString *selfString = [fmt stringFromDate:self]; // 20150131
    NSString *nowString = [fmt stringFromDate:[NSDate date]]; // 20150201
    
    // 生成只有年月日的日期(没有时分秒, 时分秒已经被抛弃了)
    NSDate *selfDate = [fmt dateFromString:selfString];
    NSDate *nowDate = [fmt dateFromString:nowString];
    
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *cmps = [[NSCalendar lx_calendar] components:unit fromDate:selfDate toDate:nowDate options:0];
    
    return cmps.year == 0
    && cmps.month == 0
    && cmps.day == 1;
}
/**
 *  判断时否为明天
 *
 *  @return 返回真与假
 */
- (BOOL)lx_isInTomorrow
{    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyyMMdd";
    
    // 生成只有年月日的字符串(没有时分秒, 时分秒已经被抛弃了)
    NSString *selfString = [fmt stringFromDate:self]; // 20150131
    NSString *nowString = [fmt stringFromDate:[NSDate date]]; // 20150201
    
    // 生成只有年月日的日期(没有时分秒, 时分秒已经被抛弃了)
    NSDate *selfDate = [fmt dateFromString:selfString];
    NSDate *nowDate = [fmt dateFromString:nowString];
    
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *cmps = [[NSCalendar lx_calendar] components:unit fromDate:selfDate toDate:nowDate options:0];
    
    return cmps.year == 0
    && cmps.month == 0
    && cmps.day == -1;
}
/**
 *  求与另一个时间的时间差
 *
 *  @param anotherDate 本身与另一个时间的时间差
 *
 *  @return 时间差模型
 */
- (LXDateInterval *)lx_intervalSinceDate:(NSDate *)anotherDate
{
    // 时间间隔(单位:s)
    NSInteger interval = [self timeIntervalSinceDate:anotherDate];
    
    NSInteger secsPerMinute = 60;
    NSInteger secsPerHour = 60 * secsPerMinute;
    NSInteger secsPerDay = 24 * secsPerHour;
    
    LXDateInterval *dateInterval = [[LXDateInterval alloc] init];
    dateInterval.day = interval / secsPerDay;
    dateInterval.hour = (interval % secsPerDay) / secsPerHour;
    dateInterval.minute = ((interval % secsPerDay) % secsPerHour) / secsPerMinute;
    dateInterval.second = interval % secsPerMinute;
    return dateInterval;
}
/**
 *  求与另一个时间的时间差(指针传值)
 *
 *  @param anotherDate 另一个时间对象
 *  @param dayP        天(地址)
 *  @param hourP       时(地址)
 *  @param minuteP     分(地址)
 *  @param secondP     秒(地址)
 */
- (void)lx_intervalSinceDate:(NSDate *)anotherDate day:(NSInteger *)dayP hour:(NSInteger *)hourP minute:(NSInteger *)minuteP second:(NSInteger *)secondP
{
    // 时间间隔(单位:s)
    NSInteger interval = [self timeIntervalSinceDate:anotherDate];
    
    NSInteger secsPerMinute = 60;
    NSInteger secsPerHour = 60 * secsPerMinute;
    NSInteger secsPerDay = 24 * secsPerHour;
    
    *dayP = interval / secsPerDay;
    *hourP = (interval % secsPerDay) / secsPerHour;
    *minuteP = ((interval % secsPerDay) % secsPerHour) / secsPerMinute;
    *secondP = interval % secsPerMinute;
}

@end
/****** NSDate (Interval) - end ******/

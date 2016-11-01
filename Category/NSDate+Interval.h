//
//  NSDate+Interval.h
//  日期处理
//
//  Created by yanglinxia on 15/1/12.
//  Copyright © 2015年 阳林霞. All rights reserved.
//

#import <UIKit/UIKit.h>

/****** LXDateInterval - begin ******/
@interface LXDateInterval : NSObject
//日 时 分 秒模型

/** 相隔多少天 */
@property (nonatomic, assign) NSInteger day;
/** 相隔多少小时 */
@property (nonatomic, assign) NSInteger hour;
/** 相隔多少分钟 */
@property (nonatomic, assign) NSInteger minute;
/** 相隔多少秒 */
@property (nonatomic, assign) NSInteger second;
@end
/****** LXDateInterval - end ******/


/****** NSDate (Interval) - begin ******/
@interface NSDate (Interval)
- (BOOL)lx_isInToday;
- (BOOL)lx_isInYesterday;
- (BOOL)lx_isInTomorrow;
- (BOOL)lx_isInThisYear;

/**
 *  计算self和anotherDate之间的时间间隔
 */
- (LXDateInterval *)lx_intervalSinceDate:(NSDate *)anotherDate;

- (void)lx_intervalSinceDate:(NSDate *)anotherDate day:(NSInteger *)dayP hour:(NSInteger *)hourP minute:(NSInteger *)minuteP second:(NSInteger *)secondP;
@end
/****** NSDate (Interval) - begin ******/

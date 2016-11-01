//
//  NSCalendar+Init.m
//  日期处理
//
//  Created by 1 on 15/1/13.
//  Copyright © 2015年 阳林霞. All rights reserved.
//

#import "NSCalendar+Init.h"

@implementation NSCalendar (Init)

+ (instancetype)lx_calendar
{
    //判断是否是iOS8(calendarWithIdentifier:这个方法是iOS8开始有)
    if ([NSCalendar respondsToSelector:@selector(calendarWithIdentifier:)]) {
        return [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    } else {
        //iOS8之前
        return [NSCalendar currentCalendar];
    }
}
@end

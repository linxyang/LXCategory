//
//  NSDateFormatter+Extension.m
//  test
//
//  Created by Yanglixia on 15/12/26.
//  Copyright © 2015年 Yanglinxia. All rights reserved.
//

#import "NSDateFormatter+Extension.h"

@implementation NSDateFormatter (Extension)

+ (instancetype)formatterWithShortWeekAndShortMonthSymbols
{
    NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
    fmt.shortWeekdaySymbols = @[@"Mon",@"Tues",@"Wed",@"Thur",@"Fri",@"Sat",@"Sun"];
    fmt.shortMonthSymbols = @[@"Jan",@"Feb",@"Mar",@"Apr",@"May",@"Jun",@"Jul",@"Aug",@"Sep",@"Oct",@"Nov",@"Dec"];
    
    return fmt;
}

@end

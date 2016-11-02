//
//  UIColor+YC.m
//  YCSchool
//
//  Created by yanglinxia on 16/4/26.
//  Copyright © 2016年 yanglinxia. All rights reserved.
//

#import "UIColor+YC.h"

@implementation UIColor (YC)

+ (UIColor *)yc_colorWithUInt:(NSUInteger)rgb
{
    return [self yc_colorWithUInt:rgb alpha:1];
}

+ (UIColor *)yc_colorWithUInt:(NSUInteger)rgb alpha:(CGFloat)alpha
{
    //红色
    CGFloat r = (rgb >> 16)       / 255.0;
    //绿色
    CGFloat g = (rgb >> 8 & 0xff) / 255.0;
    //蓝色
    CGFloat b = (rgb & 0xff)      / 255.0;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:alpha];
}


+ (UIColor *)yc_colorWithRed:(NSUInteger)rUint Green:(NSUInteger)gUint Blue:(NSUInteger)bUint
{
    if (rUint > 255 || bUint > 255 || bUint > 255) {
        return [UIColor whiteColor];
    }
    //红色
    CGFloat r = rUint  / 255.0;
    //绿色
    CGFloat g = gUint  / 255.0;
    //蓝色
    CGFloat b = bUint  / 255.0;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}
@end

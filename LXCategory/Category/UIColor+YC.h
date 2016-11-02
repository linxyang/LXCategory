//
//  UIColor+YC.h
//  YCSchool
//
//  Created by yanglinxia on 16/4/26.
//  Copyright © 2016年 yanglinxia. All rights reserved.
//

#import <UIKit/UIKit.h>

//颜色
#define YCColor(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0];
//随机颜色
#define YCRandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0];
//灰度色
#define YCGrayColorWith(value) LXColor(255,value,value,value)

//统一背景色
#define YCBgColor LXGrayColorWith(206)

// 共同的label文字颜色
#define YCcommonLabelColor [UIColor yc_colorWithUInt:0x4766AB];
 
@interface UIColor (YC)

/**
 *  通过int类型rgb获取颜色
 *
 *  @param rgb rgb(#000000)
 *
 *  @return 颜色对象
 */
+ (UIColor *)yc_colorWithUInt:(NSUInteger)rgb;

/**
 *  通过int类型rgb和alpha通道获取颜色
 *
 *  @param rgb   rgb(#000000)
 *  @param alpha alpha通道
 *
 *  @return 颜色对象
 */
+ (UIColor *)yc_colorWithUInt:(NSUInteger)rgb alpha:(CGFloat)alpha;
/**
 *  通过r g b获取颜色
 *
 *  @param rUint 红0-255
 *  @param gUint 绿0-255
 *  @param bUint 蓝0-255
 *
 *  @return <#return value description#>
 */
+ (UIColor *)yc_colorWithRed:(NSUInteger)rUint Green:(NSUInteger)gUint Blue:(NSUInteger)bUint;
@end

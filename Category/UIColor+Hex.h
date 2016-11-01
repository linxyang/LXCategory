//
//  UIColor+Hex.h
//  颜色常识
//
//  Created by yanglinxia on 13/12/15.
//  Copyright © 2015年 阳林霞. All rights reserved.
//

#import <UIKit/UIKit.h>

//颜色
#define LXColor(a,r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]
//随机颜色
#define LXRandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]
//灰度色
#define LXGrayColorWith(value) LXColor(255,value,value,value)

//统一背景色
#define LXBgColor LXGrayColorWith(206)


@interface UIColor (Hex)

// 默认alpha位1
+ (UIColor *)colorWithHexString:(NSString *)color;

//从十六进制字符串获取颜色，
//color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;



@end

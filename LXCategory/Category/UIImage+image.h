//
//  UIImage+image.h
//  image分类
//
//  Created by Yanglixia on 15/11/13.
//  Copyright © 2015年 阳林霞. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (image)

/** 根据颜色生成一张尺寸为1*1的相同颜色图片 */
+ (UIImage *)imageWithColor:(UIColor *)color;

/** 生成一个有圆形边框的圆形图片 */
+ (UIImage *)imageWithArcBorderWidth:(CGFloat)width borderColor:(UIColor *)color image:(UIImage *)image;
/** 返回一张圆形图片 */
+ (UIImage *)imageConvertToArcImageWithImage:(UIImage *)image;

/** 根据图片生成一张不会被渲染的图片 */
+ (UIImage *)imageRenderWithOriginModeWithName:(NSString *)imageName;

/** 生成一张可拉伸不失真的图片 */
+ (UIImage *)imageStrectWithName:(NSString *)imageName;

/** 把文字给制到图片中并生成一张新的图片返回 */
+ (UIImage *)imageWithText:(NSString *)text andOriginImage:(UIImage *)image;

@end

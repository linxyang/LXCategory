//
//  UIImage+image.m
//  
//
//  Created by Yanglixia on 15/11/13.
//  Copyright © 2015年 阳林霞. All rights reserved.
//
/**
 *  分类:生成一个带边框的圆形图片.
 */

#import "UIImage+image.h"

@implementation UIImage (image)

/** 根据颜色生成一张尺寸为1*1的相同颜色图片 */
+ (UIImage *)imageWithColor:(UIColor *)color
{
    // 描述矩形
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    
    // 开启位图上下文
    UIGraphicsBeginImageContext(rect.size);
    // 获取位图上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 使用color演示填充上下文
    CGContextSetFillColorWithColor(context, [color CGColor]);
    // 渲染上下文
    CGContextFillRect(context, rect);
    // 从上下文中获取图片
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    // 结束上下文
    UIGraphicsEndImageContext();
    
    return theImage;
}

/**
 *  方法: 1.先画一个加上边框后的大裁剪圆
 *       2.渲染,这样只会显示一个圆形填充
 *       3.再画一个尺寸原图片宽度一半为半径大小的裁剪圆
 *       4.把图片渲染上去,这样会遮住原先渲染的大圆中的部分
 *       5.根据上下文生成新图.
 */

/**
 *  生成一张带有边框的圆形图片(边框为0时无边框)
 *
 *  @param width 边框宽度
 *  @param color 边框颜色
 *  @param image 图片
 *
 *  @return 返回新图片
 */
+ (UIImage *)imageWithArcBorderWidth:(CGFloat)width borderColor:(UIColor *)color image:(UIImage *)image
{
    //开启上下文的尺寸要加上两倍的边宽borderWidth
    CGSize contentSize = CGSizeMake(image.size.width + 2 * width,image.size.height + 2 * width);
    
//1.画圆形边框
    
    //开启位位图上下文
    UIGraphicsBeginImageContextWithOptions(contentSize, NO, 0);//no:裁剪后多余的为透明
    
    //绘制一个剪裁区(内切上下文边框的圆)
    UIBezierPath *path1 = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, contentSize.width, contentSize.height)];
    //设置为剪裁区
    [path1 addClip];
    
    //设置渲染边框的颜色
    [color setFill];
    //以填充方式渲染.
    [path1 fill];
    
//2.画圆形图片
    
    //绘制一个剪裁区
    UIBezierPath *path2 = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(width, width, image.size.width, image.size.height)];
    [path2 addClip];
    
    //把图片渲染到上下文中
    [image drawAtPoint:CGPointMake(width, width)];
    
    //从上下文中获取图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //关闭位图上下文
    UIGraphicsEndImageContext();
    
    return newImage;
    
}

/**
 *  返回一张圆形图片
 *
 *  @param image 原正方形图片
 *
 *  @return 新生成的圆形图片
 */
+ (UIImage *)imageConvertToArcImageWithImage:(UIImage *)image;
{
    //开启图片上下文
    UIGraphicsBeginImageContext(image.size);
    //获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGRect rect = CGRectMake(0, 0, image.size.width, image.size.height);
    //画一个圆
    CGContextAddEllipseInRect(ctx, rect);
    
    //设置剪裁
    CGContextClip(ctx);
    //绘图片
    [image drawAtPoint:CGPointZero];
    //从上下文中生成图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    //关闭图片上下文
    UIGraphicsEndImageContext();
    
    //返回图片
    return newImage;
}

/**
 *  根据图片名生成一张不会被系统渲染的图
 *
 *  @param imageName 图片名
 *
 *  @return 返回不会渲染的图片
 */
+ (UIImage *)imageRenderWithOriginModeWithName:(NSString *)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    return image;
}

/**
 *  生成一张可拉伸的图片
 *
 *  @param image 图片名称
 *
 *  @return 返回可拉伸图片
 */
+ (UIImage *)imageStrectWithName:(NSString *)imageName
{
    //重新做图，保留边缘保分不被拉伸失真
    //LeftCapWidt:左宽
    //topCapHeight：高高
    //其实里面还隐藏了2个参数，与这两个组成就是从宽度起+1和从那个高度起+1组成的：1X1图片，以后就是这个范围拉伸。
    UIImage *image = [UIImage imageNamed:imageName];
    image = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
    return image;
}

/**
 *  返回一张绘制文字的图片
 *
 *  @param text  要绘制的文字
 *  @param image 绘制文字所在的图片
 *
 *  @return 绘制文字后的图片
 */
+ (UIImage *)imageWithText:(NSString *)text andOriginImage:(UIImage *)image
{
//    CGSize size = image.size;
    //开启位图上下文
    UIGraphicsBeginImageContext(image.size);
    
    //把图片绘制到上下文中
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    dict[NSForegroundColorAttributeName] = [UIColor whiteColor];
    
    //设置文字的对齐方法,这里用到的是段落
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.alignment = NSTextAlignmentCenter;
    dict[NSParagraphStyleAttributeName] = style;
    
    //绘制文字
    [text drawInRect:CGRectMake(0, 0, image.size.width, 26) withAttributes:dict];
    
    //从上下文中生成一张新的图
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //关闭上下文
    UIGraphicsEndImageContext();

    //返回新图
    return newImage;
}

@end

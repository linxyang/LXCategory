//
//  UIImage+QRCodeWithCImage.m
//  生成二维码
//
//  Created by yanglinxia on 15/9/10.
//  Copyright (c) 2015年 阳林霞. All rights reserved.
//

#import "UIImage+QRCodeWithCImage.h"

@implementation UIImage (QRCodeWithCImage)


/**
 *  根据CIImage生成指定大小的UIImage
 *
 *  @param image CIImage
 *  @param size  图片宽度
 */
+ (UIImage *)createNonInterpolatedUIImageFormCIImage:(CIImage *)image withSize:(CGFloat)size
{
    CGRect extent = CGRectIntegral(image.extent);
    CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));
    
    // 1.创建bitmap;
    size_t width = CGRectGetWidth(extent) * scale;
    size_t height = CGRectGetHeight(extent) * scale;
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    
    // 2.保存bitmap到图片
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    return [UIImage imageWithCGImage:scaledImage];
}

/*
 // 1.创建滤镜对象
 CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
 
 // 2.恢复默认设置
 [filter setDefaults];
 
 // 3.给滤镜设置数据
 NSString *string = @"http://www.520it.com";
 NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
 [filter setValue:data forKeyPath:@"inputMessage"];
 
 // 4.获取生成好的二维码
 CIImage *outputImage = [filter outputImage];
 
 // 5.将二维码显示在imageView上
 self.imageView.image = [UIImage createNonInterpolatedUIImageFormCIImage:outputImage withSize:200];
 
 */

@end

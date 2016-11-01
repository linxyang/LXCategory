//
//  UIImage+QRCodeWithCImage.h
//  生成二维码
//
//  Created by yanglinxia on 15/9/10.
//  Copyright (c) 2015年 阳林霞. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (QRCodeWithCImage)
/**
 *  根据CIImage生成指定大小的UIImage
 *
 *  @param image CIImage
 *  @param size  图片宽度
 */
+ (UIImage *)createNonInterpolatedUIImageFormCIImage:(CIImage *)image withSize:(CGFloat) size;

@end

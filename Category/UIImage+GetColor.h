//
//  UIImage+GetColor.h


#import <UIKit/UIKit.h>

@interface UIImage (GetColor)
/**
 *  获得某个像素的颜色
 *
 *  @param point 像素点的位置
 */
- (UIColor *)pixelColorAtLocation:(CGPoint)point;
@end

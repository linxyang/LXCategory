//
//  UIView+frame.m
//  frame
//
//  Created by Yanglinxia on 15/11/18.
//  Copyright © 2015年 阳林霞. All rights reserved.
//

#import "UIView+frame.h"

@implementation UIView (frame)

/** 坐标x */
- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

/** 坐标y */
- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

/** 宽度 */
- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

/** 高度 */
- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

/** 中点x */
- (void)setCenterX:(CGFloat)centerX
{
    CGPoint tempCenter = self.center;
    tempCenter.x = centerX;
    self.center = tempCenter;
}

- (CGFloat)centerX
{
    return self.center.x;
}

/** 中点y */
- (void)setCenterY:(CGFloat)centerY
{
    CGPoint tempCenter = self.center;
    tempCenter.y = centerY;
    self.center = tempCenter;
}

- (CGFloat)centerY
{
    return self.center.y;
}




@end

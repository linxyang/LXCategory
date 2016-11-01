//
//  UIView+frame.h
//  frame
//
//  Created by Yanglinxia on 15/11/18.
//  Copyright © 2015年 阳林霞. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (frame)

/** 坐标x */
@property(assign, nonatomic) CGFloat x;

/** 坐标y */
@property(assign, nonatomic) CGFloat y;

/** 宽度 */
@property(assign, nonatomic) CGFloat width;

/** 高度 */
@property(assign, nonatomic) CGFloat height;

/** 中点x */
@property(assign, nonatomic) CGFloat centerX;

/** 中点y */
@property(assign, nonatomic) CGFloat centerY;

@end

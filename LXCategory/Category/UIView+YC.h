//
//  UIView+YC.h
//  YCSchool
//
//  Created by yanglinxia on 16/4/26.
//  Copyright © 2016年 yanglinxia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (YC)

/// x
@property(assign, nonatomic) CGFloat yc_x;

/***************   frame    ******************/
/** 坐标y */
@property(assign, nonatomic) CGFloat yc_y;

/** 宽度 */
@property(assign, nonatomic) CGFloat yc_width;

/** 高度 */
@property(assign, nonatomic) CGFloat yc_height;

/** 中点x */
@property(assign, nonatomic) CGFloat yc_centerX;

/** 中点y */
@property(assign, nonatomic) CGFloat yc_centerY;

/** 原点 */
@property(assign, nonatomic) CGPoint yc_origin;

/** 大小 */
@property(assign, nonatomic) CGSize  yc_size;


/***************   xib创建视图    ******************/
//通过xib创建一个view
+ (instancetype)yc_viewForXib;

/** 加一个放大缩小还原过程的动画 */
- (void)yc_addBouncesAnimation;

/** 截取当前view图层 */
- (UIImage *)yc_screenshotImage;

/** view中间添加一个指示器 */
- (UIActivityIndicatorView *)yc_loadingView;


/***************  同事的   ******************/


-(void)radiusCilck;  //画圆
-(void)CABasicAnimation; //颤抖

#pragma mark - ============活动指示器============================
-(void)showActivityInView:(CGPoint )point;
-(void)hiddenActivityInView;


- (void)setPosition:(CGPoint)point atAnchorPoint:(CGPoint)anchorPoint;
- (id)initWithSize:(CGSize)size;
- (CGFloat)x;
- (CGFloat)y;


@end

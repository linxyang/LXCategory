//
//  UIView+YC.m
//  YCSchool
//
//  Created by yanglinxia on 16/4/26.
//  Copyright © 2016年 yanglinxia. All rights reserved.
//

#import "UIView+YC.h"

@implementation UIView (YC)

#pragma mark - frame相关
/** 坐标x */
- (void)setYc_x:(CGFloat)yc_x
{
    CGRect frame = self.frame;
    frame.origin.x = yc_x;
    self.frame = frame;
}

- (CGFloat)yc_x
{
    return self.frame.origin.x;
}

/** 坐标y */
- (void)setYc_y:(CGFloat)yc_y
{
    CGRect frame = self.frame;
    frame.origin.y = yc_y;
    self.frame = frame;
}

- (CGFloat)yc_y
{
    return self.frame.origin.y;
}

/** 宽度 */
- (void)setYc_width:(CGFloat)yc_width
{
    CGRect frame = self.frame;
    frame.size.width = yc_width;
    self.frame = frame;
}

- (CGFloat)yc_width
{
    return self.frame.size.width;
}

/** 高度 */
- (void)setYc_height:(CGFloat)yc_height
{
    CGRect frame = self.frame;
    frame.size.height = yc_height;
    self.frame = frame;
}

- (CGFloat)yc_height
{
    return self.frame.size.height;
}

/** 中点x */
- (void)setYc_centerX:(CGFloat)yc_centerX
{
    CGPoint tempCenter = self.center;
    tempCenter.x = yc_centerX;
    self.center = tempCenter;
}

- (CGFloat)yc_centerX
{
    return self.center.x;
}

/** 中点y */
- (void)setYc_centerY:(CGFloat)yc_centerY
{
    CGPoint tempCenter = self.center;
    tempCenter.y = yc_centerY;
    self.center = tempCenter;
}

- (CGFloat)yc_centerY
{
    return self.center.y;
}

/** 原点 */
- (CGPoint)yc_origin {
    return self.frame.origin;
}

- (void)setYc_origin:(CGPoint)yc_origin {
    CGRect frame = self.frame;
    frame.origin = yc_origin;
    self.frame = frame;
}

/** 大小 */
- (CGSize)yc_size {
    return self.frame.size;
}

- (void)setYc_size:(CGSize)yc_size {
    CGRect frame = self.frame;
    frame.size = yc_size;
    self.frame = frame;
}

#pragma mark - 视图相关
/**
 *  通过xib创建一个对象
 *
 *  @return 新创建的对象
 */
+ (instancetype)yc_viewForXib
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}


- (void)yc_addBouncesAnimation
{
    CAKeyframeAnimation *frameAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    frameAnimation.duration = 0.35;
    frameAnimation.values = @[
                              [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.8, 0.8, 1.0)],
                              [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.1, 1.1, 1.0)],
                              [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 1.0)],
                              [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]
                              ];
    [self.layer addAnimation:frameAnimation forKey:nil];
}

// 截图
- (UIImage *)yc_screenshotImage
{
    UIGraphicsBeginImageContextWithOptions(self.layer.bounds.size, YES, [UIScreen mainScreen].scale);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

static char YC_LoadingViewKey;

- (UIActivityIndicatorView *)yc_loadingView
{
    UIActivityIndicatorView *view = objc_getAssociatedObject(self, &YC_LoadingViewKey);
    if(!view)
    {
        view = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        view.center = CGPointMake(self.yc_width/ 2.0, self.yc_height / 2.0);
        view.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
        [self addSubview:view];
        [self bringSubviewToFront:view];
        
        [self setYC_loadingView:view];
    }
    return view;
}

- (void)setYC_loadingView:(UIActivityIndicatorView *)go_loadingView
{
    objc_setAssociatedObject(self, &YC_LoadingViewKey,go_loadingView , OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

/***** 同事的 ***/

-(void)radiusCilck{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = self.yc_width/2;
}
-(void)CABasicAnimation{
    
    CABasicAnimation* shake = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    shake.fromValue = [NSNumber numberWithFloat:-5];
    shake.toValue = [NSNumber numberWithFloat:5];
    shake.byValue = [NSNumber numberWithFloat:1];
    shake.duration = 0.2;//执行时间
    shake.autoreverses = YES; //是否重复
    shake.repeatCount = 1;//次数
    [self.layer addAnimation:shake forKey:@"shakeAnimation"];
    
}

#pragma mark - ============活动指示器============================
-(void)showActivityInView:(CGPoint )point
{
    [self showActivityInView:self style:UIActivityIndicatorViewStyleGray point:point];
}

-(void)showActivityInView:(UIView *)View style:(UIActivityIndicatorViewStyle)style point:(CGPoint )point
{
    UIActivityIndicatorView *activity = nil;
    for (UIActivityIndicatorView *act in View.subviews) {
        if ([act isKindOfClass:[UIActivityIndicatorView class]]) {
            activity = act;
        }
    }
    
    if (!activity) {
        activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:style];
        activity.center=point;
        [View addSubview:activity];
    }
    
    [activity startAnimating];
}

-(void)hiddenActivityInView
{
    if (self==nil) {
        return;
    }
    for (UIActivityIndicatorView *Design in self.subviews) {
        if ([Design isKindOfClass:[UIActivityIndicatorView class]]) {
            [Design stopAnimating];
        }
    }
}

#pragma mark - Init
- (id)initWithSize:(CGSize)size
{
    CGRect rect = (CGRect){CGPointZero, size};
    return [self initWithFrame:rect];
}

- (void)setPosition:(CGPoint)point atAnchorPoint:(CGPoint)anchorPoint
{
    CGFloat x = point.x - anchorPoint.x * self.yc_width;
    CGFloat y = point.y - anchorPoint.y * self.yc_height;
    [self setYc_origin:CGPointMake(x, y)];
}


@end

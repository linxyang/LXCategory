//
//  UIViewController+YC.h
//  YCSchool
//
//  Created by yanglinxia on 16/4/27.
//  Copyright © 2016年 yanglinxia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (YC)


@property (nonatomic,readonly) UIView *yc_navigationBarShadowLineView;

- (void)yc_showNavigationBarShadowLineView;

/**
 *  UIViewController 自定义NavigationBarLineView
 *
 *  @param isNeedShadow 是否需要阴影
 */
- (void)yc_showNavigationBarLineViewWithIsNeedShadow:(BOOL)isNeedShadow;

/**
 *  添加导航栏左边标题(没有点击事件)
 *
 *  @param title 标题
 */
- (void)yc_addLeftTitle:(NSString *)title;

/**
 *  添加导航栏左边标题按钮
 *
 *  @param title  标题
 *  @param target 目标
 *  @param action 动作
 */
- (void)yc_addLeftBarButtonItemWithTitle:(NSString *)title
                                  target:(id)target
                                  action:(SEL)action;

/**
 *  添加导航栏右边标题按钮
 *
 *  @param title  标题
 *  @param target 目标
 *  @param action 动作
 */
- (void)yc_addRightBarButtonItemWithTitle:(NSString *)title
                                   target:(id)target
                                   action:(SEL)action;

/**
 *  添加导航栏左边图标按钮
 *
 *  @param name   图标名称(不带@后面的)
 *  @param target 目标
 *  @param action 动作
 */
- (void)yc_addLeftBarButtonItemWithImageNamed:(NSString *)name
                                       target:(id)target
                                       action:(SEL)action;

/**
 *  添加导航栏右边图标按钮
 *
 *  @param name   图标名称(不带@后面的)
 *  @param target 目标
 *  @param action 动作
 */
- (void)yc_addRightBarButtonItemWithImageNamed:(NSString *)name
                                        target:(id)target
                                        action:(SEL)action;

/**
 * 添加返回按钮
 */
- (void)yc_addBackBarButtonItem;

- (void)yc_addRightDoneBarButtonItemWithTitle:(NSString *)title
                                       target:(id)target
                                       action:(SEL)action;
/**
 *  增加返回按钮
 *
 *  @param target 目标
 *  @param action 动作
 */
- (void)yc_addBackBarButtonItemWithTarget:(id)target
                                   action:(SEL)action;


/**
 *  替换为logo视图
 *
 *  @param target 目标
 *  @param action 动作
 */
- (void)yc_relpaceTitleViewWithLogoViewAndTarget:(id)target
                                          action:(SEL)action;



@end

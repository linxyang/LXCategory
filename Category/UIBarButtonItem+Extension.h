//
//  UIBarButtonItem+Extension.h
//  BaiShi
//
//  Created by Yanglixia on 15/12/25.
//  Copyright © 2015年 Yanglinxia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

/**
 *  统一设置导航条按钮UIBarButtonItem
 *
 *  @param image          图片名
 *  @param highlightImage 高亮图片名
 *  @param target         监听者
 *  @param sel            监听者调用的方法
 *
 *  @return 返回一个UIBarButtonItem
 */
+ (UIBarButtonItem *)itemWithImage:(NSString *)image highlightImage:(NSString *)highlightImage target:(id)target action:(SEL)sel;
/**
 *  统一设置导航条按钮UIBarButtonItem
 *
 *  @param image          图片名
 *  @param highlightImage 选中时的图片名
 *  @param target         监听者
 *  @param sel            监听者调用的方法
 *
 *  @return 返回一个UIBarButtonItem
 */
+ (UIBarButtonItem *)itemWithImage:(NSString *)image selectedImage:(NSString *)selectedImage target:(id)target action:(SEL)sel;

/**
 *  统一设置导航条返回按钮UIBarButtonItem
 *
 *  @param image          图片名
 *  @param highlightImage 高亮图片名
 *  @param target         监听者
 *  @param sel            监听者调用的方法
 *  @param title          文字
 *
 *  @return 返回一个UIBarButtonItem
 */
+ (UIBarButtonItem *)backItemWithImage:(NSString *)image highlightImage:(NSString *)highlightImage target:(id)target action:(SEL)sel title:(NSString *)title;

@end

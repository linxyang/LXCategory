//
//  LXActionSheet.h
//  YCSchool
//
//  Created by yanglinxia on 16/4/28.
//  Copyright © 2016年 yanglinxia. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LXActionSheet;

/**
 *  点击回掉
 *
 *  @param index 按钮索引
 *  @param sheet 操作表
 */
typedef void (^ LXActionSheetClickedAction)(NSUInteger index, LXActionSheet *sheet);

/**
 *  取消回掉
 *
 *  @param index 按钮索引
 *  @param sheet 操作表
 */
typedef void (^ LXActionSheetCancelAction)(NSUInteger index, LXActionSheet *sheet);

@interface LXActionSheet : UIView

/**
 *  初始化操作表
 *
 *  @param cancelButtonTitle 取消按钮标题(不能为nil)
 *  @param otherButtonTitles 其他按钮标题数组
 *
 *  @return 操作表对象
 */

- (instancetype)initWithCancelButtonTitle:(NSString *)cancelButtonTitle
       otherButtonTitlesArray:(NSArray *)titless;

/**
 *  在view中显示操作表
 *
 *  @param view   要显示的view
 *  @param mask   遮罩层
 *  @param click  单击回掉
 *  @param cancel 取消回掉
 */
- (void)showInView:(UIView *)view
              mask:(BOOL)mask
             click:(LXActionSheetClickedAction)click
            cancel:(LXActionSheetCancelAction)cancel;

/**
 *  在view中显示操作表
 *
 *  @param view         要显示的view
 *  @param mask         遮罩层
 *  @param maskColor    遮罩层颜色(默认为黑色半透明)
 *  @param click        单击回掉
 *  @param cancel       取消回掉
 */
- (void)showInView:(UIView *)view
              mask:(BOOL)mask maskColor:(UIColor *)maskColor
             click:(LXActionSheetClickedAction)click
            cancel:(LXActionSheetCancelAction)cancel;

/**
 *  获取指定索引的按钮
 *
 *  @param index 索引(取消按钮默认为0，往上叠加）
 *
 *  @return 按钮对象
 */
- (UIButton *)buttonAtIndex:(NSUInteger)index;

/**
 *  获取指定索引按钮的标题
 *
 *  @param index 索引号
 *
 *  @return 按钮的标题
 */
- (NSString *)currentTitleAtIndex:(NSUInteger)index;



@end

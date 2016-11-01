//
//  UITextField+placeholderColor.h
//  BaiShi
//
//  Created by Yanglixia on 16/1/10.
//  Copyright © 2016年 Yanglinxia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (placeholderColor)


/** 占位文字颜色 */
@property (nonatomic, strong) UIColor *placeholderColor;//分类中只会生成get与set方法,因此要动态添加属性

//自定义添加设置占位文字方法,用来代替系统的setPlaceholder方法
- (void)lx_setPlaceholder:(NSString *)placeholder;


@end

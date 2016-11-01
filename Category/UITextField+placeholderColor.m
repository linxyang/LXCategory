//
//  UITextField+placeholderColor.m
//  BaiShi
//
//  Created by Yanglixia on 16/1/10.
//  Copyright © 2016年 Yanglinxia. All rights reserved.
//

#import "UITextField+placeholderColor.h"
#import <objc/runtime.h>

@implementation UITextField (placeholderColor)

+ (void)load
{
    //交换set方法,用本类中的setPlaceholder方法替换系统的setPlaceholder方法
    //获取系统的setPlaceholder方法
    Method setPlaceholderMethod = class_getInstanceMethod([self class], @selector(setPlaceholder:));
    //获取自定的lx_setPlaceholder方法
    Method lx_setPlaceholderMethod = class_getInstanceMethod(self, @selector(lx_setPlaceholder:));
    
    //交换方法实现
    method_exchangeImplementations(setPlaceholderMethod, lx_setPlaceholderMethod);
    

}

/**
 *  动态添加placeHolderColorn属性,设置占位文字颜色
 *
 *  @param placeholderColor 要设置的颜色
 */
- (void)setPlaceholderColor:(UIColor *)placeholderColor
{
    //动态添加属性,把颜色保存到属性中,placeHolderColor为属性名
    objc_setAssociatedObject(self, @"placeholderColor", placeholderColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    //获取私有属性placeholderLabel
    UILabel *placeholderLabel = [self valueForKey:@"placeholderLabel"];
    
    //设置占位颜色
    placeholderLabel.textColor = placeholderColor;
    

}
/**
 *  返回占位文字的颜色
 *
 *  @return 返回的颜色
 */
- (UIColor *)placeholderColor
{
    return objc_getAssociatedObject(self, @"placeholderColor");
}

/**
 *  设置占位文字与颜色
 *
 *  @param placeholder 占位文字内容
 */
- (void)lx_setPlaceholder:(NSString *)placeholder
{
    //设置占位文字(因为方法交换了,于是这里其实是setPlaceholder方法(系统私有未公开))
    [self lx_setPlaceholder:placeholder];

    //设置占位文字颜色
    [self setPlaceholderColor:self.placeholderColor];
}



//runtime获取当前类中的所有属性(包括系统私有的)
- (void)getAllIvar
{
    unsigned int count;
    Ivar *ivarList = class_copyIvarList([self class], &count);
    NSMutableString *varString = [NSMutableString string];
    for (int i = 0 ; i < count; i++) {
        NSString *varName = [NSString stringWithUTF8String:ivar_getName(ivarList[i])];
        //拼接所有的属性
        [varString appendFormat:@"%@\n",varName];
    }
    //打印所有的属性
//    LXLog(@"%@",varString);
}

@end

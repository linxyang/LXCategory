//
//  UIBarButtonItem+Extension.m
//  BaiShi
//
//  Created by Yanglixia on 15/12/25.
//  Copyright © 2015年 Yanglinxia. All rights reserved.
//  这里采用分类,不采用工具类
//优点:不会增加新的类,占用内存
//    调用方法与苹果一致,便于别人例用.

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)

+ (UIBarButtonItem *)itemWithImage:(NSString *)image highlightImage:(NSString *)highlightImage target:(id)target action:(SEL)sel
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];

    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highlightImage] forState:UIControlStateHighlighted];
    [button sizeToFit];
    
    [button addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    
    //把button包装到uivew中,处理点击范围变大的问题
    UIView *barButtonItemView = [[UIView alloc] initWithFrame:button.bounds];
    [barButtonItemView addSubview:button];

    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:barButtonItemView];
    
    return barButton;
}

+ (UIBarButtonItem *)itemWithImage:(NSString *)image selectedImage:(NSString *)selectedImage target:(id)target action:(SEL)sel
{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:selectedImage] forState:UIControlStateSelected];
    [button sizeToFit];
    
    [button addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    
    //把button包装到uivew中,处理点击范围变大的问题
    UIView *barButtonItemView = [[UIView alloc] initWithFrame:button.bounds];
    [barButtonItemView addSubview:button];
    
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:barButtonItemView];
    
    return barButton;


}

+ (UIBarButtonItem *)backItemWithImage:(NSString *)image highlightImage:(NSString *)highlightImage target:(id)target action:(SEL)sel title:(NSString *)title
{

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highlightImage] forState:UIControlStateHighlighted];

    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    //设置button尺寸
    [button sizeToFit];
    //让它内容内边距向左偏移20,美观
    button.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
    [button addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];

    //把button包装到uivew中,处理点击范围变大的问题
    UIView *barButtonItemView = [[UIView alloc] initWithFrame:button.bounds];
    [barButtonItemView addSubview:button];

    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:barButtonItemView];
    return leftItem;
}
@end

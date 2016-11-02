//
//  UIViewController+YC.m
//  YCSchool
//
//  Created by yanglinxia on 16/4/27.
//  Copyright © 2016年 yanglinxia. All rights reserved.
//

#import "UIViewController+YC.h"
#import <objc/runtime.h>
#import "UIColor+YC.h"
#import "UIView+YC.h"

@implementation UIViewController (YC)


- (void)yc_addLeftTitle:(NSString *)title
{
    [self yc_addLeftBarButtonItemWithTitle:title target:nil action:nil];
    [self.navigationItem.leftBarButtonItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem.enabled = NO;
}

- (void)yc_addLeftBarButtonItemWithTitle:(NSString *)title target:(id)target action:(SEL)action;
{
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:title
                                                                 style:UIBarButtonItemStylePlain
                                                                target:target
                                                                action:action];
    //临时加的
    [leftItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16],NSForegroundColorAttributeName:[UIColor yc_colorWithUInt:0x00B2EE]} forState:UIControlStateNormal];
    
    self.navigationItem.leftBarButtonItem = leftItem;
    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
}

- (void)yc_addRightBarButtonItemWithTitle:(NSString *)title target:(id)target action:(SEL)action;
{
    [self.navigationItem hidesBackButton];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:title
                                                                  style:UIBarButtonItemStylePlain
                                                                 target:target
                                                                 action:action];
    //临时加的
    [rightItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15],NSForegroundColorAttributeName:[UIColor yc_colorWithUInt:0x00B2EE]} forState:UIControlStateNormal];
    
    
    self.navigationItem.rightBarButtonItem = rightItem;
    [self.navigationItem hidesBackButton];
}

- (void)yc_addLeftBarButtonItemWithImageNamed:(NSString *)name target:(id)target action:(SEL)action
{
    [self.navigationItem hidesBackButton];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:name] style:UIBarButtonItemStylePlain target:target action:action];
    self.navigationItem.leftBarButtonItem = leftItem;
    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
}

- (void)yc_addRightBarButtonItemWithImageNamed:(NSString *)name target:(id)target action:(SEL)action
{
    
    
    UIBarButtonItem *rigthItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:name] style:UIBarButtonItemStylePlain target:target action:action];
    self.navigationItem.rightBarButtonItem = rigthItem;
}

- (void)yc_addBackBarButtonItem
{
    [self yc_addLeftBarButtonItemWithImageNamed:@"nav_back" target:self.navigationController action:@selector(popViewControllerAnimated:)];
}

- (void)yc_addBackBarButtonItemWithTarget:(id)target action:(SEL)action
{
    [self yc_addLeftBarButtonItemWithImageNamed:@"nav_back" target:target action:action];
}

- (void)yc_addRightDoneBarButtonItemWithTitle:(NSString *)title target:(id)target action:(SEL)action
{
    [self yc_addRightBarButtonItemWithTitle:title target:target action:action];
    
    NSDictionary *attributes = @{NSForegroundColorAttributeName:[UIColor yc_colorWithUInt:0x00b4ff],
                                 NSFontAttributeName:[UIFont systemFontOfSize:16]};
    
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:attributes forState:UIControlStateNormal];
    
    attributes = @{NSForegroundColorAttributeName:[UIColor lightGrayColor],
                   NSFontAttributeName:[UIFont systemFontOfSize:16]};
    
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:attributes forState:UIControlStateDisabled];
}

- (void)yc_relpaceTitleViewWithLogoViewAndTarget:(id)target action:(SEL)action
{
    UIButton *logoImageView = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 25)];
    [logoImageView setImage:[UIImage imageNamed:@"dr_darkRoom"] forState:UIControlStateNormal];
    [logoImageView addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = logoImageView;
}

static char yc_NavigationBarShadowLineViewKey;

- (UIView *)yc_navigationBarShadowLineView
{
    return objc_getAssociatedObject(self, &yc_NavigationBarShadowLineViewKey);
}

- (void)yc_showNavigationBarShadowLineView
{
    if(!self.yc_navigationBarShadowLineView)
    {
        UIView *shadowView = [[UIView alloc] initWithFrame:CGRectMake(0,0,self.view.yc_width, 0.5)];
        shadowView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin;
        shadowView.backgroundColor = [UIColor yc_colorWithUInt:0xE3E3E3];
        shadowView.layer.shadowColor = [UIColor grayColor].CGColor;
        shadowView.layer.shadowOffset = CGSizeMake(0, 1);
        shadowView.layer.shadowRadius = 1;
        shadowView.layer.shadowOpacity = 0.65;
        [self.view addSubview:shadowView];
        
        objc_setAssociatedObject(self, &yc_NavigationBarShadowLineViewKey, shadowView, OBJC_ASSOCIATION_RETAIN);
    }
    
    [self.view bringSubviewToFront:self.yc_navigationBarShadowLineView];
    self.yc_navigationBarShadowLineView.hidden = NO;
}

/**
 *  UIViewController 自定义NavigationBarLineView
 *
 *  @param isNeedShadow 是否需要阴影
 */
- (void)yc_showNavigationBarLineViewWithIsNeedShadow:(BOOL)isNeedShadow
{
    if(!self.yc_navigationBarShadowLineView)
    {
        // 在导航栏下,默认会下移64,因此0为y=64
        UIView *shadowView = [[UIView alloc] initWithFrame:CGRectMake(0,0,self.view.yc_width, 0.5)];
        shadowView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin;
        shadowView.backgroundColor = [UIColor yc_colorWithUInt:0xE3E3E3];
        if (isNeedShadow) {
            shadowView.layer.shadowColor = [UIColor grayColor].CGColor;
            shadowView.layer.shadowOffset = CGSizeMake(0, 1);
            shadowView.layer.shadowRadius = 1;
            shadowView.layer.shadowOpacity = 0.65;
            
        }
        [self.view addSubview:shadowView];
        
        objc_setAssociatedObject(self, &yc_NavigationBarShadowLineViewKey, shadowView, OBJC_ASSOCIATION_RETAIN);
    }
    
    [self.view bringSubviewToFront:self.yc_navigationBarShadowLineView];
    self.yc_navigationBarShadowLineView.hidden = NO;
}


@end

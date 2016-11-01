//
//  UIView+Init.m
//  
//
//  Created by Yanglixia on 16/1/15.
//  Copyright © 2016年 Yanglinxia. All rights reserved.
//

#import "UIView+Init.h"

@implementation UIView (Init)
/**
 *  通过xib创建一个对象
 *
 *  @return 新创建的对象
 */
+ (instancetype)lx_viewFromXib
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

@end

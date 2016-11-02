//
//  UIImagePickerController+YC.m
//  YCSchool
//
//  Created by gmall on 16/5/18.
//  Copyright © 2016年 yanglinxia. All rights reserved.
//  为相册控制器添加属性,分辨弹出相册是干嘛的

#import "UIImagePickerController+YC.h"
#import <objc/runtime.h>

static char YC_UIImagePickerControllerIntegerIdentifierKey;

@implementation UIImagePickerController (YC)

-(NSInteger)yc_integerIdentifier
{
    id identifier = objc_getAssociatedObject(self, &YC_UIImagePickerControllerIntegerIdentifierKey);
    return identifier ? [identifier integerValue] : 0;
}

- (void)setYc_integerIdentifier:(NSInteger)yc_integerIdentifier
{
    objc_setAssociatedObject(self, &YC_UIImagePickerControllerIntegerIdentifierKey, @(yc_integerIdentifier), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end

//
//  NSObject+Runtime.h
//
//
//  Created by 1 on 14/12/25.
//  Copyright © 2015年 阳林霞. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Runtime)

// 获取实例方法
+ (void)getInstanceMethodList;

// 获取类方法
+ (void)getClassMethodList;

@end

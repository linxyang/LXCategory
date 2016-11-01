//
//  NSObject+LXInvocation.h
//
//
//  Created by Yanglixia on 15/12/6.
//  Copyright © 2015年 阳林霞. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (LXInvocation)

/**
 *  调用任意方法
 *
 *  @param aSelector 需要调用的方法
 *  @param objects   需要传递的参数
 *
 *  @return 被调用方法的返回值
 */
- (id)performSelector:(SEL)aSelector withObjects:(NSArray *)objects;
@end

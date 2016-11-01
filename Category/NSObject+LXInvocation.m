//
//  NSObject+LXInvocation.m
//  
//
//  Created by Yanglixia on 15/12/6.
//  Copyright © 2015年 阳林霞. All rights reserved.
//

#import "NSObject+LXInvocation.h"

@implementation NSObject (LXInvocation)



- (id)performSelector:(SEL)aSelector withObjects:(NSArray *)objects
{
    //方法签名(方法的描述)
    //这里不能用NSMethodSignature创建,要用[self class]
    NSMethodSignature *signature = [[self class] instanceMethodSignatureForSelector:aSelector];
    
    if (signature == nil) {
        //方法不存在,抛出异常
        //抛出方法一:
        //        @throw [NSException exceptionWithName:@"方法名不存在" reason:nil userInfo:nil];
        
        //方法二:
        [NSException raise:@"方法不存在" format:[NSMutableString stringWithFormat:@"%@方法找不到", NSStringFromSelector(aSelector)] arguments:nil];
        
        return nil;
    }
    
    //创建一个对象,利用它包装一次方法调用（方法调用者、方法名、方法参数、方法返回值）
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    
    //方法的调用者
    invocation.target = self;
    invocation.selector = aSelector;//方法
    
    //设置参数
    NSInteger count1 = objects.count;//外面传进来的参数,可能会超出
    NSInteger paramsCount = signature.numberOfArguments - 2;//签名方法原本参数的个数,它本身就有两个:self、_cmd 两个自带的参数
    
    //选择两个中的最小一个,防止设置参数时数组越界
    NSInteger count = MIN(count1, paramsCount);
    //设置参数
    for (int i = 0; i < count; i++) {
        
        id object = objects[i];
        // 判断是否是NSNull(有些参数可能传空值)
        if ([object isKindOfClass:[NSNull class]]) {
            continue;
        }
        
        [invocation setArgument:&object atIndex:i+2];
    }
    
    [invocation invoke];
    
    // 获得返回值
    //    NSLog(@"%s", signature.methodReturnType);//获得返回值类型
    //    NSLog(@"%zd", signature.methodReturnLength);//返回值内容长度,如是为0,那么就是没返回值
    id result = nil;//返回值类型不确定.
    if (signature.methodReturnLength) {
        // 有返回值类型，才去获得返回值
        [invocation getReturnValue:&result];
    }
    return result;
    
}

@end

//
//  NSString+Path.m
//
//
//  Created by Yanglixia on 15/11/27.
//  Copyright © 2015年 阳林霞. All rights reserved.
//  

#import "NSString+path.h"

@implementation NSString(Path)

//根据调用者的字符串,取出最后路径元素(文件名)拼接到缓存目录后面,生成新路径返回
- (instancetype)cachesDir
{
    NSString *cachesPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    return [cachesPath stringByAppendingPathComponent:[self lastPathComponent]];

}

//根据调用者的字符串,取出最后路径元素(文件名)拼接到文档目录后面,生成新路径返回
- (instancetype)docDir
{
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    return [documentPath stringByAppendingPathComponent:[self lastPathComponent]];
    
}
//根据调用者的字符串,取出最后路径元素(文件名)拼接到临时目录后面,生成新路径返回
- (instancetype)tmpDir
{
    NSString *tmpPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    return [tmpPath stringByAppendingPathComponent:[self lastPathComponent]];
    
}

@end

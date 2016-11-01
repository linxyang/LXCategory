//
//  NSString+Path.h
//
//  Created by Yanglixia on 15/11/27.
//  Copyright © 2015年 阳林霞. All rights reserved.
//  已有路径取出最后文件名->快速拼接到caches.tmp.document后面生成新路径.

#import <Foundation/Foundation.h>

@interface NSString (Path)

/** 生成缓存目录全路径 */
- (instancetype)cachesDir;

/** 生成文档目录全路径 */
- (instancetype)docDir;

/** 生成临时目录全路径 */
- (instancetype)tmpDir;

@end

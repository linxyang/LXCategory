//
//  NSString+Extension.h
//  正则表达式
//
//  Created by hqc on 14/11/15.
//  Copyright (c) 2014年 hqc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)
- (BOOL)isQQ;
- (BOOL)isPhoneNumber;
- (BOOL)isIPAddress;
@end

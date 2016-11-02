//
//  NSObject+YC.m
//  YCSchool
//
//  Created by Yanglixia on 16/5/6.
//  Copyright © 2016年 yanglinxia. All rights reserved.
//

#import "NSObject+YC.h"

@implementation NSObject (YC)


+ (NSMutableArray *)yc_objectArrayWithFilename:(NSString *)filename
{
    return [self mj_objectArrayWithFilename:filename];
}

+ (instancetype)yc_objectWithFilename:(NSString *)filename
{
    return [self mj_objectWithFilename:filename];
}

+ (void)yc_setupReplacedKeyFromPropertyName:(MJReplacedKeyFromPropertyName)replacedKeyFromPropertyName
{
    [self mj_setupReplacedKeyFromPropertyName:replacedKeyFromPropertyName];
}

+ (void)yc_setupObjectClassInArray:(MJObjectClassInArray)objectClassInArray
{
    [self mj_setupObjectClassInArray:objectClassInArray];
}


+ (instancetype)yc_objectWithKeyValues:(id)keyValues
{
    return [self mj_objectWithKeyValues:keyValues];
}

+ (NSMutableArray *)yc_objectArrayWithKeyValuesArray:(NSArray *)keyValuesArray
{
    return [self mj_objectArrayWithKeyValuesArray:keyValuesArray];
}



#pragma mark - 转成JSON

- (NSData *)yc_JSONData
{
    return [self mj_JSONData];
}

- (id)yc_JSONObject
{
    return [self mj_JSONObject];
}

- (NSString *)yc_JSONString
{
    return [self mj_JSONString];
}



@end

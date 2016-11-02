//
//  NSObject+YC.h
//  YCSchool
//
//  Created by Yanglixia on 16/5/6.
//  Copyright © 2016年 yanglinxia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MJExtension/MJExtension.h>


@interface NSObject (YC)

#pragma mark - plist->模型/模型数组
/**
 *  通过plist转成模型
 *
 *  @param filename plist文件
 *
 *  @return 模型对象
 */
+ (instancetype)yc_objectWithFilename:(NSString *)filename;

/**
 *  通过plist转成模型数组
 *
 *  @param filename plist文件名
 *
 *  @return 模型数组
 */
+ (NSMutableArray *)yc_objectArrayWithFilename:(NSString *)filename;

#pragma mark - 替换
/**
 *  将属性名换为其他key去字典中取值
 *
 *  @param replacedKeyFromPropertyName 将属性名换为其他key去字典中取值
 */
+ (void)yc_setupReplacedKeyFromPropertyName:(MJReplacedKeyFromPropertyName)replacedKeyFromPropertyName;

/**
 *  数组中需要转换的模型类
 *
 *  @param objectClassInArray          数组中需要转换的模型类
 */
+ (void)yc_setupObjectClassInArray:(MJObjectClassInArray)objectClassInArray;

#pragma mark - 字典/字典数组->模型/模型数组

/**
 *  通过字典来创建一个模型
 *  @param keyValues 字典(可以是NSDictionary、NSData、NSString)
 *  @return 新建的对象
 */
+ (instancetype)yc_objectWithKeyValues:(id)keyValues;

/**
 *  字典数组->模型数组
 *
 *  @param keyValuesArray 字典数组
 *
 *  @return 模型数组
 */
+ (NSMutableArray *)yc_objectArrayWithKeyValuesArray:(NSArray *)keyValuesArray;


/**
 *  转为JSON Data
 *
 *  @return Data
 */
- (NSData *)yc_JSONData;

/**
 *  转换为字典或者数组
 */
- (id)yc_JSONObject;

/**
 *  转换为JSON 字符串
 */
- (NSString *)yc_JSONString;


@end

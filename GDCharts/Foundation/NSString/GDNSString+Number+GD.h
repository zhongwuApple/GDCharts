//
//  GDNSString+Number+GD.h
//  GDProject
//
//  Created by tiger on 2018/10/16.
//  Copyright © 2018年 tiger. All rights reserved.
//
//  所有的计算中 小数位不保留 0 例如 1.0 字符串输出是 1。
#import <Foundation/Foundation.h>

#define GET_MACRO(_1,_2,_3,NAME,...) NAME


//#define gd_add1(str1, str2) [str1 gd_addWithNumber:str2 scale:2]
//#define gd_add2(str1, str2, ascale) [str1 gd_addWithNumber:str2 scale:ascale]
//#define gd_add(...) GET_MACRO(__VA_ARGS__, gd_add2, gd_add1)(__VA_ARGS__)


//#define gd_addNum(n1, n2, ascale) [NSString gd_addNum1:n1 num2:n2 scale:ascale]


#define gd_add(str1, str2, ascale) [str1 gd_addWithNumber:str2 scale:ascale]
#define gd_sub(str1, str2, ascale) [str1 gd_subWithNumber:str2 scale:ascale]
#define gd_mcl(str1, str2, ascale) [str1 gd_decimalNumberByMultiplyingBy:str2 scale:ascale]
#define gd_div(str1, str2, ascale) [str1 gd_decimalNumberByDividingBy:str2 scale:ascale]


@interface NSString (GDNSString_Number_GD)

- (BOOL)gd_isZero;

+ (NSString *)numberWithDouble:(double)num;

#pragma mark 字符串
/**
 比较2个字符串数值大小  self 与 num1 比较  NSOrderedDescending 意味 self 大于 num1,
 
 @param num1  比较对象
 @return       NSOrderedAscending  升序 , NSOrderedSame 相等, NSOrderedDescending 降序
 */
- (NSComparisonResult )gd_compareWithNumber:(NSString *)num1;


#pragma mark 加减乘除

#pragma mark 字符串计算

/**
 加法  舍位
 
 @param num1 数字1
 @param scale 保留小数位有效数字
 */
- (NSString *)gd_addWithNumber:(NSString *)num1 scale:(short)scale;


/**
 加法
 @param num1 数字
 @param scale 保留小数位有效数字
 @param roundingMode 进位 舍位
 */
- (NSString *)gd_addWithNumber:(NSString *)num1 scale:(short)scale decimalNumberHandlerWithRoundingMode:(NSRoundingMode)roundingMode;




/**
 减法
 @param num1 数字1
 @param scale 保留小数位有效数字
 */
- (NSString *)gd_subWithNumber:(NSString *)num1 scale:(short)scale;

- (NSString *)gd_subWithNumber:(NSString *)num1 scale:(short)scale decimalNumberHandlerWithRoundingMode:(NSRoundingMode)roundingMode;




/**
 减法
 
 @param num1 数字1
 @param scale 保留小数位有效数字
 */
- (NSString *)gd_decimalNumberByMultiplyingBy:(NSString *)num1 scale:(short)scale;

- (NSString *)gd_decimalNumberByMultiplyingBy:(NSString *)num1 scale:(short)scale decimalNumberHandlerWithRoundingMode:(NSRoundingMode)roundingMode;




/**
 除法
 @param scale 保留小数位有效数字
 */
- (NSString *)gd_decimalNumberByDividingBy:(NSString *)num1 scale:(short)scale;

- (NSString *)gd_decimalNumberByDividingBy:(NSString *)num1 scale:(short)scale decimalNumberHandlerWithRoundingMode:(NSRoundingMode)roundingMode;


#pragma mark 基础类型计算

+ (NSString *)gd_addNum1:(double)num1 num2:(double)num2 scale:(short)scale;

+ (NSString *)gd_addNum1:(double)num1 num2:(double)num2 scale:(short)scale decimalNumberHandlerWithRoundingMode:(NSRoundingMode)roundingMode;





















@end

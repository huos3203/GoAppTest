//
//  Fraction.h
//  GoAppTest
//
//  Created by huoshuguang on 14-4-19.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Printing.h"

static int t = 0;
@interface Fraction : NSObject <Printing1,Printing3>
{
    int numerator; //分子
    @public int denominator; //分母
}

-(void)setNumerator:(int)numerator; //numerator 的setter方法
-(void)setDenominator:(int)denominator; //denominator 的setter方法
-(void)setNumerator:(int)numerator andDenominator:(int)denominator;
//一个同时设置两个成员变量的快捷方法

-(id) init;
-(Fraction *)initWithNumerator:(int)numerator  andDenominator:(int)denominator ;

-(int)numerator;  //numerator 的getter方法
-(int)denominator;   //  denominator 的getter方法
-(void)print;
+(void)t;



@end

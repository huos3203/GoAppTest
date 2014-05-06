//
//  Fraction+FractionMath.m
//  GoAppTest
//
//  Created by huoshuguang on 14-4-19.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import "Fraction+FractionMath.h"

@implementation Fraction (Math1)

-(Fraction*) mul: (Fraction*) f
{
    return [[Fraction alloc] initWithNumerator: numerator*[f numerator]  andDenominator: denominator*[f denominator]];
}
-(Fraction*) div: (Fraction*) f
{
    return [[Fraction alloc] initWithNumerator: numerator*[f denominator] andDenominator: denominator*[f numerator]];
} @end

@implementation Fraction (Math2)

-(Fraction*) add: (Fraction*) f
{
    return [[Fraction alloc] initWithNumerator: numerator*[f denominator] + denominator*[f numerator] andDenominator: denominator*[f denominator]];
}
@end

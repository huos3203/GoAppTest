//
//  Fraction.m
//  GoAppTest
//
//  Created by huoshuguang on 14-4-19.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import "Fraction.h"
#import "DenominatorNotZeroException.h"

//在.m中添加类别方法，可以隐藏类方法
@interface Fraction (Math3)
-(Fraction*) sub: (Fraction*) f;//减法
@end

@implementation Fraction (Math3)

-(Fraction*) sub: (Fraction*) f{
    return [[Fraction alloc] initWithNumerator:
            numerator*[f denominator] - denominator*[f numerator] andDenominator: denominator*[f denominator]];
}
@end


@implementation Fraction

-(id)init{
    
    self=[super init];
    return self;
}

-(Fraction *)initWithNumerator:(int)n  andDenominator:(int)d
{
    self = [self init];
    if (self ) {
        [self setNumerator:n andDenominator:d];
    }
    return self;
}

-(NSString*)description
{
    return @" I am a fraction!";
}


-(void) setNumerator: (int) n
{
    numerator=n;
}


-(void) setDenominator: (int) d{
    if (d==0) {
        NSException *e = [DenominatorNotZeroException exceptionWithName:@"DenominatorNotZeroException" reason:@"分母不能为0！" userInfo:nil];
        @throw e;
    }
    denominator=d;
}

-(void) setNumerator: (int) n andDenominator: (int) d{
    if (d==0) {
        NSException *e = [DenominatorNotZeroException exceptionWithName:@"DenominatorNotZeroException" reason:@"分母不能为0！" userInfo:nil];
        @throw e;
    }
    numerator=n;
    denominator=d;
}
-(int) numerator{
    return numerator;
}
-(int) denominator{
    return denominator;
}

-(void) print{
    printf("%d/%d\n",numerator,denominator);
}

-(void) m{
    printf("-m:The class variable t is %d\n",++t);
}

+(void) t{
    printf("+t:The class variable t is %d\n",++t);
}


//Printing协议方法的实现

-(void) print1{
    printf("1:%d/%d\n",numerator,denominator);
}
-(void) print2{
    printf("2:%d/%d\n",numerator,denominator);
}
-(void) print3{
    printf("3:%d/%d\n",numerator,denominator);
}
@end

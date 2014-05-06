//
//  Complex.m
//  GoAppTest
//
//  Created by huoshuguang on 14-4-19.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import "Complex.h"

@implementation Complex

-(Complex*) initWithReal: (double) r andImaginary: (double) i{
    self=[super init];
    if(self){
        [self setReal: r andImaginary: i];
    }
    return self;
}

-(NSString *)description
{
    return @"I am a complex!";
}

-(void) setReal: (double) r
{
    real=r;
}
-(void) setImaginary: (double) i
{
    imaginary=i;
}
-(void) setReal: (double) r andImaginary: (double) i
{
    real=r;
    imaginary=i;
}
-(double) real
{
    return real;
}
-(double) imaginary
{
    return imaginary;
}
-(void) print{
        printf( "%f + %fi", real, imaginary );//输入复数 z=a+bi
}
@end

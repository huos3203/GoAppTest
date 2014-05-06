//
//  Tire.m
//  GoAppTest
//
//  Created by huoshuguang on 14-4-20.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import "Tire.h"

@implementation Tire

-(Tire *)initWithCount:(int)c
{
    if (self = [super init]) {
        count = c;
    }
    return self;
}

-(void)setCount:(int)c
{
    count = c;
}

-(int)count
{
    return count;
}

-(id)copyWithZone:(NSZone *)zone
{
    Tire *tire = [[[self class]allocWithZone:zone]initWithCount:count];
    return tire;
}


@end

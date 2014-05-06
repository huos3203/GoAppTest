//
//  Car.m
//  GoAppTest
//
//  Created by huoshuguang on 14-4-20.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import "Car.h"

@implementation Car

-(void)setEngine:(Engine *)e
{
    [e return];
    [engine release];
    engine = e;
}

-(void)setTire:(Tire *)t
{
    [t retain];
    [tire release];
    tire=t;
}

-(Engine *)engine
{
    return engine;
}

-(Tire *)tire
{
    return tire;
}

-(id) copyWithZone: (NSZone*) zone
{
    Car *car=[[[self class] allocWithZone: zone] init];
    Engine *engineCopy=[engine copy];
    Tire *tireCopy=[tire copy];
    [car setEngine: engineCopy];
    [car setTire: tireCopy];
    [engineCopy release];
    [tireCopy release];
    return car;
}
-(void) dealloc{
    [engine release];
    [tire release];
    [super dealloc];
}
@end

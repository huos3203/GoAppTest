//
//  Address.m
//  GoAppTest
//
//  Created by huoshuguang on 14-4-20.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import "Address.h"

@implementation Address

-(void) setCity: (NSString*) c
{
    [c retain];
    [city release];
    city=c;
}
-(void) setStreet: (NSString*) s
{
    [s retain];
    [street release];
    street=s;
}
-(void)setCity: (NSString*) c andStreet: (NSString*) s
{
    [self setCity: c];
    [self setStreet: s];
}
-(NSString*) city
{
    return city;
}
-(NSString*) street
{
    return street;
}
-(void) dealloc
{
    [city release];
    [street release];
    [super dealloc];
}
@end

//
//  MyRectangle.m
//  GoAppTest
//
//  Created by huoshuguang on 14-4-19.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import "MyRectangle.h"

@implementation MyRectangle

-(MyRectangle*) initWithWidth: (int) w andHeight: (int) h
{
    self=[super init];
    if(self){
        [self setWidth: w];
        [self setHeight: h];
    }
    return self;
}
-(void) setWidth: (int) w
{
    width=w;
}
-(void) setHeight: (int) h
{
    height=h;
}
-(int) width
{
    return width;
}
-(int) height
{
    return height;
}
-(void) area
{
    printf("%d\n",width*height);
}
@end

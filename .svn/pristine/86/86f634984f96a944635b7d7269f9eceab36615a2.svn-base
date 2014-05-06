//
//  MySquare.m
//  GoAppTest
//
//  Created by huoshuguang on 14-4-19.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import "MySquare.h"

@implementation MySquare

-(MySquare*) initWithSize: (int) s{
    self=[super init]; if(self){
        [self setWidth: s];
        [self setHeight: s];
        //因为正方形的长宽相等，所以我们把正方形的边长赋给父类的长宽，以便复用计算面积的方法area();
    }
    return self;
}

-(void) setSize: (int) s
{
    size=s;
}
-(int)size
{
    return size;
}

@end

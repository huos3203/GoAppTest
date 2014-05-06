//
//  Prisoner.m
//  GoAppTest
//
//  Created by huoshuguang on 14-4-20.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import "Prisoner.h"

@implementation Prisoner

-(void) setPid: (int) p
{
    pid=p;
}
-(void) setName: (NSString*) n
{
//    [n retain];
//    [name release];
    name=n;
}
-(int) pid
{
    return pid;
}

-(NSString*) name
{
    return name;
}
@end

//
//  Person.m
//  GoAppTest
//
//  Created by huoshuguang on 14-4-20.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import "Person.h"

@implementation Person

-(void) setPid: (int) p
{
    pid=p;
}
-(void) setName: (NSString*) n
{
    [n retain];
    [name release];
    name=n;
}
-(void)setHeight:(float)h
{
    height = h;
}
-(int) pid
{
    return pid;
}
-(NSString*) name
{
    return name;
}
-(float)height
{
    return height;
}
//哈希表，两个方法
- (NSUInteger) hash
{
    return pid+[name hash];
}

-(BOOL) isEqual: (id) p
{
    if(pid==[p pid]&&[name isEqualToString: [p name]])
    {
        return YES;
    }else{
            return NO;
    }
}

//NSCoding协议
-(void) encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject: name forKey: @"name"];
    [coder encodeInt: pid forKey: @"pid"];
    [coder encodeFloat: height forKey: @"height"];
}

-(id) initWithCoder: (NSCoder*) decoder
{
    self=[super init];
    if(self){
        name=[decoder decodeObjectForKey: @"name"];
        [self setName: [decoder decodeObjectForKey: @"name"]];
        //不能写成 name=[decoder decodeObjectForKey: @"name"]因为 name 是对象，需要调用setter 方法，执行 retain操作。
        pid=[decoder decodeIntForKey: @"pid"];
        height=[decoder decodeFloatForKey: @"height"];
    }
    return self;
}


-(void) dealloc
{
    [name release];
    [super dealloc];
}
@end

//
//  Person.h
//  GoAppTest
//
//  Created by huoshuguang on 14-4-20.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject<NSCoding>
{
    int pid;
    NSString *name;
    float height;
}
-(void) setPid: (int) pid;
-(void) setName: (NSString*) name;
-(void)setHeight:(float)height;
-(int) pid;
-(NSString*) name;
-(float)height;
@end

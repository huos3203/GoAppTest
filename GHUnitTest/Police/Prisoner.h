//
//  Prisoner.h
//  GoAppTest
//
//  Created by huoshuguang on 14-4-20.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import <Foundation/Foundation.h>

//犯人类型
@interface Prisoner : NSObject
{
    int pid;
    NSString *name;
}
-(void) setPid: (int) pid;
-(void) setName:(NSString*) name;
-(int) pid;
-(NSString*) name;

@end

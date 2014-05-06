//
//  TestDao.m
//  GoAppTest
//
//  Created by huoshuguang on 14-4-22.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import "TestDao.h"

@implementation TestDao


-(void)creatTable
{
    FMDatabase *db = [[[DB alloc] init] getDatabase];

    if (![db open]) {
        return;
    }
    [db executeUpdate:@"create table t_user (Id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,Uid VARCHAR(4) NOT NULL)"];
    if ([db hadError]) {
        NSLog(@"Err %d :%@",[db lastErrorCode],[db lastErrorMessage]);
    }
}
@end

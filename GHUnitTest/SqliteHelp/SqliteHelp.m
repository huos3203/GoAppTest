//
//  SqliteHelp.m
//  GoAppTest
//
//  Created by huoshuguang on 14-5-8.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import "SqliteHelp.h"
#import "Person.h"
@implementation SqliteHelp

@synthesize database = _database;
@synthesize statement = _statement;
@synthesize errmsg = _errmsg;


//打开数据库，并加密数据库文件
-(BOOL)openDatabase
{
    if (sqlite3_open([[self dataFilePath:DB_NAME] UTF8String], &_database) == SQLITE_OK) {
        const char *key = [@",66c9a^N" UTF8String];         //数据库文件加密
        sqlite3_key(_database,key,(int)strlen(key));             //数据库文件加密
        NSLog(@"\n == 数据库打开 or 创建成功 ===\n");
        return  YES;
    }else{
        NSLog(@"\n=== 数据库打开失败 === \n");
        return NO;
    }
}


//关闭数据库
-(void)closeDataBase
{
    sqlite3_close(_database);
}

//获取数据库文件路径
-(NSString *)dataFilePath:(NSString *)fileName
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return [documentsDirectory stringByAppendingPathComponent:fileName];
}

//添加数据，更新数据
-(BOOL)insertOrUpdateData:(NSString *)sql
{
    if ([self openDatabase]) {
        if ((sqlite3_exec(_database, [sql UTF8String], nil, &_statement, &_errmsg)!= SQLITE_OK)) {
            NSLog(@"\n===插入数据失败 ===\n");
            NSLog(@"\n== sql Error:%s",_errmsg);
            return  NO;
        }else{
            NSLog(@"\n===插入数据成功====n");
            return YES;
        }
    }
    sqlite3_close(_database);
    return NO;

}

-(NSMutableArray *)seeDatabase
{
    NSMutableArray *persions = [[NSMutableArray alloc]init];
    NSString *sql = [NSString stringWithFormat: @"select * from t_relive"];
    if ([self openDatabase]) {
        if (sqlite3_prepare(_database, [sql UTF8String], -1, &_statement, nil)== SQLITE_OK) {
            while (sqlite3_step(_statement) == SQLITE_ROW) {
//                Person *persion = [Person new];
                int name = sqlite3_column_int(_statement, 0);
//                [persion setName:[NSString stringWithUTF8String:name]];
                
                int index = sqlite3_column_int(_statement, 1);
//                [persion setPid:[[NSString stringWithUTF8String:index] intValue]];
//                [persions addObject: persion];
                
                NSLog(@"%i = %i",name, index);
            }
            sqlite3_finalize(_statement);
        }
    }
    sqlite3_close(_database);
    return persions;
}

-(int)getCountOfDatabase
{
    int count = 0;
    NSString *sql = [NSString stringWithFormat:@"select * from User"];
    if ([self openDatabase]) {
        if (sqlite3_prepare_v2(_database, [sql UTF8String], -1, &_statement, nil) == SQLITE_OK){
            while (sqlite3_step(_statement) == SQLITE_ROW) {
                count ++;
            }
            sqlite3_finalize(_statement);
        }
    }
    return count;
}


@end





















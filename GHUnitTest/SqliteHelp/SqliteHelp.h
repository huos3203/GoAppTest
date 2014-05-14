//
//  SqliteHelp.h
//  GoAppTest
//
//  Created by huoshuguang on 14-5-8.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

#define DB_NAME @"textfile.db"       //数据库文件名


@interface SqliteHelp : NSObject

@property sqlite3 *database;                //数据库句柄
@property sqlite3_stmt *statement;      //sql语句
@property char *errmsg;
-(BOOL) openDatabase;                       //打开数据库 ,这个函数一般不直接调用，而是直接调用对数据库操作的函数
-(void) closeDataBase;                          //关闭数据库，这个函数一般不直接调用，而是直接调用对数据库操作的函数

-(NSString *)dataFilePath:(NSString*)fileName; //返回数据库存储路径 这个函数一般不直接调用,而是直接调用对数据库操作的函数
-(BOOL)creatTable:(NSString *)tableName;
    /**
     *说明: 给定一个SQL语句 插入或者编辑一个数据
     *语句格式 :
     * 插 入 : [ insert into talbeName values(data1, data2, data3, ...);]
     *编辑:[update talbeName set(字段名)=(修改后的数据) where(字段名)=(修改前的数据);]
     */
-(BOOL) insertOrUpdateData:(NSString *)sql;

-(NSMutableArray *) getUsers;       //以数组的形势，来获取所有用户
-(int) getCountOfDatabase;             //获取当前数据库的数量


@end

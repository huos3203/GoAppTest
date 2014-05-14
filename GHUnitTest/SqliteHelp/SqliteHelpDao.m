//
//  SqliteHelpDao.m
//  GoAppTest
//
//  Created by huoshuguang on 14-5-9.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import "SqliteHelpDao.h"
#import "SqliteHelp.h"
@implementation SqliteHelpDao

-(void)buildDatabase
{
    NSError *error;
    NSString *textFile = @"张三;李四;王二;马六";
//    NSString *textFile = @"111;222;333;444;555";
    if (textFile == nil) {
        NSLog(@"Error reading text file.%@",[error localizedFailureReason]);
    }
    NSArray *row = [textFile componentsSeparatedByString:@";"];
    NSInteger count = [row count];
    SqliteHelp *t = [SqliteHelp new];
    for (int i = 0; i < count; i++) {
        NSString *tempString = [NSString stringWithFormat:@"%@",row[i]];
        NSLog(@"%@",tempString);
        [t insertOrUpdateData:tempString];
    }
}

-(void)createTableName:(NSString *)tableName
{
    SqliteHelp *sqlhelp = [SqliteHelp new];
    [sqlhelp creatTable:tableName];
}


-(void)insertDatabase
{
    NSError *error;
    NSString *textFile = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"shema.sqlite.data.sql" ofType:nil]encoding:NSUTF8StringEncoding error:&error];
    if (textFile == nil) {
         NSLog(@"Error reading text file.%@",[error localizedFailureReason]);
    }
    NSArray *row = [textFile componentsSeparatedByString:@";"];
    NSInteger count = [row count];
    SqliteHelp *t = [SqliteHelp new];
    for (int i = 0; i < count; i++) {
        NSString *tempString = [NSString stringWithFormat:@"%@",row[i]];
        NSLog(@"%@",tempString);
        [t insertOrUpdateData:tempString];
    }
}
@end

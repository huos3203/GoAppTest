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
    NSString *textFile = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"schema.sqlite.tables.sql" ofType:nil] encoding:NSUTF8StringEncoding error:&error];
    if (textFile == nil) {
        NSLog(@"Error reading text file.%@",[error localizedFailureReason]);
    }
    NSArray *row = [textFile componentsSeparatedByString:@";"];
    NSInteger count = [row count];
    SqliteHelp *t = [SqliteHelp new];
    for (int i = 0; i < count; i++) {
        NSString *tempString = [NSString stringWithFormat:@"%@;",row[i]];
        NSLog(@"%@",tempString);
        [t insertOrUpdateData:tempString];
    }
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
        NSString *tempString = [NSString stringWithFormat:@"%@;",row[i]];
        NSLog(@"%@",tempString);
        [t insertOrUpdateData:tempString];
    }
}
@end

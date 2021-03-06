//
//  MyTest.m
//  GoAppTest
//
//  Created by pengyucheng on 14-2-18.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import <GHUnitIOS/GHUnit.h>

#import "DataFactory.h"
#import "SecretModel.h"
#import "TestModel.h"
#import "DB.h"
@interface MyTest : GHTestCase{

}

@end

@implementation MyTest

- (void)testStrings {
    NSString *string1 = @"a string";
    GHTestLog(@"I can log to the GHUnit test console: %@", string1);
    
    // Assert string1 is not NULL, with no custom error description
//    GHAssertNotNULL(string1, nil);
    
    // Assert equal objects, add custom error description
    NSString *string2 = @"a string";
    GHAssertEqualObjects(string1, string2, @"A custom error message. string1 should be equal to: %@.", string2);
}



-(void)testInsertSecret
{
    SecretModel *secret1 = [[SecretModel alloc] init];
    secret1.rowid = 1;
    secret1.fileName = @"test221.jpg";
    secret1.filePath = @"user/admin/download/test2.jpg";
    secret1.fileType = @"jpg";
    secret1.makeTime = @"2014-04-05";
    secret1.logName = @"2014-014-05";
    [[DataFactory shardDataFactory] insertToDB:secret1 Classtype:secret];
}

-(void)testUpdate
{
    SecretModel *secret1 = [[SecretModel alloc] init];
    secret1.rowid = 10;
    secret1.fileName = @"test221.jpg";
    secret1.filePath = @"user/admin/download/test2.jpg";
//    secret1.fileType = nil;
    secret1.makeTime = @"2014-04-05";
    secret1.logName = @"2014-04-05";
    [[DataFactory shardDataFactory] updateToDB:secret1 Classtype:secret];

}
-(void)testSearch
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@"jpg" forKey:@"fileType"];
    [[DataFactory shardDataFactory] searchWhere:dic orderBy:@"rowid DESC" offset:0 count:10 Classtype:secret callback:^(NSArray *result) {
        GHTestLog(@"%@",result); }];
//    [[DataFactory shardDataFactory] searchAllOrderBy:@"makeTime" Classtype:secret callback:^(NSArray *result) {
//        GHTestLog(@"%@",result);
//    }];
}

-(void)testUpdateColume
{
    [[DataFactory shardDataFactory] updateToDBWithWhere:@"rowid = 8" columeName:@"fileType" columeValue:@"png" Classtype:secret];

}
-(void)testFetchColume
{
    [[DataFactory shardDataFactory] fetchToDBWithWhere:@"rowid = 27" columeName:@"makeTime" Classtype:secret callback:^(NSString *result) {
        GHTestLog(@"%@",result);
    }];
}

-(void)testDeleteModel
{
    SecretModel *secret1 = [[SecretModel alloc] init];
    secret1.rowid = 4;
    secret1.fileName = @"test221.jpg";
    secret1.filePath = @"user/admin/download/test2.jpg";
    //    secret1.fileType = nil;
    secret1.makeTime = @"2014-04-05";
    secret1.logName = @"2014-04-05";
    [[DataFactory shardDataFactory] deleteToDB:secret1 Classtype:secret];
}
//根据表名封装数据
- (void) testpackingSyncDataByTableNames
{
    SecretModel *secret1 = [[SecretModel alloc] init];
    [[DataFactory shardDataFactory] updateTable:secret1 Classtype:secret];
}

-(void)testCreatTable
{
    FMDatabase *db = [[[DB alloc] init] getDatabase];
    
    if (![db open]) {
        return;
    }
    [db executeUpdate:@"create table IF NOT EXISTS t_user1 (Id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,Uid VARCHAR(4) NOT NULL)"];
    if ([db hadError]) {
        NSLog(@"Err %d :%@",[db lastErrorCode],[db lastErrorMessage]);
    }
}

-(void)testAddColumnToTable
{
    FMDatabase *db = [[[DB alloc] init] getDatabase];
    if (![db open]) {
        return ;
    }
    
//    NSString *addColumnStr = @"(PwdStatus boolean, QQNickName text, PicStatus VARCHAR(4));";
    NSString *addColumnStr = @"QQNickName text";
    
    //获取旧表中的字段名
    NSString *theSql=[NSString stringWithFormat:@"select * from t_user1"];
    FMResultSet *resultSet=[db executeQuery:theSql];
    [resultSet setupColumnNames];
    //拼接sql语句中的老字段
    NSEnumerator *columnNames = [resultSet.columnNameToIndexMap keyEnumerator];
    NSString *tempColumnName= nil;
    //    NSMutableString* insertKey = [NSMutableString stringWithCapacity:0];
    while ((tempColumnName = [columnNames nextObject]))
    {
        NSLog(@"字段名:%@",tempColumnName);
        if ([[addColumnStr lowercaseString] rangeOfString:tempColumnName].length>0) {
            NSLog(@"字段已存在，不需再添加");
            [db close];
            return;
        }
    }
    
    NSString *sqlstr = [NSString stringWithFormat:@"alter table t_user1 add COLUMN %@",addColumnStr];
    [db executeUpdate:sqlstr];
    if ([db hadError]) {
        NSLog(@"Err %d:%@",[db lastErrorCode],[db lastErrorMessage]);
    }
    [db close];
}

//时间运算
-(void)testTime{
    NSDate * now = [NSDate date];
    NSDate * anHourAgo = [now dateByAddingTimeInterval:-60*60];
    NSDate *result1 = [anHourAgo laterDate:now];
    NSDate * result2 = [now earlierDate:anHourAgo];
    NSTimeInterval result4 = [anHourAgo timeIntervalSinceDate: now];
    NSComparisonResult result3 = [anHourAgo compare:now];
    NSLog(@"now : %@,anHourAgo :%@ ,laterDate :%@ ,earlierDate : %@,compare :%d ",now,anHourAgo,result1,result2,result3);
    NSLog(@"result4:%f",result4);
    int ti = result4/(24*60*60);
    NSLog(@"时间差：%d 天",ti);

}

//倒计时
-(void)testTimerFireMethod{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *shibo = [[NSDateComponents alloc] init];
    [shibo setYear:2014];
    [shibo setMonth:12];
    [shibo setDay:13];
    NSDate *todate = [cal dateFromComponents:shibo];
    NSDate *today = [NSDate date];
    unsigned int unitFlags = NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit;
    NSDateComponents *d = [cal components:unitFlags fromDate:today toDate:todate options:0];
    NSString *txt = [NSString stringWithFormat:@"%d年%d月%d日",[d year],[d month],[d day]];
    NSLog(@"%@",txt);
    NSLog(@"%d",[d year]);


}
@end

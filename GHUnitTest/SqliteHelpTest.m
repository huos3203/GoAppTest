//
//  SqliteHelpTest.m
//  GoAppTest
//
//  Created by huoshuguang on 14-5-9.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import <GHUnitIOS/GHTestCase.h>
#import "SqliteHelpDao.h"
@interface SqliteHelpTest : GHTestCase

@end

@implementation SqliteHelpTest

-(void)testBuildDatabase
{
    SqliteHelpDao *dao = [SqliteHelpDao new];
    [dao buildDatabase];
}

-(void)testInsertDatabase
{
    SqliteHelpDao *dao = [SqliteHelpDao new];
    [dao insertDatabase];
}

-(void)testCreateTable
{
    SqliteHelpDao *dao = [SqliteHelpDao new];
    [dao createTableName:@"textfile"];
}
@end

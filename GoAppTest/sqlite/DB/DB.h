//
//  DB.h
//  GoAppTest
//
//  Created by huoshuguang on 14-4-22.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FMDatabase.h"

@interface DB : NSObject
{
    FMDatabase *db;
}
- (BOOL)initDatabase;
- (void)closeDatabase;
- (FMDatabase *)getDatabase;
@end

//
//  UserModel.m
//  GoAppTest
//
//  Created by pengyucheng on 14-2-18.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import "UserModel.h"

@implementation UserModelBase

+(Class)getBindingModelClass
{
    return [UserModelBase class];//返回商家实体
}

const static NSString* tablename = @"User";//表名

+(const NSString *)getTableName
{
    return tablename;
}

@end

@implementation UserModel

-(id)init
{
    self = [super init];
    if (self)
    {
        self.primaryKey = @"Bid";//主健
    }
    return self;
}

- (id)initWithJsonDictionary:(NSDictionary*)dic
{
    self = [super init];
    if (self)
    {
//        self.Uid=[dic objectForKey:@"Bid"];
//        self.StoreName=[dic objectForKey:@"StoreName"];
//        self.Longitude=[dic objectForKey:@"Longitude"];
//        self.Latitude=[dic objectForKey:@"Latitude"];
    }
    return self;
}

@end

//
//  Tools.m
//  GoAppTest
//
//  Created by huoshuguang on 14-5-15.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import <GHUnitIOS/GHTestCase.h>

#import "OpenUDID.h"
@interface ToolsGHTestCase : GHTestCase

@end



@implementation ToolsGHTestCase



-(void)testGetPhoneInfo
{

    NSString *strSysName = [[UIDevice currentDevice] systemName];
    GHTestLog (@"系统名称：%@", strSysName);
    NSString *strSysVersion = [[UIDevice currentDevice] systemVersion];
    GHTestLog(@"系统版本号：%@", strSysVersion);
    NSString *idfv = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    GHTestLog(@"设备的唯一标示:%@",idfv);
    
    NSString *openUDID = [OpenUDID value];
    GHTestLog(@"设备唯一标识OpenUDID:%@",openUDID);
    
}

-(void)testPyccParser
{

}

-(void)testUuid {
    CFUUIDRef puuid = CFUUIDCreate( nil );
    
    CFStringRef uuidString = CFUUIDCreateString( nil, puuid );
    NSString * result = (NSString *)CFBridgingRelease(CFStringCreateCopy( NULL, uuidString));
    GHTestLog(@"设备唯一标识UUid:%@",result);
}

@end

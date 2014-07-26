//
//  MyUSB.h
//  GoAppTest
//
//  Created by huoshuguang on 14-6-23.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PTChannel.h"
@interface MyUSB : NSObject<PTChannelDelegate>


-(void)createNewChannel;
-(void)colseUSB;
@end

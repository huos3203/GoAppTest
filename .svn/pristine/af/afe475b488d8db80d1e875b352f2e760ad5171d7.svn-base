//
//  SellTickets.h
//  GoAppTest
//
//  Created by huoshuguang on 14-4-20.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SellTickets : NSObject
{
    int tickets;//未售出的票数
    int count;//售出的票数
    NSThread* ticketsThread1;//线程 1
    NSThread* ticketsThread2;//线程 2
    NSThread* ticketsThread3;//线程 3
    NSCondition* ticketsCondition;//同步锁
}
- (void) ticket; //售票方法
@end

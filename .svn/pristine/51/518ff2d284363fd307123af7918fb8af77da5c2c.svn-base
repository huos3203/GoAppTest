//
//  SellTickets.m
//  GoAppTest
//
//  Created by huoshuguang on 14-4-20.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import "SellTickets.h"

@implementation SellTickets

-(void)ticket
{
    tickets = 100;
    count = 0 ;
    ticketsCondition = [[NSCondition alloc]init];
    ticketsThread1 = [[NSThread alloc]initWithTarget:self selector:@selector(run) object:nil];
    [ticketsThread1 setName:@"Thread-1"];
    [ticketsThread1 start];
    
    ticketsThread2=[[NSThread alloc] initWithTarget:self selector:@selector(run) object:nil];
    [ticketsThread2 setName:@"Thread-2"];
    [ticketsThread2 start];
    
    ticketsThread3=[[NSThread alloc] initWithTarget:self selector:@selector(asyn) object:nil];
    [ticketsThread3 setName:@"Thread-3"];
    [ticketsThread3 start];
    
    [NSThread sleepForTimeInterval:80];

}

//测试线程之间是否异步执行
-(void)asyn
{
    [NSThread sleepForTimeInterval:5];
    printf("*****************************\n");
}

-(void)run
{
    while (YES) {
        //上锁
        [ticketsCondition lock];
        if (tickets>0) {
            [NSThread sleepForTimeInterval:0.5];
            count = 100 - tickets;
            NSLog(@"当前票数是:%d,售出:%d,线程名:%@",tickets,count,[[NSThread currentThread] name]);
            tickets --;
        }else{
            break;
        }
        //解锁
        [ticketsCondition unlock];
    }

}

@end

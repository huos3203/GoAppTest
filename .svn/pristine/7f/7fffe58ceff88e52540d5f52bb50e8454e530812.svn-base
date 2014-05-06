//
//  MyOperation.m
//  GoAppTest
//
//  Created by huoshuguang on 14-4-20.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import "MyOperation.h"

@implementation MyOperation

-(MyOperation *)initWithNum:(int)n
{
    if (self = [super init]) {
        num = n;
    }
    return self;
}


//YES,表示任务可以并发执行 ,默认为NO,任务为串行执行
-(BOOL)isConcurrent
{
    return YES;
}

//任务方法，继承自NSOperation
-(void)main
{
    NSLog(@"%d\n",++num);
}
@end

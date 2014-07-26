//
//  MyBlock.m
//  GoAppTest
//
//  Created by huoshuguang on 14-5-18.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import "MyBlock.h"

@implementation MyBlock


/*
        Block声明与创建
 
 */
-(void)myBlockTest
{
   
        MyBlockTest myblock = ^(int num) {
            NSLog(@"myBlockTest:Num %d",num);
            return num;
        };
    UIDevice
    int ret = myblock(3);
}
@end

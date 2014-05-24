//
//  MyTask.h
//  GoAppTest
//
//  Created by huoshuguang on 14-5-22.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyTask : NSObject
{
    NSTimer *_timer;
    int _count;
}

@property (nonatomic, assign) float progress;
@property (nonatomic, assign) BOOL isCompleted;
@property (nonatomic, strong) NSString *title;

- (void)start;

@end

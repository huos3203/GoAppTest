//
//  MyTask.m
//  GoAppTest
//
//  Created by huoshuguang on 14-5-22.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import "MyTask.h"

@implementation MyTask

-(void)start
{
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(timerHander:) userInfo:nil repeats:YES];
    
}
-(void)timerHander:(NSTimer *)timer
{
    _count ++;
    float progress = 0.1 * _count;
    if (_progress>0.9) {
        
        progress = 1.0;
        [_timer invalidate];
        _isCompleted = YES;
    }
    self.progress = progress;
}
@end

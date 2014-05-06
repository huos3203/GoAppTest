//
//  Police.m
//  GoAppTest
//
//  Created by huoshuguang on 14-4-20.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import "Police.h"
#import "Prisoner.h"
@implementation Police

-(id)init
{
    self = [super init];
    if (self) {
        //获取通知中心，它是单例
        NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
        //向通知中心把自己添加为观察者，第一个参数是观察者，第二参数指定handleNotification为处理通知的方法，第三个参数是观察的事件的标示符prisioner_name（一个标示值，不是那个属性）
        [nc addObserver:self selector:@selector(handleNotification:) name:@"prisioner_name" object:nil];
    }
    return self;
}

//接收通知，这个方法的名字任意，只要参数是NSNotification就可以
-(void)handleNotification:(NSNotification *)notification
{
    Prisoner *prisoner = [notification object];  //获得通知中心传递过来的事件源对象
    NSLog(@"处理通知中心事件源对象:%@",[prisoner name]);
}




///////KVO
//接收通知的方法，继承自NSObject父类
//请先看main函数中的addObserver方法参数的解释再来这个方法的解释
//第一个参数是你监视的对象上的属性，第二个参数是你监视的对象，第三个参数存放了你监视的属性值，最后一个参数我们传递nil
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"name"]) {
        NSLog(@"Police:%@",[change objectForKey:@"old"]);
        NSLog(@"Police:%@",[change objectForKey:@"new"]);
        //因为main函数中我们监听name的新旧两个值，所以change对象里就存放了@“old,@"new"两个key-value对
    }
}



@end

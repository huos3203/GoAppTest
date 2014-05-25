//
//  MyDownTask.h
//  GoAppTest
//
//  Created by huoshuguang on 14-5-24.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyDownTask : NSObject


@property(nonatomic,strong)NSString *url;

-(instancetype)initWithUrl:(NSString *)url;

@property(nonatomic,assign)CGFloat progress;
@property(nonatomic,assign)BOOL isCompleted;

@property(nonatomic,strong)NSString *bytesProgress;
@property(nonatomic,strong)NSString *bytesTotal;

@property(nonatomic,strong)NSString *Errmsg;

-(void)start;
-(void)stop;

@end

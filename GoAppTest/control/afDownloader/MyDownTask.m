//
//  MyDownTask.m
//  GoAppTest
//
//  Created by huoshuguang on 14-5-24.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import "MyDownTask.h"
#import "AFNetworking.h"
@implementation MyDownTask
{
    NSURLRequest *_request;
    AFHTTPRequestOperation *_afOperation;
}

-(instancetype)initWithUrl:(NSString *)url
{
    if (!url) {
        return nil;
    }
    
    self = [super init];
    if (!self)
        return nil;

    _url = url;
    __weak MyDownTask *weakself = self;
    if (![_url hasPrefix:@"http"]) {
        _url = [NSString stringWithFormat:@"http://%@",_url];
    }
    NSURL *requestUrl = [[NSURL alloc] initWithString:_url];
    _request = [[NSURLRequest alloc] initWithURL:requestUrl
                                     cachePolicy:NSURLRequestUseProtocolCachePolicy
                                 timeoutInterval:5];
    
    _afOperation = [[AFHTTPRequestOperation alloc] initWithRequest:_request];
    
    //获取下载进度
    [_afOperation setDownloadProgressBlock:^(NSUInteger bytesRead,
                                                                     long long totalBytesRead,
                                                                     long long totalBytesExpectedToRead) {

        weakself.progress =(CGFloat) totalBytesRead / totalBytesExpectedToRead;
        NSString *totalBytes = [weakself formatByteCount:totalBytesRead];
        NSString *totalExpectedBytes = [weakself formatByteCount:totalBytesExpectedToRead];
        weakself.bytesProgress = [NSString stringWithFormat:@"%@/%@",totalBytes,totalExpectedBytes];
    }];
    
    [_afOperation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation,
                                                  id responseObject) {
        weakself.bytesTotal = [weakself formatByteCount:operation.response.expectedContentLength];
        weakself.isCompleted = YES;
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        weakself.Errmsg = error.localizedDescription;
        weakself.isCompleted= YES;
    }];
    return self;
}

-(NSString *)formatByteCount:(long long)size
{
    return [NSByteCountFormatter stringFromByteCount:size countStyle:NSByteCountFormatterCountStyleFile];
}

-(void)start
{
    //下载任务
    [_afOperation start];
}

-(void)stop
{
    //取消下载任务
    [_afOperation cancel];
}
@end

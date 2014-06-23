//
//  MyUSB.m
//  GoAppTest
//
//  Created by huoshuguang on 14-6-23.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import "MyUSB.h"
#import "PTExampleProtocol.h"
@implementation MyUSB
{
    __weak PTChannel *serverChannel_;
    __weak PTChannel *peerChannel_;
}

-(void)createNewChannel
{
    // Create a new channel that is listening on our IPv4 port
    PTChannel *channel = [PTChannel channelWithDelegate:self];
    [channel listenOnPort:PTExampleProtocolIPv4PortNumber IPv4Address:INADDR_LOOPBACK callback:^(NSError *error) {
        if (error) {
            NSLog(@"Failed to listen on 127.0.0.1:%d: %@", PTExampleProtocolIPv4PortNumber, error);
        } else {
           NSLog(@"Listening on 127.0.0.1:%d", PTExampleProtocolIPv4PortNumber);
            serverChannel_ = channel;
        }
    }];
}

-(void)colseUSB
{
    if (serverChannel_) {
        [serverChannel_ close];
    }
}

#pragma mark - PTChannelDelegate

//该方法在通道的输入框架中被调用，返回值为NO时，将忽略输入框架，如果在这协议中没有实现该方法，将会访问全框架
- (BOOL)ioFrameChannel:(PTChannel*)channel shouldAcceptFrameOfType:(uint32_t)type tag:(uint32_t)tag payloadSize:(uint32_t)payloadSize {
    if (channel != peerChannel_) {
        // A previous channel that has been canceled but not yet ended. Ignore.
        //一个已经被取消的channel，但还没有结束，忽略。
        return NO;
    } else if (type != PTExampleFrameTypeTextMessage && type != PTExampleFrameTypePing) {
        NSLog(@"Unexpected frame of type %u", type);
        [channel close];
        return NO;
    } else {
        return YES;
    }
}

//当在通道中有一个新的frame访问到来时，调用该方法
- (void)ioFrameChannel:(PTChannel*)channel didReceiveFrameOfType:(uint32_t)type tag:(uint32_t)tag payload:(PTData*)payload {
    //NSLog(@"didReceiveFrameOfType: %u, %u, %@", type, tag, payload);
    if (type == PTExampleFrameTypeTextMessage) {
        PTExampleTextFrame *textFrame = (PTExampleTextFrame*)payload.data;
        textFrame->length = ntohl(textFrame->length);
        NSString *message = [[NSString alloc] initWithBytes:textFrame->utf8text length:textFrame->length encoding:NSUTF8StringEncoding];
        NSLog(@"[%@]: %@", channel.userInfo, message);
    } else if (type == PTExampleFrameTypePing && peerChannel_) {
        [peerChannel_ sendFrameOfType:PTExampleFrameTypePong tag:tag withPayload:nil callback:nil];
    }
}

//channel关闭时，执行该方法。当因错误关闭时，error的值是NSError对象
- (void)ioFrameChannel:(PTChannel*)channel didEndWithError:(NSError*)error {
    if (error) {
        NSLog(@"%@ ended with error: %@", channel, error);

    } else {
        NSLog(@"Disconnected from %@", channel.userInfo);
    }
}

//监听channels，当有新的连接已经被接受时，执行该方法
- (void)ioFrameChannel:(PTChannel*)channel didAcceptConnection:(PTChannel*)otherChannel fromAddress:(PTAddress*)address {
    //    取消其它连接。我们是先进先出，所以当建立的最后一个连接时，将取消先前的连接来取代他们。
    if (peerChannel_) {
        [peerChannel_ cancel];
    }

    //指向当前连接的弱指针。连接对象保持存活（属与它父类的调度队列），直到连接对象关闭。
    peerChannel_ = otherChannel;
    peerChannel_.userInfo = address;
    NSLog(@"Connected to %@", address);
    // 把关于自己的一些信息发送到另一端
//    [self sendDeviceInfo];
}

@end

//
//  MyRectangle.h
//  GoAppTest
//
//  Created by huoshuguang on 14-4-19.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyRectangle : NSObject
{
    int width;
    int height;
}
-(MyRectangle*) initWithWidth: (int) weight andHeight: (int) height;
-(void) setWidth: (int) width;
-(void) setHeight: (int) height;
-(int) width;
-(int) height;
-(void) area;//计算面积
@end

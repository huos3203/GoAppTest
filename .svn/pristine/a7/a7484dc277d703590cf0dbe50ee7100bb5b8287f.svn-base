//
//  DinerItem.h
//  GoAppTest
//
//  Created by huoshuguang on 14-4-22.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import <Foundation/Foundation.h>

//协议是为一个类指定它要实现什么方法的一种方式
@interface DinerItem : NSObject<NSCopying>

@property(nonatomic,strong)NSString *name;
@property(nonatomic,assign)float price;
@property(nonatomic,strong)NSString *pictureFile;

-(DinerItem*)initWithName:(NSString*)inName Price:(float)inPrice PictureFile:(NSString *)inPictureFile;

+(NSArray *)retrieveInventoryItems;
@end

//
//  DinerItem.m
//  GoAppTest
//
//  Created by huoshuguang on 14-4-22.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import "DinerItem.h"

#define kInventoryAddress @"http://adamburkepile.com/inventory/"

@implementation DinerItem



-(id)copyWithZone:(NSZone *)zone
{
    DinerItem *newDiner = [DinerItem new];
    [newDiner setName:[self name]];
    [newDiner setPrice:[self price]];
    [newDiner setPictureFile:[self pictureFile]];
    return newDiner;
}

-(DinerItem*)initWithName:(NSString*)inName Price:(float)inPrice PictureFile:(NSString *)inPictureFile
{
    if (self == [super init]) {
        self.name = inName;
        self.price = inPrice;
        self.pictureFile = inPictureFile;
    }
    return self;
}

+(NSArray *)retrieveInventoryItems
{
    NSMutableArray *inventory = [NSMutableArray new];
    NSError *error = nil;
    NSArray *jsonInventory = [NSJSONSerialization JSONObjectWithData:[[NSData alloc] initWithContentsOfURL:[[NSURL alloc] initWithString:kInventoryAddress]] options:NSJSONReadingMutableContainers error:&error];
   
    //遍历数组
    [jsonInventory enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSDictionary *item = obj;
        [inventory addObject:[[DinerItem alloc] initWithName:[item objectForKey:@"Name"] Price:[[item objectForKey:@"Price"] floatValue] PictureFile:[item objectForKey:@"Image"]]];
        NSLog(@"解析菜单:%d",idx);
    }];
    
    //copy 方法创建的是一个不可变数组，你可以安全的返回它
    return [inventory copy];
}
@end

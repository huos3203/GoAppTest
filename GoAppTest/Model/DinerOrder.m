//
//  DinerOrder.m
//  GoAppTest
//
//  Created by huoshuguang on 14-4-22.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import "DinerOrder.h"
#import "DinerItem.h"

@implementation DinerOrder

//@synthesize  orderItems;

//查询订单，返回订单中的菜单项  、、因为 copy
-(DinerItem *)findKeyForOrderItem:(DinerItem *)item
{
    NSIndexSet *indexes = [[self.orderItems allKeys] indexesOfObjectsPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
        DinerItem *key = obj;
        return [key.name isEqualToString:item.name] && key.price == item.price;
    }];

    if ([indexes count]>=1) {
        DinerItem *item = [[self.orderItems allKeys] objectAtIndex:[indexes firstIndex]];
            return item;
    }

    return nil;
    }

-(NSMutableDictionary *)orderItems
{
    if (!_orderItems) {
        _orderItems = [NSMutableDictionary new];
    }
    return _orderItems;
}

-(NSString *)orderDescription
{
    NSMutableString *orderDesc = [NSMutableString new];
    
    //sortedArray...根据键的name值排序
    NSArray *keys = [[self.orderItems allKeys] sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        DinerItem *item1 = (DinerItem *)obj1;
        DinerItem *item2 = (DinerItem *)obj2;
        
        return [item1.name compare:item2.name];
    }];
    
    [keys enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        DinerItem *item = (DinerItem *)obj;
        NSNumber *quantity = (NSNumber *)[self.orderItems objectForKey:item];
        [orderDesc appendFormat:@"%@ x %@",item.name,quantity];
    }];
    
    return orderDesc;
}

-(void)addItemToOrder:(DinerItem *)item
{
    DinerItem *key = [self findKeyForOrderItem:item];
    if (!key) {
        [self.orderItems setObject:[NSNumber numberWithInt:1] forKey:item];
    }else{
    
        //增加菜单的个数
        NSNumber *itemNumber = [self.orderItems objectForKey:key];
        int quantity = [itemNumber intValue];
        quantity ++;
        
        //更新订单数组
        [self.orderItems removeObjectForKey:key];
        [self.orderItems setObject:[NSNumber numberWithInt:quantity] forKey:key];
    }

}

-(void)removeItemFromOrder:(DinerItem *)item
{
    DinerItem *key = [self findKeyForOrderItem:item];
    if (!key) {
        NSLog(@"订单中不存在%@菜单",item.name);
    }else {
        
        //递减菜单个数
        NSNumber *itemNumber = [[self orderItems] objectForKey:key];
        int quantity = [itemNumber intValue];
        quantity--;
        
        //更新订单数组
        [self.orderItems removeObjectForKey:key];
        if (quantity > 0) {
            [self.orderItems setObject:[NSNumber numberWithInt:quantity] forKey:key];
        }
        
    
    }
}
@end

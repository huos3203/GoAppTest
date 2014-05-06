//
//  DinerOrder.h
//  GoAppTest
//
//  Created by huoshuguang on 14-4-22.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DinerItem;
@interface DinerOrder : NSObject

@property(nonatomic,strong)NSMutableDictionary *orderItems;


//从菜单数组中，匹配指定菜单项
-(DinerItem *)findKeyForOrderItem:(DinerItem *)item;

-(NSMutableDictionary *)orderItems;

//返回订单详情，即：商品名+单价*个数
-(NSString *)orderDescription;

//添加选中的商品到订单中
-(void)addItemToOrder:(DinerItem *)item;

//从订单中移除选定的商品
-(void)removeItemFromOrder:(DinerItem *)item;
@end

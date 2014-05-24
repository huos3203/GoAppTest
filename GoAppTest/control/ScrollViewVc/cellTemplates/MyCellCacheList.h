//
//  MyCellCacheList.h
//  GoAppTest
//
//  Created by huoshuguang on 14-5-22.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyCellCache.h"
@interface MyCellCacheList : NSObject


@property (nonatomic, strong) NSMutableArray *cells;

//获取Cell和Cell高度，方便TableView调用
- (UITableViewCell*)cellAtIndex:(NSUInteger)index;
- (CGFloat)cellHeightAtIndex:(NSUInteger)index;

//列表中的Cell操作
- (void)addCache:(MyCellCache*)cache;
- (MyCellCache*)cacheAtIndex:(NSUInteger)index;
- (void)setCache:(MyCellCache*)cache atIndex:(NSUInteger)index;

@end

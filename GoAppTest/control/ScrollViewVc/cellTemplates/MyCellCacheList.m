//
//  MyCellCacheList.m
//  GoAppTest
//
//  Created by huoshuguang on 14-5-22.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import "MyCellCacheList.h"

@implementation MyCellCacheList


- (instancetype)init
{
    self = [super init];
    if (!self)
        return nil;
    
    _cells = [NSMutableArray array];
    return self;
}

- (void)addCache:(MyCellCache *)cache
{
    [_cells addObject:cache];
}

- (MyCellCache *)cacheAtIndex:(NSUInteger)index
{
    return [_cells objectAtIndex:index];
}

- (void)setCache:(MyCellCache *)cache atIndex:(NSUInteger)index
{
    [_cells replaceObjectAtIndex:index withObject:cache];
}

- (UITableViewCell *)cellAtIndex:(NSUInteger)index
{
    return [self cacheAtIndex:index].cell;
}

- (CGFloat)cellHeightAtIndex:(NSUInteger)index
{
    return [self cacheAtIndex:index].height;
}

@end

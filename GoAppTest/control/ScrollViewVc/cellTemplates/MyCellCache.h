//
//  MyCellCache.h
//  GoAppTest
//
//  Created by huoshuguang on 14-5-22.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyCellCache : NSObject

//缓存的Cell
@property (nonatomic, strong) UITableViewCell *cell;
//计算的高度
@property (nonatomic, assign) CGFloat height;
//额外数据（可以是Cell的数据）
@property (nonatomic, strong) id tag;
//需要刷新的flag
@property (nonatomic, assign) BOOL needsRefresh;

//创建Cache
- (instancetype)initWithCell:(UITableViewCell*)cell;
+ (instancetype)cacheWithCell:(UITableViewCell*)cell;
- (void)refresh;

@end

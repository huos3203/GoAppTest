//
//  MyCellCache.m
//  GoAppTest
//
//  Created by huoshuguang on 14-5-22.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import "MyCellCache.h"


/*
    在上文中。我们讲了单一样式的UITableViewCell在Autolayout下的动态高度，本文将在上文的基础上，增加两个地方：
 1. 多个样式的UITableViewCell类型。
 2. UITableViewCell内的数据变化。
 
TableView中的Cell模拟下载过程，等“下载”完成后，切换到另一个样式的Cell。
整个Cell使用Autolayout规划，可以正确运行在iOS 7和iOS 6中（Autolayout最低要求iOS 6），
 
 整个方式首先沿用上文的描述的方法:
    即在heightForRowAtIndexPath中使用dequeueReusableCellWithIdentifier来获取Cell并返回Cell的动态高度，
    接着根据IndexPath缓存这个Cell，最后在cellForRowAtIndexPath中直接使用这个Cell，
    因为在cellForRowAtIndexPath方法调用前，全部Cell都会被调用heightForRowAtIndexPath的。
 
 本例的方案：
1. 在ViewController中缓存一个专门的对象，把它叫做Cache，
    这个Cache存储着任务本身的数据，还有对应的Cell，以及Cell是否需要刷新的一个flag（默认是YES）和计算后的Cell高度。
    当这个是否刷新的flag为YES时，heightForRowAtIndexPath会执行计算高度的逻辑并返回这个高度;
    如果这个flag是NO，那么heightForRowAtIndexPath会直接返回缓存的高度。
    
    注意这个可以节省很多效率，因为需要获取动态高度，Cell必须在heightForRowAtIndexPath中被创建，因此每个任务会有一个Cell.
    比如有100个任务下载完成后都切换（刷新）了Cell，那么heightForRowAtIndexPath会被调用10000遍，如果每次都要重新计算Cell高度的话，这会成为一笔很大的开销。
 
 2. 接着使用KVO来监控每一个任务数据的变化，变化分为两种：
        1)一种是Cell内的变化（本例中的Progress变化，但是还没有下载完成）;
        2)另一种是Cell切换（从正在下载切换到下载完成状态的变化）。
 第一种变化，直接修改Cache中数据对应的Cell数据就可以了;
 第二种变化，需要重新设置Cache的Cell，然后设置需要刷新flag为YES就可以了。
 */
@implementation MyCellCache


-(instancetype)initWithCell:(UITableViewCell *)cell
{
    self  = [super init];
    if (!self) {
        return  nil;
    }
    _cell = cell;
    _needsRefresh = YES;
    return  self;
    
}

+(instancetype)cacheWithCell:(UITableViewCell *)cell
{
    return [[MyCellCache alloc] initWithCell:cell];
}

-(CGFloat)height
{
    if (!_needsRefresh) {
        return _height;
    }
    [self refresh];
    _needsRefresh = NO;
    NSLog(@"tableview单元格高度:%f",_height);
    return _height;
}
-(void)refresh
{
    static int count = 0;
    count++;
    NSLog(@"Cell Refresh: %d", count);
    [_cell setNeedsUpdateConstraints];
    [_cell updateConstraintsIfNeeded];
    [_cell.contentView setNeedsLayout];
    [_cell.contentView layoutIfNeeded];
    
    _height = [_cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
}
@end

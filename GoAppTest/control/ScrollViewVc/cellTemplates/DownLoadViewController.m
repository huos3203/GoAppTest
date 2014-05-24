//
//  DownLoadViewController.m
//  GoAppTest
//
//  Created by huoshuguang on 14-5-22.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import "DownLoadViewController.h"
#import "MyCellCacheList.h"
#import "MyTask.h"
#import "NormalCell.h"
#import "CompletedCell.h"
#define PATH_PROG @"tag.progress"
@interface DownLoadViewController ()
{
    MyCellCacheList *_cellCache;
}
@end

@implementation DownLoadViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _cellCache = [MyCellCacheList new];
    for (int i = 0; i < 2; i++)
    {
        MyTask *task = [MyTask new];
        task.title = [NSString stringWithFormat:@"任务：%d", i + 1];
        MyCellCache *cache = [MyCellCache cacheWithCell:[self getNormalCell:task]];
        cache.tag = task;
        
        [_cellCache addCache:cache];
        [cache addObserver:self forKeyPath:PATH_PROG options:0 context:nil];
    }
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    for(MyCellCache *cache in _cellCache.cells)
    {
        MyTask *task = cache.tag;
        [task start];
    }
}

-(void)dealloc{
    for(MyCellCache *cache in _cellCache.cells)
    {
        [cache removeObserver:self forKeyPath:PATH_PROG];
    }

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return _cellCache.cells.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
     return [_cellCache cellAtIndex:indexPath.row];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static int count = 0;
    count++;
    NSLog(@"TableView Height %d", count);
    return [_cellCache cellHeightAtIndex:indexPath.row];
}

//ViewModel中的KVO监听方法
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:PATH_PROG])
    {
        MyCellCache *cache = object;
        //通过tag获取Cell的数据对象
        MyTask *task = cache.tag;
        //获取Cell的index和在TableView中的IndexPath
        NSUInteger index = [_cellCache.cells indexOfObject:cache];
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
        
        //如果完成的话，需要切换到另一个Cell
        if (task.isCompleted)
        {
            //设置needsRefresh属性，代表需要刷新这个Cell
            cache.needsRefresh = YES;
            cache.cell = [self getCompletedCell:task];
            //调用reloadRowsAtIndexPaths命令TableView执行刷新
            [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        }
        else
        {
            //不需要切换Cell，直接修改当前Cell的内容
            NormalCell *normalCell = (NormalCell *)cache.cell;
            normalCell.ibProgress.progress = task.progress;
        }
    }
}


- (CompletedCell*)getCompletedCell:(MyTask*)task
{
    CompletedCell *myCell = [self.tableView dequeueReusableCellWithIdentifier:@"CompletedCell"];
    if (!myCell)
    {
        myCell = [CompletedCell new];
    }
    [myCell loadTask:task];
    return myCell;
}

- (NormalCell*)getNormalCell:(MyTask*)task
{
    NormalCell *myCell = [self.tableView dequeueReusableCellWithIdentifier:@"NormalCell"];
    if (!myCell)
    {
        myCell = [NormalCell new];
    }
    [myCell loadTask:task];
    return myCell;
}


@end

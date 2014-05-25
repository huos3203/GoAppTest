//
//  DownListViewController.m
//  GoAppTest
//
//  Created by huoshuguang on 14-5-24.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import "DownListViewController.h"
#import "AddTaskViewController.h"
#import "MyDownTask.h"
#import "MyDownCell.h"
#import "MyCompletedCell.h"
@interface DownListViewController ()

@end

@implementation DownListViewController
{
    NSMutableArray *taskArr;
}
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

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    taskArr = [NSMutableArray array];
}

- (IBAction)ibaRemoveTask:(id)sender {
    
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
     if(indexPath)
         [self removeTask:indexPath.row];
}

-(IBAction)backToMain:(UIStoryboardSegue *)segue
{
    AddTaskViewController *taskUrl = segue.sourceViewController;
    if (taskUrl.ibAddUrl.text.length) {
        //添加下载任务单元格
        NSString *downUrl = taskUrl.ibAddUrl.text;
       MyDownTask *newTask = [[MyDownTask alloc]initWithUrl:downUrl];
        [newTask start];
        
        [taskArr addObject:newTask];
        [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:taskArr.count - 1 inSection:0]] withRowAnimation:UITableViewRowAnimationAutomatic];
    }else{
        NSLog(@"您取消了添加任务！");
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
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return taskArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MyDownCell";
    static NSString *CellIdentifier2 = @"MyCompletedCell";
    
    UITableViewCell *retCell;
    MyDownTask *task =[taskArr objectAtIndex:indexPath.row];
    // Configure the cell...
    if (task.isCompleted) {
        MyCompletedCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier2 forIndexPath:indexPath];
        cell.ibCompletedUrl.text = task.url;
        if (task.Errmsg) {
            cell.ibDownMsg.text = task.Errmsg;
            cell.ibDownMsg.textColor = [UIColor redColor];
        }else{
            cell.ibDownMsg.text = [NSString stringWithFormat:@"下载完成(%@)",task.bytesTotal];
            cell.ibDownMsg.textColor = [UIColor blackColor];
        }
        retCell = cell;
    }else{
        MyDownCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        cell.ibDownUrl.text = task.url;
        cell.ibProgress.progress = task.progress;
        cell.ibByte.text = nil;

        [self tryUnboundCell:cell];
        [self boundCell:cell forTask:task];
        retCell = cell;
    }
    return retCell;
}

-(void)boundCell:(MyDownCell *)cell forTask:(MyDownTask *)task
{
        cell.boundData = task;
    [task addObserver:self forKeyPath:@"progress" options:NSKeyValueObservingOptionNew context:nil];
    [task addObserver:self forKeyPath:@"isCompleted" options:NSKeyValueObservingOptionNew context:nil];
}

-(void)tryUnboundCell:(MyDownCell*)cell
{
    if (cell.boundData) {
        MyDownTask *task = cell.boundData;
        [task removeObserver:self forKeyPath:@"progress"];
        [task removeObserver:self forKeyPath:@"isCompleted"];
    }
    
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"progress"]) {
        MyDownTask *task = (MyDownTask *)object;
        MyDownCell *cell = (MyDownCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:[taskArr indexOfObject:task] inSection:0]];
        cell.ibProgress.progress = task.progress;
        cell.ibByte.text = task.bytesProgress;
    }else if([keyPath isEqualToString:@"isCompleted"]){
        MyDownTask *task = (MyDownTask *)object;
        [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:[taskArr indexOfObject:task] inSection:0]] withRowAnimation:UITableViewRowAnimationAutomatic];
    }else{
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

-(void)removeTask:(int)index
{
    MyDownTask *task = [taskArr objectAtIndex: index];
    [task stop];
    [taskArr removeObjectAtIndex:index];
    [self.tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:index inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self removeTask:indexPath.row];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath) {
        self.ibTrashTask.enabled = YES;
    }
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end

//
//  myTableViewController.m
//  GoAppTest
//
//  Created by pengyucheng on 14-2-11.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import "myTableViewController.h"
#import "WeixinDialog.h"
#import "ImagePickerViewController.h"

@interface myTableViewController ()
{
    UIAlertView *_alert;                            //系统提示框
    WeixinDialog *_weixinDialog;            //自定义View 提示框
    CustomIOS7AlertView *_alertView;    //
    NSString *_strContent;
    UITextField *_messageLable;             //定义全局控件用来传递提示框中的控件值
}

@end

@implementation myTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(alertHiden:) name:@"alerthiden" object:nil];
}

//响应通知中心，关闭提示框
- (void)alertHiden:(NSNotification *)ntf
{
    if (_alertView!=nil) {
        [_alertView close];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
////#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 1;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
////#warning Incomplete method implementation.
//    // Return the number of rows in the section.
//    return 5;
//}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *CellIdentifier = @"Cell1";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
//    
//    // Configure the cell...
//    if (indexPath.row == 2) {
//        cell.textLabel.text = @"拍照";
//    }else{
//        cell.textLabel.text = [NSString stringWithFormat:@"I am is cell %d",indexPath.row];
//    }
//    return cell;
//}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        //测试提示框
        [self showDialog];
    }else if(indexPath.row == 1){
        //执行这句话的前提:shouldPerformSegueWithIdentifier:方法返回NO
        [self testPresentViewController];
    }else if(indexPath.row == 2){
        //调用系统拍照功能
        [self cameraAction:nil];
    }
}


#pragma mark 自定义customIOS7dialog提示框实例
-(void)showDialog
{
    // Here we need to pass a full frame
    _alertView = [[CustomIOS7AlertView alloc] init];
    
    // Add some custom content to the alert view
    [_alertView setContainerView:[self createDemoView]];
    
    // Modify the parameters
    [_alertView setButtonTitles:[NSMutableArray arrayWithObjects:@"Close1", nil]];
    [_alertView setDelegate:self];
    
    // You may use a Block, rather than a delegate.
    [_alertView setOnButtonTouchUpInside:^(CustomIOS7AlertView *alertView, int buttonIndex) {
        NSLog(@"Block: Button at position %d is clicked on alertView %d.", buttonIndex, [alertView tag]);
        [alertView close];
    }];
    
    [_alertView setUseMotionEffects:true];
    
    // And launch the dialog
    [_alertView show];


}

- (void)customIOS7dialogButtonTouchUpInside: (CustomIOS7AlertView *)alertView clickedButtonAtIndex: (NSInteger)buttonIndex
{
    NSLog(@"--%@", _messageLable.text);
    NSLog(@"Delegate: Button at position %d is clicked on alertView %d.", buttonIndex, [alertView tag]);
    [alertView close];
}

- (UIView *)createDemoView
{
    UIView *demoView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 190, 100)];
    
//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 270, 180)];
//    [imageView setImage:[UIImage imageNamed:@"demo"]];
     _messageLable= [[UITextField alloc] initWithFrame:CGRectMake(10, 10, 100, 50)];
//    messageLable.text = @"n3rrer";
//    messageLable.tag = 1;
    [demoView addSubview:_messageLable];
    
    return demoView;
}


#pragma mark segue常用的两个方法
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"paizhao"]){
    
        ImagePickerViewController *imagePicker = segue.destinationViewController;
        imagePicker.delegate = self;
    }

}

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    
    NSIndexPath *indexPath = nil;
    indexPath = [self.tableView indexPathForSelectedRow];
    if (indexPath.row == 0 || indexPath.row == 2) {
        return NO;
    }
    return YES;
}


#pragma mark 跳转界面的集中方式
-(void)testPresentViewController{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    // determine the initial view controller here and instantiate it with [storyboard instantiateViewControllerWithIdentifier:<storyboard id>];
    UIViewController *testViewContrl = [storyboard instantiateViewControllerWithIdentifier:@"testViewContrl"];
    
    //没有导航条
    [self presentViewController:testViewContrl animated:NO completion:nil];
}


#pragma mark 拍照事件
- (void)cameraAction:(UIButton *)btn
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        NSArray *temp_mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:picker.sourceType];
        picker.mediaTypes = temp_mediaTypes;
        
        picker.delegate = self;
        //picker.allowsEditing = YES;
    }
    [self presentViewController:picker animated:YES completion:nil];
}


-(void)viewWillDisappear:(BOOL)animated{
//    [_alert dismissWithClickedButtonIndex:0 animated:YES];
//    [[singletonAlertView sharedsingletonAlertView] dismissWithClickedButtonIndex:0 animated:YES];
}

- (void)viewWillAppear:(BOOL)animated{
//    [_alert dismissWithClickedButtonIndex:0 animated:YES];
//    [[singletonAlertView sharedsingletonAlertView] dismissWithClickedButtonIndex:0 animated:YES];
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

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

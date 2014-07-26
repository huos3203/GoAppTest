//
//  FirstVC.m
//  GoAppTest
//
//  Created by huoshuguang on 14-7-26.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import "FirstVC.h"
#import "secondVC.h"

@interface FirstVC ()

@end

@implementation FirstVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)ibaGO:(id)sender {
}

//
- (void)addSightingViewControllerDidCancel:(secondVC *)controller
{
    [controller dismissViewControllerAnimated:YES completion:NULL];
}

//- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    if ([[segue identifier] isEqualToString:@"ShowSightingsDetails"])
//    {
//        //当用户选择表视图中的一行时，触发**segue**事件，传输数据到目标视图控制器，使目标控制器上能显示`sighting`
//        secondVC *second = [segue destinationViewController];
////        detailViewController.sighting = [self.dataController objectInListAtIndex:[self.tableView indexPathForSelectedRow].row];
//    }
//    
//    if ([[segue identifier] isEqualToString:@"ShowAddSightingView"])
//    {
//        secondVC *second = [[[segue destinationViewController] viewControllers] objectAtIndex:0];
////        second.delegate = self;
//    }
//}

//
- (void)addSightingViewControllerDidFinish:(secondVC *)controller name:(NSString *)name location:(NSString *)location {
    if ([name length] || [location length]) {
//        [self.dataController addBirdSightingWithName:name location:location];
//        [[self tableView] reloadData];
        NSLog(@"放回%@***************%@",name,location);
//        _ibBackData.text = @"44444444444444";
        [_ibBackData setText:@"33333333333333"];
        [_ibGo setTitle:@"tttttt" forState:UIControlStateNormal];
    }
    [controller dismissViewControllerAnimated:YES completion:NULL];
}
@end

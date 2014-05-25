//
//  DownListViewController.h
//  GoAppTest
//
//  Created by huoshuguang on 14-5-24.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DownListViewController : UITableViewController



@property (weak, nonatomic) IBOutlet UIBarButtonItem *ibTrashTask;

- (IBAction)ibaRemoveTask:(id)sender;
-(IBAction)backToMain:(UIStoryboardSegue *)segue;
@end

//
//  AddTaskViewController.h
//  GoAppTest
//
//  Created by huoshuguang on 14-5-24.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddTaskViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *ibAddUrl;

- (IBAction)ibaSaveClick:(id)sender;

@end

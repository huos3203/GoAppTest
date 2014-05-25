//
//  AddTaskViewController.m
//  GoAppTest
//
//  Created by huoshuguang on 14-5-24.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import "AddTaskViewController.h"
#import "BlockUIAlertView.h"
@interface AddTaskViewController ()

@end

@implementation AddTaskViewController

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

- (IBAction)ibaSaveClick:(id)sender {
    
    if (_ibAddUrl.text.length) {
        [self performSegueWithIdentifier:@"backToMain" sender:self];
    }else{
        BlockUIAlertView *blAlert = [[BlockUIAlertView alloc] initWithTitle:@"提示" message:@"您还未输入内容!" cancelButtonTitle:@"确定" otherButtonTitles:nil buttonBlock:^(NSInteger index) {
            NSLog(@"没有输入下载地址");
        }];
        [blAlert show];
    }
}
@end

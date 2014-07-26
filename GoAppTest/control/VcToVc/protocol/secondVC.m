//
//  secondVC.m
//  GoAppTest
//
//  Created by huoshuguang on 14-7-26.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import "secondVC.h"
#import "FirstVC.h"
@interface secondVC ()

@end

@implementation secondVC
{
    FirstVC *first;
}

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
    first = [[FirstVC alloc] init];
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

- (IBAction)ibaCancel:(id)sender {
    
    [first addSightingViewControllerDidCancel:self];
}

- (IBAction)ibaOK:(id)sender {
    [first addSightingViewControllerDidFinish:self name:@"secondvc" location:@"dddddd"];
}
@end

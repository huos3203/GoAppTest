//
//  HMGLModalViewController.m
//  GoAppTest
//
//  Created by huoshuguang on 14-5-16.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import "HMGLModalViewController.h"

@interface HMGLModalViewController ()

@end

@implementation HMGLModalViewController

@synthesize delegate;
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

- (IBAction)ibaColseModalView:(id)sender {
    [delegate HMGLModalViewControllerDidfinish:self];
}
@end

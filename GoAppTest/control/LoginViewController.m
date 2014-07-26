//
//  LoginViewController.m
//  GoAppTest
//
//  Created by pengyucheng on 14-2-11.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import "LoginViewController.h"
#import <Crashlytics/Crashlytics.h>

@interface LoginViewController ()

@end

@implementation LoginViewController

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
//    UIDocumentInteractionController* docController = [UIDocumentInteractionController interactionControllerWithURL:nil];
    
//    docController.delegate = self;
//    [docController retain];
    
//    BOOL result = [docController presentPreviewAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goButton:(id)sender {
    
    if ([_pwd.text isEqualToString:@"1234"]) {
        NSLog(@"验证码正确%@",@"1234");
//        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//        
//        [self presentViewController:storyboard animated:YES completion:nil];
//        int *x = NULL;
//        *x = 42;
//        [[Crashlytics sharedInstance] crash];
        [self dismissViewControllerAnimated:YES completion:nil];
       
    }else{
        NSLog(@"NO,验证有误！");
    }
}

- (IBAction)showPwd:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (sender.selected) {
        _pwd.secureTextEntry = NO;
    }else{
        _pwd.secureTextEntry = YES;
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    NSLog(@"当前TextFile的值:%@",textField.text);
    _pwd.text = textField.text;
    [self goButton:nil];
    return YES;
}

@end

//
//  FirstViewController.m
//  GoAppTest
//
//  Created by huoshuguang on 14-5-24.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import "FirstViewController.h"
#import "PresentedViewController.h"
#import "BlockUIAlertView.h"
@interface FirstViewController ()

@end

@implementation FirstViewController

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

-(IBAction)backToMain:(UIStoryboardSegue*)segue
{
    //通过segue.sourceViewController返回执行这个Segue的ViewController也就是本例的PresentedViewController
    PresentedViewController *presentedVc = segue.sourceViewController;
    ButtonBlock block;
    if (presentedVc.isSaved) {
              block = ^(NSInteger i){
                   NSLog(@"您输入的文字：%@ ------",presentedVc.ibTextField.text);
                };
        }else{
                block = ^(NSInteger i){
                 NSLog(@"您取消了操作 ------");
                };
    
    }
    BlockUIAlertView *btnAlert = [[BlockUIAlertView alloc] initWithTitle:@"提示"
                                                                 message:[NSString stringWithFormat:@"您输入的文字是：%@",presentedVc.ibTextField.text]cancelButtonTitle:@"确定" otherButtonTitles:nil buttonBlock:block];
    [btnAlert show];

}
@end

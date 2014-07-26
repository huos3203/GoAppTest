 //
//  DetailViewController.m
//  GoAppTest
//
//  Created by huoshuguang on 14-7-26.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

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

//pop回上一个界面
- (IBAction)ibaDone:(id)sender {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(ChangeTitle:)]) {
        [self.delegate ChangeTitle:_ibTextField.text];
        NSLog(@"%@",self.navigationController.viewControllers);
        [self.navigationController popViewControllerAnimated:YES];
        
        //执行block方法
        NSString *str = [NSString stringWithFormat:@"%@",_ibTextField.text];
        _changetitle(str);
        
    }
}
@end

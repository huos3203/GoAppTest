//
//  RootViewController.m
//  GoAppTest
//
//  Created by huoshuguang on 14-7-26.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import "RootViewController.h"
#import "DetailViewController.h"
@interface RootViewController ()

@end

@implementation RootViewController

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
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.bounds = CGRectMake(0, 0, 25, 22);
    imageView.image = [UIImage imageNamed:@"tag_icon.png"];

    self.navigationItem.titleView = imageView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**/
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    DetailViewController *detail = [segue destinationViewController];
    detail.delegate = self;
    
    //初始化block方法
    detail.changetitle = ^(NSString *str){
    
        _ibLabel.text = str;
    };
}


-(void)ChangeTitle:(NSString *)title
{
    _ibTextField.text = title;
//    _ibLabel.text = title;
}
- (IBAction)ibaPushAction:(id)sender {
    
    
}
@end

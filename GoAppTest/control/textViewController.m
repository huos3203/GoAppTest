//
//  textViewController.m
//  GoAppTest
//
//  Created by pengyucheng on 14-2-12.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import "textViewController.h"

@interface textViewController ()

@end

@implementation textViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //注册通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleKeyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleKeyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (IBAction)hindeKey:(id)sender {
    
    UITextField *textt = [[UITextField alloc] init];
    [textt setReturnKeyType:UIReturnKeySend];
//    [textt re];
    
}

#pragma mark 键盘
- (void)handleKeyboardWillHide:(NSNotification *)notification
{
    if (doneInKeyboardButton.superview)
    {
        [doneInKeyboardButton removeFromSuperview];
    }
}

- (void)handleKeyboardDidShow:(NSNotification *)notification
{
    if (doneInKeyboardButton == nil)
    {
        doneInKeyboardButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        CGFloat screenHeight = [[UIScreen mainScreen] bounds].size.height;
        if(screenHeight==568.0f){//爱疯5
            doneInKeyboardButton.frame = CGRectMake(242, 568 - 43, 75, 40);
        }else{//3.5寸
            doneInKeyboardButton.frame = CGRectMake(242, 480 - 43, 75, 40);
        }
        
        doneInKeyboardButton.adjustsImageWhenHighlighted = NO;
        //图片直接抠腾讯财付通里面的= =!
        [doneInKeyboardButton setBackgroundImage:[UIImage imageNamed:@"btn_done_down@2x.png"] forState:UIControlStateNormal];
//        [doneInKeyboardButton setBackgroundImage:[UIImage imageNamed:@"btn_done_down@2x.png"] forState:UIControlStateHighlighted];
        [doneInKeyboardButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [doneInKeyboardButton setTitle:@"进入" forState:UIControlStateNormal];
        
        [doneInKeyboardButton addTarget:self action:@selector(finishAction) forControlEvents:UIControlEventTouchUpInside];
    }
    
    
    UIWindow* tempWindow = [[[UIApplication sharedApplication] windows] objectAtIndex:1];
    
    if (doneInKeyboardButton.superview == nil)
    {
        [tempWindow addSubview:doneInKeyboardButton];    // 注意这里直接加到window上
    }
    
}
-(void)finishAction{
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];//关闭键盘
}
@end

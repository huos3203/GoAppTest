//
//  LoginViewController.h
//  GoAppTest
//
//  Created by pengyucheng on 14-2-11.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *pwd;

- (IBAction)goButton:(id)sender;

- (IBAction)showPwd:(UIButton *)sender;

@end

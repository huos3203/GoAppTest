//
//  PresentedViewController.h
//  GoAppTest
//
//  Created by huoshuguang on 14-5-24.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PresentedViewController : UIViewController


@property (weak, nonatomic) IBOutlet UITextField *ibTextField;
//判断是否是点击确定后返回的主ViewController
@property(nonatomic,assign)BOOL isSaved;

- (IBAction)ibaOkClick:(id)sender;

@end

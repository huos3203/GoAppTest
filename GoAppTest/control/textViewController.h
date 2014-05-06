//
//  textViewController.h
//  GoAppTest
//
//  Created by pengyucheng on 14-2-12.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface textViewController : UIViewController
{
    
    UIButton *doneInKeyboardButton;
}
@property (weak, nonatomic) IBOutlet UITextField *text1;
@property (weak, nonatomic) IBOutlet UITextField *text2;

- (IBAction)hindeKey:(id)sender;
@end

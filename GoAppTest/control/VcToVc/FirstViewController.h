//
//  FirstViewController.h
//  GoAppTest
//
//  Created by huoshuguang on 14-5-24.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController


//回到主ViewController的Unwind Segue
-(IBAction)backToMain:(UIStoryboardSegue*)segue;

@property (strong, nonatomic) IBOutlet UILabel *ibTextKit;
@end

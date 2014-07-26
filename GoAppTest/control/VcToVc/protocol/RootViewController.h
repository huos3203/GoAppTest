//
//  RootViewController.h
//  GoAppTest
//
//  Created by huoshuguang on 14-7-26.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"

@interface RootViewController : UIViewController<ChangeDelegate>


@property (weak, nonatomic) IBOutlet UITextField *ibTextField;
@property (weak, nonatomic) IBOutlet UILabel *ibLabel;

- (IBAction)ibaPushAction:(id)sender;

@end


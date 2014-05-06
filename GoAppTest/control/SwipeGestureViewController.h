//
//  SwipeGestureViewController.h
//  GoAppTest
//
//  Created by huoshuguang on 14-4-21.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SwipeGestureViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *swipeGesture;
- (IBAction)swipeGuesture:(UISwipeGestureRecognizer *)sender;
@property (weak, nonatomic) IBOutlet UISwipeGestureRecognizer *swipGest;
@end

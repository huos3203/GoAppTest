//
//  HMGLTransitionsViewController.h
//  GoAppTest
//
//  Created by huoshuguang on 14-5-16.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HMGLModalViewController.h"
#import "HMGLTransitionManager.h"
@interface HMGLTransitionsViewController : UITableViewController<HMGLModalViewControllerDelegate,UITableViewDataSource,UITableViewDelegate>
{
    HMGLTransition *transition;
    NSArray *transitionArray;
    NSArray *transitionNameArr;
    NSInteger selectedTransitionIdx;
    
}


@property (strong, nonatomic) IBOutlet UIView *view1;
@property(strong,nonatomic)    UIView *view2;

@property (weak, nonatomic) IBOutlet UIButton *ibTransition;
@property (weak, nonatomic) IBOutlet UIButton *ibTransition2;

- (IBAction)ibaTransition:(id)sender;

-(IBAction)ibaTransition2:(id)sender;
@end

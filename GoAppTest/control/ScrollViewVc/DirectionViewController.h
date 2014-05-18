//
//  DirectionViewController.h
//  GoAppTest
//
//  Created by huoshuguang on 14-4-24.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DirectionViewController : UIViewController<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *ibImgScrollview;
@property (weak, nonatomic) IBOutlet UIPageControl *ibPagecontrol;

@property (weak, nonatomic) IBOutlet UITableView *ibTableView;

- (IBAction)doubleTap:(id)sender;
@property (strong, nonatomic) IBOutlet UIScrollView *ibImageScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *ibImageScrollViewSub;
@end

//
//  NormalCell.h
//  GoAppTest
//
//  Created by huoshuguang on 14-5-22.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyTask.h"
@interface NormalCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIProgressView *ibProgress;
@property (weak, nonatomic) IBOutlet UILabel *ibTitle;

- (void)loadTask:(MyTask*)task;
@end

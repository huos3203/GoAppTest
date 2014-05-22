//
//  MyCell.h
//  GoAppTest
//
//  Created by huoshuguang on 14-5-22.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *ibTitle;
@property (weak, nonatomic) IBOutlet UIProgressView *ibProgress;
@property (weak, nonatomic) IBOutlet UIButton *ibBtn;
- (IBAction)ibaBtn:(id)sender;
@end

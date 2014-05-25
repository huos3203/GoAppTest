//
//  MyDownCell.h
//  GoAppTest
//
//  Created by huoshuguang on 14-5-24.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyDownCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UILabel *ibDownUrl;

@property (weak, nonatomic) IBOutlet UIProgressView *ibProgress;

@property (weak, nonatomic) IBOutlet UILabel *ibByte;


@property (nonatomic, strong) id boundData;
@end

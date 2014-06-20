//
//  SvGifViewViewController.h
//  GoAppTest
//
//  Created by huoshuguang on 14-5-31.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SvGifView.h"
@interface SvGifViewViewController : UIViewController

@property (strong, nonatomic) IBOutlet SvGifView *ibGifView;
@property (strong, nonatomic) IBOutlet SvGifView *ibGifViewXib;
@property (strong, nonatomic) IBOutlet UIView *ibSvGifViewXib;
@end

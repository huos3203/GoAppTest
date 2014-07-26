//
//  FirstVC.h
//  GoAppTest
//
//  Created by huoshuguang on 14-7-26.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import <UIKit/UIKit.h>
@class secondVC;
@interface FirstVC : UIViewController

- (IBAction)ibaGO:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *ibGo;

@property (weak, nonatomic) IBOutlet UILabel *ibBackData;

- (void)addSightingViewControllerDidCancel:(secondVC *)controller;

- (void)addSightingViewControllerDidFinish:(secondVC *)controller name:(NSString *)name location:(NSString *)location;

@end

@protocol firstVcDelegate



@end
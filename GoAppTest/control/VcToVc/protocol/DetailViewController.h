//
//  DetailViewController.h
//  GoAppTest
//
//  Created by huoshuguang on 14-7-26.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^ChangeTitle)(NSString *);

@protocol ChangeDelegate <NSObject>


-(void)ChangeTitle:(NSString *)title;

@end


@interface DetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *ibTextField;

@property(nonatomic,assign)id<ChangeDelegate> delegate;

@property(nonatomic,strong)ChangeTitle changetitle;

- (IBAction)ibaDone:(id)sender;


@end



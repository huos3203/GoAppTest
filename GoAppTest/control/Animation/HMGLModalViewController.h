//
//  HMGLModalViewController.h
//  GoAppTest
//
//  Created by huoshuguang on 14-5-16.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol HMGLModalViewControllerDelegate;



@interface HMGLModalViewController : UIViewController
{
//    id<HMGLModalViewControllerDelegate> delegate;
}

@property (nonatomic,assign)id<HMGLModalViewControllerDelegate> delegate;

- (IBAction)ibaColseModalView:(id)sender;


@end


@protocol HMGLModalViewControllerDelegate <NSObject>

-(void)HMGLModalViewControllerDidfinish:(HMGLModalViewController*) HMGLModalViewController;

@end
//
//  BlockUIAlertView.h
//  GoAppTest
//
//  Created by huoshuguang on 14-5-18.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ButtonBlock)(NSInteger);

@interface BlockUIAlertView : UIAlertView


@property(nonatomic,copy)ButtonBlock block;

-(id)initWithTitle:(NSString *)title
                                    message:(NSString *)message
                                     delegate:(id)delegate
                        cancelButtonTitle:(NSString *)cancelButtonTitle
                        otherButtonTitles:(NSString *)otherButtonTitles
                                buttonBlock:(ButtonBlock)block;
@end

//
//  BlockUIAlertView.m
//  GoAppTest
//
//  Created by huoshuguang on 14-5-18.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import "BlockUIAlertView.h"

@implementation BlockUIAlertView

-(id)initWithTitle:(NSString *)title
           message:(NSString *)message
          delegate:(id)delegate
 cancelButtonTitle:(NSString *)cancelButtonTitle
 otherButtonTitles:(NSString *)otherButtonTitles
       buttonBlock:(ButtonBlock)block
{
    self = [super initWithTitle:title message:message delegate:delegate cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitles, nil];
    if (self) {
        self.block = block;
    }
    return self;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    _block(buttonIndex);
}

@end

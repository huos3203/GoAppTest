//
//  WeixinDialog.h
//  PBB
//
//  Created by pycnyp on 13-12-30.
//  Copyright (c) 2013年 pyc.com.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeixinDialog : UIView

@property (weak, nonatomic) IBOutlet UITextView *contentTextView;
- (IBAction)hideDialog:(UIButton *)sender;
- (IBAction)changeBtn:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *changeBtn;
@end

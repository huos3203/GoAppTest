//
//  WeixinDialog.m
//  PBB
//
//  Created by pycnyp on 13-12-30.
//  Copyright (c) 2013年 pyc.com.cn. All rights reserved.
//

#import "WeixinDialog.h"

@implementation WeixinDialog

- (id)init
{
    self = [[NSBundle mainBundle] loadNibNamed:@"WeixinDialog" owner:nil options:nil][0];
//    self.backgroundColor = [UIColor colorWithRed:240.0/255.0 green:239.0/255.0 blue:244.0/255.0 alpha:1.0];
//    _contentTextView.backgroundColor = [UIColor colorWithRed:240.0/255.0 green:239.0/255.0 blue:244.0/255.0 alpha:1.0];
    UIImage *shareNormal = [UIImage imageNamed:@"btn_selected2.png"];
    [_changeBtn setBackgroundImage:shareNormal forState:UIControlStateNormal];
    [_changeBtn setBackgroundImage:[UIImage imageNamed:@"btn_selected1.png"] forState:UIControlStateSelected];
    _contentTextView.editable = NO;
    // 2.5.高亮状态下不要改变图片颜色
    _changeBtn.adjustsImageWhenHighlighted = NO;
    _changeBtn.selected = NO;
    
    return self;
}



- (IBAction)hideDialog:(UIButton *)sender {
    [[NSUserDefaults standardUserDefaults]setBool:_changeBtn.selected forKey:@"btn"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    [UIView animateWithDuration:.4 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        self.hidden = YES;
    }];
    NSString *str =@"weixin://qr/pengbaobao1212";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
}

- (IBAction)changeBtn:(UIButton *)sender {
    
    sender.selected = ! sender.isSelected;
}
@end

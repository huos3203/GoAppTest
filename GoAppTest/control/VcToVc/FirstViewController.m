//
//  FirstViewController.m
//  GoAppTest
//
//  Created by huoshuguang on 14-5-24.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import "FirstViewController.h"
#import "PresentedViewController.h"
#import "BlockUIAlertView.h"
@interface FirstViewController ()

@end

@implementation FirstViewController
{
    NSTextContainer * _textContainer;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //text kit
    NSTextStorage *textStorage = [[NSTextStorage alloc] initWithString:_ibTextKit.text];
    NSLayoutManager* layoutManager = [[NSLayoutManager alloc] init];
    
    [textStorage addLayoutManager:layoutManager];
    _textContainer = [[NSTextContainer alloc] initWithSize:_ibTextKit.frame.size];
    [layoutManager addTextContainer:_textContainer];
    
    [_ibTextKit removeFromSuperview];
    _ibTextKit = [[UILabel alloc] initWithFrame:_ibTextKit.frame];
    
    [self.view addSubview:_ibTextKit];
  
    //设置凸版印刷效果
    [textStorage beginEditing];
    
    NSDictionary *attrsDic = @{NSTextEffectAttributeName: NSTextEffectLetterpressStyle};
    
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:
                                          _ibTextKit.text attributes:attrsDic];
    
    [textStorage setAttributedString:attrStr];
    
//    [self markWord:@"我" inTextStorage:textStorage];
//    [self markWord:@"I" inTextStorage:textStorage];
    
    [textStorage endEditing];
    
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(preferredContentSizeChanged:)
                                                 name:UIContentSizeCategoryDidChangeNotification
                                               object:nil];
}

- (void)preferredContentSizeChanged:(NSNotification *)notification
{
    self.ibTextKit.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)backToMain:(UIStoryboardSegue*)segue
{
    //通过segue.sourceViewController返回执行这个Segue的ViewController也就是本例的PresentedViewController
    PresentedViewController *presentedVc = segue.sourceViewController;
    ButtonBlock block;
    if (presentedVc.isSaved) {
              block = ^(NSInteger i){
                   NSLog(@"您输入的文字：%@ ------",presentedVc.ibTextField.text);
                };
        }else{
                block = ^(NSInteger i){
                 NSLog(@"您取消了操作 ------");
                };
    
    }
    BlockUIAlertView *btnAlert = [[BlockUIAlertView alloc] initWithTitle:@"提示"
                                                                 message:[NSString stringWithFormat:@"您输入的文字是：%@",presentedVc.ibTextField.text]cancelButtonTitle:@"确定" otherButtonTitles:nil buttonBlock:block];
    [btnAlert show];

}
@end

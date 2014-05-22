//
//  AutoLayoutViewController.m
//  GoAppTest
//
//  Created by huoshuguang on 14-5-22.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import "AutoLayoutViewController.h"

@interface AutoLayoutViewController ()

@end

@implementation AutoLayoutViewController

{
    UIButton *_btn;
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
    
    
    /*
     首先说按比例缩放，这是在Interface Builder中无法设置的内容。
     而在代码中，使用NSLayoutConstraint类型的初始化函数中的multiplier参数就可以非常简单的设置按比例缩放。
     同时也可以设置不同NSLayoutAttribute参数来达到意想不到的效果，比如“A的Width等于B的Height的2倍”这样的效果。
     实例实现功能点:
        1.命令这个Button水平居中，始终距离父View底部20单位的距离。然后高度是父View高度的三分之一。
         2.最后使用KVO来监控Button的大小并实时输出到屏幕上。
     
     新需求:
        在横向的显示中，Button的高度只有96，觉得太短了，要求Button的最小高度为150。
         这样的话，需要加入另一个限制大小的Constraint，但是这两个Constraint在某些情况下是有冲突的，
         我们可以通过设置Constraint的优先级来解决。
     
     优先级对应NSLayoutConstraint类型的priority属性，
        默认值是UILayoutPriorityRequired，数值上等于1000. 设置一个低的值代表更低的优先级。
     
     另外对于最小值的定义，使用NSLayoutRelationGreaterThanOrEqual作为NSLayoutConstraint类型创建时的relatedBy参数。
     */
    //创建UIButton，不需要设置frame
    _btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_btn setTitle:@"" forState:UIControlStateNormal];
    [_btn setBackgroundColor:[UIColor greenColor]];
    [self.view addSubview:_btn];
    
    //禁止在自动布局约束Constraints中，自动转换AutoresizingMask的功能
    _btn.translatesAutoresizingMaskIntoConstraints = NO;
    
    //居中
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_btn
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1
                                                           constant:0]];
    
    //距离底部20单位
    //注意NSLayoutConstraint创建的constant是加在toItem参数的，所以需要-20。
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_btn
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1
                                                           constant:-20]];
    //定义高度是父view高度的3/1
    //设置优先级低于UILayoutPriorityRequired(1000)，UILayoutPriorityDefaultHigh是750
    NSLayoutConstraint *con = [NSLayoutConstraint constraintWithItem:_btn
                                                           attribute:NSLayoutAttributeHeight
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:self.view
                                                           attribute:NSLayoutAttributeHeight
                                                          multiplier:0.3
                                                            constant:0];
    //设置优先级
    con.priority = UILayoutPriorityDefaultHigh;
    [self.view addConstraint:con];
    
    //设置按钮的最小高度为150
    [_btn addConstraint:[NSLayoutConstraint constraintWithItem:_btn
                                                     attribute:NSLayoutAttributeHeight
                                                     relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                     toItem:nil
                                                     attribute:NSLayoutAttributeNotAnAttribute
                                                     multiplier:0
                                                     constant:150]];
    //注册KVO的方法
    [_btn addObserver:self forKeyPath:@"bounds" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionInitial context:nil];
}

//KVO回调
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (object ==_btn && [keyPath isEqualToString:@"bounds"]) {
        [_btn setTitle:NSStringFromCGSize(_btn.bounds.size) forState:UIControlStateNormal];
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

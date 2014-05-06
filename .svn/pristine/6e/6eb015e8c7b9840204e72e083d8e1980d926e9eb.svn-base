//
//  SwipeGestureViewController.m
//  GoAppTest
//
//  Created by huoshuguang on 14-4-21.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import "SwipeGestureViewController.h"

@interface SwipeGestureViewController ()

@end

@implementation SwipeGestureViewController

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
    
    //设置滑屏控制
    for (int i =0 ; i<4; i++) {
        
        // 设置该手势处理器只处理i 个手指的轻扫手势
        self.swipGest.numberOfTouchesRequired = 1;
        
        // 指定该手势处理器只处理1 << i 方向的轻扫手势
        self.swipGest.direction = 1 << i;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)swipeGuesture:(UISwipeGestureRecognizer *)sender {

    NSLog(@"滑动");
    
    //获取手势的方向
    NSUInteger direction = sender.direction;
    
    //根据手势的方向值，得到方向字符串
    
    NSString *gestDirection = direction == UISwipeGestureRecognizerDirectionLeft ? @"向左" :(direction == UISwipeGestureRecognizerDirectionRight ? @"向右" : (direction == UISwipeGestureRecognizerDirectionUp?@"向上":@"向下"));
    
    //获取手指的个数
    NSUInteger fingerNum = sender.numberOfTouchesRequired;
    
    self.swipeGesture.text = [NSString stringWithFormat:@"手势方向:%@>>>,划动手指数:%d",gestDirection,fingerNum];
    
    //指定2秒后清除 label
    [self.swipeGesture performSelector:@selector(setText:) withObject:@"" afterDelay:2];
    
    
    
  
    
    
    
    
    
    
    
    
}
@end

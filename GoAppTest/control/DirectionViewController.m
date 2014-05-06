//
//  DirectionViewController.m
//  GoAppTest
//
//  Created by huoshuguang on 14-4-24.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import "DirectionViewController.h"

@interface DirectionViewController ()

@end

@implementation DirectionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGFloat width = self.view.frame.size.width;
    _ibImgScrollview.contentSize = CGSizeMake(3*width, self.view.frame.size.height);
    for (int i =0; i<3; i++) {
        UIImageView *containView = [[UIImageView alloc] init];
        containView.frame = CGRectMake(width*i, 0, width, self.view.frame.size.height);
        [containView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"new_feature_%d.png",i+1]]];
        [_ibImgScrollview addSubview:containView];
    }

    NSLog(@"加载完成");
}


-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    NSLog(@"滑动。。。。。");
    _ibPagecontrol.currentPage = scrollView.contentOffset.x / scrollView.frame.size.width;

}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
        NSLog(@"滑动。。。。。1111");
    _ibPagecontrol.currentPage = scrollView.contentOffset.x / scrollView.frame.size.width;
}
@end

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
{
    NSArray *tableArr;
    NSMutableArray *imgScrollArr;
}
@synthesize ibImageScrollView,ibImageScrollViewSub;
- (void)viewDidLoad
{
    [super viewDidLoad];
    _ibImgScrollview.contentSize = CGSizeMake(3*320, 160);
    
    int _x=0;
    imgScrollArr = [[NSMutableArray alloc] init];
    for (int i = 0; i<3; i++) {
        //加载在独立Xib文件中自定义的控件scrollview ，下文简称为:独立scrollview
        NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"ImageScrollView" owner:self options:nil];
        UIView *containView =[nibView objectAtIndex:0];
        //设置独立srollview的子控件imageView
        [ibImageScrollViewSub setImage:[UIImage imageNamed:[NSString stringWithFormat:@"new_feature_%d.png",i+1]]];
        containView.frame = CGRectMake(0 +_x, 0, 320, 160);
        containView.tag = i;
        [_ibImgScrollview addSubview: containView];
        
        //分页视图，水平的位移值
        _x += 320;
        [imgScrollArr addObject:ibImageScrollView];
    }
    //    _ibImgScrollview = ibImageScrollView;

    tableArr = [NSArray arrayWithObjects:@"表格1",@"表格2",@"表格3",@"表格4" ,@"表格5",nil];
    NSLog(@"加载完成");
}


#pragma mark TableDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableArr count];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"Cell";
    UITableViewCell *mycell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (mycell==nil) {
        mycell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    mycell.textLabel.text = [tableArr objectAtIndex:indexPath.row];
    return mycell;
}

//当前视图页的下标
int pre = 0;
#pragma mark - UIScrollView Delegate
//拖动减速调用该方法
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //根据主scrollview的偏移量，计算当前下标
    int current = _ibImgScrollview.contentOffset.x / 320;
    //根据下标，从主scrollview中获取独立scrollview控件
    UIScrollView * imgScrollView= (UIScrollView *)[scrollView viewWithTag:pre];
   //判断是否是当前页，判断独立scrollview是否被缩放过
    if (pre!=current && imgScrollView.zoomScale>1) {
        imgScrollView.zoomScale = 1;
    }
    _ibPagecontrol.currentPage = current;
    pre = current;
}


-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    //返回独立scrollview进行缩放过程中的子控件imageView
    return [[[imgScrollArr objectAtIndex:pre]subviews] objectAtIndex:0];
}

//双击独立scrollview 时，调用该方法
- (IBAction)doubleTap:(id)sender {
    UITapGestureRecognizer *tapGesture = (UITapGestureRecognizer*)sender;
    //获取到当前页面的独立scrollview控件，进行缩放操作
    UIScrollView *currentScrollView = [imgScrollArr objectAtIndex:pre];
    if (currentScrollView.zoomScale >= 2.5) {
        [currentScrollView setZoomScale:1 animated:YES];
    }else {
        CGPoint point = [tapGesture locationInView:currentScrollView];
        [currentScrollView zoomToRect:CGRectMake(point.x - 40, point.y - 40, 50, 50) animated:YES];
    }
}
@end

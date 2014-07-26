//
//  DirectionViewController.m
//  GoAppTest
//
//  Created by huoshuguang on 14-4-24.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import "DirectionViewController.h"
#import "MyCell.h"

@interface DirectionViewController ()

@end

@implementation DirectionViewController
{

    NSMutableArray *imgScrollArr;
    
    //测试数据源
    NSMutableArray *_dataSource;
    //缓存Cell
    NSMutableDictionary *_cellCache;
    
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
        NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"ImageÏScrollView" owner:self options:nil];
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

    //viewDidLoad 初始化
    _dataSource = [NSMutableArray arrayWithArray:@[@"Mgen", @"Tony", @"Jerry", @"一二三"]];
    _cellCache = [NSMutableDictionary dictionary];
}


#pragma mark TableDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataSource count];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


/*
 iOS 7和iOS 6中的许多控件默认高度都是不一样的，在其他普通UIView下，有了Autolayout，控件当然会正确显示。
 但是UITableViewCell的高度是通过UITableView的heightForRowAtIndexPath方法来返回的。默认情况下，它是保持不变的。
 所以当Cell内控件的高度发生变化后，如果Cell高度没有因此而作出调整，肯定会出问题的。
 
 为了解决问题，我们必须在TableView的heightForRowAtIndexPath方法中返回根据Cell内容计算出来的动态高度，而为了知道使用Autolayout后的Cell的动态高度，我们必须先调用cellForRowAtIndexPath协议方法创建这个Cell。
 
 heightForRowAtIndexPath和cellForRowAtIndexPath两个方法的被调用的关系：
    1. 假设总共会由100个Cell。只有20个Cell是显示的，那么TableView会调用100次heightForRowAtIndexPath，然后调用20次cellForRowAtIndexPath。
    2. 因为必须通过调用全部Cell的heightForRowAtIndexPath才可以知道总共的高度，这样TableView的滚动条才可以被确定，确定好滚动条后，只有具体显示的Cell之后才会被调用cellForRowAtIndexPath。

    3. 同时，如果对任何Cell进行刷新操作，TableView会继续调用100次heightForRowAtIndexPath，然后对需要刷新的Cell再单独调用cellForRowAtIndexPath。
 
 思路分析:
     1. 在heightForRowAtIndexPath和cellForRowAtIndexPath中同时调用dequeueReusableCellWithIdentifier方法，同时把Cell初始化逻辑写两处（当然也可以写在一个函数里共用）。
         注意:如果在heightForRowAtIndexPath中使用dequeueReusableCellWithIdentifier，那么全部的Cell都会被创建，这样以来完全可以把一个Cell绑定在一个数据上，就不存在Cell的复用和数据的切换问题了。
         这里注意不要混淆，在heightForRowAtIndexPath中我们必须使用dequeueReusableCellWithIdentifier方法，这样的话，如果一共有100个Cell，无论TableView怎样刷新，我们始终会复用这100个Cell的。
 
 结论:
     2. 在heightForRowAtIndexPath中使用dequeueReusableCellWithIdentifier来获取Cell并返回Cell的动态高度，接着根据IndexPath缓存这个Cell，最后在cellForRowAtIndexPath中直接使用这个Cell，因为在cellForRowAtIndexPath方法调用前，全部Cell都会被调用heightForRowAtIndexPath的。
 
 细节注意点:
     1. 比如如果在heightForRowAtIndexPath调用dequeueReusableCellWithIdentifier:forIndexPath:方法的话，会出现栈溢出问题.也就是说dequeueReusableCellWithIdentifier:forIndexPath:会反过来调用heightForRowAtIndexPath方法。
     2. 那么我们可以使用旧的dequeueReusableCellWithIdentifier方法，也就是没有IndexPath参数的，这个是可以使用的，当然使用dequeueReusableCellWithIdentifier的话，我们需要手动判断Cell返回nil的情况。
 */


//在heightForRowAtIndexPath中执行画龙点睛一笔，使用systemLayoutSizeFittingSize方法来计算创建Cell的高度并返回
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //获取Cell
    MyCell *cell = [self getCellFromIndexPath:indexPath];
    
    //缓存Cell
    [_cellCache setObject:cell forKey:@(indexPath.row)];
    
    //更新UIView的layout过程和Autolayout
    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];
    [cell.contentView setNeedsLayout];
    [cell.contentView layoutIfNeeded];
    
    //通过systemLayoutSizeFittingSize返回最低高度
    CGFloat height = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    return height;
}

/*
    接着在cellForRowAtIndexPath方法内重用缓存的Cell
 （代码里还有如果没有缓存再次调用创建Cell的逻辑，不过目前觉得没这种可能性，因为heightForRowAtIndexPath方法发生在cellForRowAtIndexPath方法之前）
 */
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //获取缓存的Cell
    MyCell *cachedCell = [_cellCache objectForKey:@(indexPath.row)];
    //如果没有缓存再次调用getCellFromIndexPath来创建Cell
    if (!cachedCell)
    {
        return [self getCellFromIndexPath:indexPath];
    }
    return cachedCell;
}

/*
    把创建Cell逻辑写在一个方法内
 */
- (MyCell*)getCellFromIndexPath:(NSIndexPath*)indexPath
{
    static NSString *CellIdentifier = @"MyCell";
    //注意在heightForRowAtIndexPath:indexPath无法使用dequeueReusableCellWithIdentifier:forIndexPath:
    MyCell *cell = [_ibTableView dequeueReusableCellWithIdentifier:CellIdentifier];
    //用dequeueReusableCellWithIdentifier:就得判断Cell为nil的情况
    if (!cell)
    {
        cell = [[MyCell alloc] init];
    }
    
    //这里把数据设置给Cell
    cell.ibTitle.text = [_dataSource objectAtIndex:indexPath.row];
    
    return cell;
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

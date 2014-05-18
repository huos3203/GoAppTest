//
//  AnimationViewController.m
//  GoAppTest
//
//  Created by huoshuguang on 14-5-16.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import "AnimationViewController.h"

@interface AnimationViewController ()

@end

@implementation AnimationViewController
{
    UIView *view1;
    UIView *view2;
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
//    UIScrollView
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    view1 = [[UIView alloc] initWithFrame:self.animationView.frame];
    view2 = [[UIView alloc] initWithFrame:self.animationView.frame];
    view1.backgroundColor = [UIColor blueColor];
    view2.backgroundColor = [UIColor redColor];
    [self.animationView addSubview:view1];
    [self.animationView addSubview:view2];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (IBAction)ibAnimationBtn:(id)sender {
 
//    [self blockAnimation];
    
//    [self UIViewAnimation];
    
//    [self TestCatransition];
    [self testUIImageViewAnimation];
}


//block动画
-(void)blockAnimation
{
    [UIView animateWithDuration:2.0 animations:^{
        self.view.alpha = 0;
        self.view.transform = CGAffineTransformScale(self.view.transform, 0.1, .01);
    } completion:^(BOOL finished) {
        if (finished) {
            [UIView animateWithDuration:1 animations:^{
                self.view.alpha = 1;
                self.view.transform = CGAffineTransformIdentity;
            }];
        }
        NSLog(@"动画执行完成！");
    }];
}

//UIView动画
-(void)UIViewAnimation
{
    //动画开始
    [UIView beginAnimations:nil context:nil];
    //设置动画类型
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    //
    [UIView setAnimationDuration:2.0];
    //设置代理
    [UIView setAnimationDelegate:self];

    //动画完成后，自动执行日志打印操作
    [UIView setAnimationDidStopSelector:@selector(printLog)];
    
    //UIview 按比例缩放1/2
    self.animationView.transform = CGAffineTransformScale(self.animationView.transform, 0.5, 0.5);
    //旋转90度
    self.animationView.transform = CGAffineTransformMakeRotation(3.14/2);

    //视图切换过渡动画
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.animationView cache:YES];
    [self.animationView exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    //动画结束
    [UIView commitAnimations];
}

-(void)printLog
{
    NSLog(@"动画完成！");
}

//视图切换动画
-(void)TestCatransition
{
    CATransition *animation = [CATransition animation];
    animation.delegate = self;          //设置代理
    animation.duration = 2.0;           //设置动画持续时长
//     animation.timingFunction = [CAMediaTimingFunction functionWithName:@"easeInEaseOut"];
    animation.timingFunction = UIViewAnimationCurveEaseInOut;       //开始和结束时的动画效果比较慢
    
    //动画类型
    animation.type = kCATransitionReveal;
    animation.subtype = kCATransitionFromLeft;
    //parentView 执行动画的时，调用两个视图的位置，以达到视图切换的动画效果
    [self.animationView exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    //给视图添加动画
    
    [[self.animationView layer] addAnimation:animation forKey:@"animation"];
    //导航控制器添加切换动画
    [[self.navigationController.view layer] addAnimation:animation forKey:@"animation"];
}

//UIImageView动画
-(void)testUIImageViewAnimation
{
    UIImage *image1 = [UIImage imageNamed:@"new_feature_1.png"];
    UIImage *image2 = [UIImage imageNamed:@"new_feature_2.png"];
    UIImage *image3 = [UIImage imageNamed:@"new_feature_3.png"];
    NSArray *imgArr = [[NSArray alloc] initWithObjects:image1,image2,image3, nil];
    UIImageView *imgView= [[UIImageView alloc] initWithImage:image1];
    
    imgView.frame = CGRectMake(10, 50, 300, 300);
    [self.view addSubview:imgView];
    imgView.animationImages = imgArr;
    imgView.animationDuration = 2;
    [imgView startAnimating];
}

-(void)testAnimation
{


}



- (IBAction)ibaUIKit_CG:(id)sender {
}

/*
//自定义试图绘制
1.线条；路径（线条，弧线，矩形，圆角矩形，椭圆）；文本；图片；渐变
*/
//绘制矩形图形
-(void)drawRect:(CGRect)rect
{
    [[UIColor redColor] setFill];
    UIRectFill(CGRectMake(rect.origin.x + 10, rect.origin.y + 10, 100, 100));
}

//形状缩放填充视图的实例
-(void)drawPaths:(CGRect)rect
{
    CGSize size = self.view.bounds.size;
    CGFloat margin = 10;
    /*
     rint();四舍五入来确保点对齐（这样像素就会对齐）
     */
    CGFloat radius = rint(MIN(size.height - margin, size.width - margin)/4);    //圆角弧度
    CGFloat xOffset,yOffset;
    CGFloat offset = rint((size.height - size.width)/2);
    if (offset > 0) {
        xOffset = rint(margin / 2);
        yOffset = offset;
    }
    else
    {
        xOffset = -offset;
        yOffset = rint(margin/2);
    }
    [[UIColor redColor] setFill];
    UIBezierPath *path = [UIBezierPath bezierPath];
    /*
     弧线使用顺时针角度：0弧度指向右边，
     M_PI  (π) ：                                 π/-π 弧度指向左边
     M_PI_2 (π/2) ：π/2 ，-π/2          弧度指向下方
    3π/2 ：                                         弧度指向上方 也可表示为-M_PI_2
     */
    [path addArcWithCenter:CGPointMake(radius*2+xOffset, radius + yOffset) radius:radius startAngle:-M_PI endAngle:0 clockwise:YES];
    [path addArcWithCenter:CGPointMake(radius*3 + xOffset, radius*2 + yOffset) radius:radius startAngle:-M_PI_2 endAngle:M_PI_2 clockwise:YES];
    [path addArcWithCenter:CGPointMake(radius*2 + xOffset, radius*3 + yOffset) radius:radius startAngle:0 endAngle:M_PI clockwise:YES];
    [path addArcWithCenter:CGPointMake(radius + xOffset, radius*2 + yOffset) radius:radius startAngle:M_PI_2 endAngle:-M_PI_2 clockwise:YES];
    [path closePath];
    [path fill];
    
    
    //缩放
//    CGFloat scale = floor((MIN(size.height, size.width)-margin) / 4);
//    CGAffineTransform transform;
//    transform = CGAffineTransformTranslate(scale, size.width/2, size.height/2);
//    [path applyTransform:transform];
}

//坐标
-(void)drawLine
{
    //绘制（10,100）到(200,100)的3像素宽的水平线条
//    CGContextSetLineWidth(contxet, 3.);
//    CGContextMoveToPoint(contxet, 10., 100.);
//    CGContextAddLineToPoint(context, 200., 100.);
//    CGContextStrokePath(context);
    
    //绘制（10,105.5）到(200,105.5)的3像素宽的水平线条
//    CGContextMoveToPoint(contxet, 10., 105.5);
//    CGContextAddLineToPoint(context, 200., 105.5);
    //IOS通过调用该方法，让线条沿路径居中
//    CGContextStrokePath(<#CGContextRef c#>);

}


//小球移动动画

-(void)drawCircle
{
    UIView *circleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    circleView.center = CGPointMake(100, 20);
    [self.view addSubview:circleView];
    
    UITapGestureRecognizer *g;
    g = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dropAnimate)];
    [[self view] addGestureRecognizer:g];
    
}
-(void)dropAnimate
{
    [UIView animateWithDuration:3 animations:^{
        self.view.center = CGPointMake(100, 300);
    }];
}

//循环动画
/*
 视图动画中，默认停止以便响应用户交互
 视图在动画过程中，触摸屏幕，就会取消动画，completion代码块会按照finished = NO的条件运行
 */
-(void)dropAnimateChaining:(UITapGestureRecognizer *)recognizer
{
    [UIView animateWithDuration:3 animations:^{
        recognizer.enabled = NO;
        self.view.center = CGPointMake(100, 300);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:3 animations:^{
            self.view.center = CGPointMake(250, 300);
        } completion:^(BOOL finished) {
            recognizer.enabled = YES;
        }];
        
    }];
}











@end

//
//  IntrinsicContentSizeViewController.m
//  GoAppTest
//
//  Created by huoshuguang on 14-5-22.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import "IntrinsicContentSizeViewController.h"
#import "MyView.h"
@interface IntrinsicContentSizeViewController ()

@end

@implementation IntrinsicContentSizeViewController

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
    
    //view1
    MyView *view1 = [MyView new];
    view1.backgroundColor = [UIColor yellowColor];
    //不允许AutoresizingMask转换成Autolayout
    view1.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:view1];
    //使用辅助方法快速设置其在父控件左，上，右边距为20.
    [self setEdge:self.view view:view1 attr:NSLayoutAttributeLeft constant:20];
    [self setEdge:self.view view:view1 attr:NSLayoutAttributeTop constant:20];
    [self setEdge:self.view view:view1 attr:NSLayoutAttributeRight constant:-20];
    /*
     但是运行后会发现，界面上不会显示任何东西。
     原因就是上面讲的，UIView默认是没有intrinsicContentSize的。
     我们可以通过创建一个自定义的UIView并重写- (CGSize)intrinsicContentSize方法 见：MyView.m文件
     
     然后，上面view1变量的类型从UIView替换成我们自定义的View：
     MyView类型：MyView *view1 = [MyView new];
     */
 
    //view2
    MyView *view2 = [MyView new];
    view2.backgroundColor = [UIColor yellowColor];
    //不允许AutoresizingMask转换成Autolayout
    view2.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:view2];
    //使用辅助方法快速设置其在父控件左，下，右边距为20.
    [self setEdge:self.view view:view2 attr:NSLayoutAttributeLeft constant:20];
    [self setEdge:self.view view:view2 attr:NSLayoutAttributeBottom constant:-20];
    [self setEdge:self.view view:view2 attr:NSLayoutAttributeRight constant:-20];
    
    /*
        通过代码加入Autolayout中的间距。
        命令view1和view2上下必须间隔20个单位，
        注意这里要求view2在view1之下的20单位，所以创建NSLayoutConstraint中view2参数在前面。
        同时两点：
                1.view2的attribute参数是NSLayoutAttributeTop
                2.view1的attribute参数是NSLayoutAttributeBottom
        但是，此时view1和view2相互间隔20单位，但是view1被拉伸了
     */
    
    //设置两个View上下间距为20
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:view2
                                                                                            attribute:NSLayoutAttributeTop
                                                                                          relatedBy:NSLayoutRelationEqual
                                                                                               toItem:view1
                                                                                            attribute:NSLayoutAttributeBottom
                                                                                           multiplier:1.0
                                                                                            constant:20]];
    
    /*
        接下来的任务就是做到如何不让view1拉伸，而让view2拉伸呢？
        这里就需要使用控件的Content Hugging Priority，这个属性在Xcode中的控件属性中很常见.
        
       Content Hugging Priority代表控件拒绝拉伸的优先级。
        优先级越高，控件会越不容易被拉伸。
     
       Content Compression Resistance Priority代表控件拒绝压缩内置空间的优先级。
       优先级越高，控件的内置空间会越不容易被压缩。
     
     
     而这里的内置空间，就是上面讲的UIView的intrinsicContentSize。
     如果我们把view1（上图中被拉伸的，在上面的View）的Content Hugging Priority设置一个更高的值，
     那么当Autolayout遇到这种决定谁来拉伸的情况时，view1不会被优先拉伸，而优先级稍低的view2才会被拉伸。
     
     可以直接通过UIView的setContentHuggingPriority:forAxis方法来设置控件的Content Hugging Priority，
     其中forAxis参数代表横向和纵向，本例中只需要设置纵向，所以传入UILayoutConstraintAxisVertical。
     整句代码：
     */
    //提高view1的Content Hugging Priority
    [view1 setContentHuggingPriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisVertical];
}




//设置Autolayout中的边距辅助方法,快速设置UIView的边距限制
- (void)setEdge:(UIView*)superview view:(UIView*)view attr:(NSLayoutAttribute)attr constant:(CGFloat)constant
{
    [superview addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                                                                 attribute:attr
                                                                                               relatedBy:NSLayoutRelationEqual
                                                                                                    toItem:superview
                                                                                                 attribute:attr
                                                                                                multiplier:1.0
                                                                                                 constant:constant]];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  SvGifViewViewController.m
//  GoAppTest
//
//  Created by huoshuguang on 14-5-31.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import "SvGifViewViewController.h"
#import "SvGifView.h"
@interface SvGifViewViewController ()

@end

@implementation SvGifViewViewController

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
    NSURL *gifUrl = [[NSBundle mainBundle] URLForResource:@"jiafei" withExtension:@"gif"];
    _ibGifView = [[SvGifView alloc] initWithCenter:_ibGifView.center fileURL:gifUrl];
//    _ibGifView.backgroundColor = [UIColor clearColor];
//    _ibGifView.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
//    [self.view addSubview:_ibGifView];
    
    
    _ibGifViewXib = [[SvGifView alloc] initWithCenter:_ibGifViewXib.center fileURL:gifUrl];
    NSArray *xibViewArr = [[NSBundle mainBundle] loadNibNamed:@"SvGifViewXib" owner:self options:nil];
    
////    _ibGifViewXib.backgroundColor = [UIColor clearColor];
//    _ibGifViewXib.autoresizing Mask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    _ibSvGifViewXib = [xibViewArr objectAtIndex:0];
//    _ibGifViewXib = (SvGifView *) [[_ibSvGifViewXib subviews] objectAtIndex:0];
    _ibGifViewXib = [[SvGifView alloc] initWithCenter:_ibGifViewXib.center fileURL:gifUrl];
    [_ibSvGifViewXib addSubview:_ibGifViewXib];
//    self.view = svGifViewXib;
    [self.view addSubview:_ibSvGifViewXib] ;

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [_ibGifView startGif];
    [_ibGifViewXib startGif];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

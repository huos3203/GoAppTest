//
//  HMGLTransitionsViewController.m
//  GoAppTest
//
//  Created by huoshuguang on 14-5-16.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import "HMGLTransitionsViewController.h"
#import "Switch3DTransition.h"
#import "FlipTransition.h"
#import "ClothTransition.h"
#import "DoorsTransition.h"
#import "RotateTransition.h"
@interface HMGLTransitionsViewController ()

@end

@implementation HMGLTransitionsViewController

@synthesize  view1,view2;


- (void)viewDidLoad
{
    [super viewDidLoad];

    Switch3DTransition *t1 = [[Switch3DTransition alloc] init];
    t1.transitionType = Switch3DTransitionLeft;
    
    FlipTransition *t2 = [[FlipTransition alloc] init];
    t2.transitionType = FlipTransitionLeft;
    
    transitionArray = [NSArray arrayWithObjects:[[Switch3DTransition alloc] init],
                       t1,
                       [[FlipTransition alloc] init],
                       t2,
                       [[ClothTransition alloc] init],
                       [[DoorsTransition alloc] init],
                       [[RotateTransition alloc] init],nil];
    transitionNameArr = [NSArray arrayWithObjects:@"switch3D",
                         @"switch3D left",
                         @"Flip",
                         @"Flip left",
                         @"Cloth",
                         @"Doors",
                         @"Rotate",nil];
    
    transition = [transitionArray objectAtIndex:0];
    NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"headerView" owner:self options:nil];
    view2 = [nibView objectAtIndex:0];
    
    // Creating singleton of transition manager here helps to reduce lag when showing first transition.
	[HMGLTransitionManager sharedTransitionManager];
    
    UIView *footView = [[UIView alloc] initWithFrame:view1.frame];
    [footView addSubview:view1];
    self.tableView.tableFooterView = footView;

//    UIView *heardview = [[UIView alloc] initWithFrame:view1.frame];
//    [heardview addSubview:view1];
//    self.tableView.tableHeaderView = heardview;
}

-(void)HMGLModalViewControllerDidfinish:(HMGLModalViewController *)HMGLModalViewController
{
    [[HMGLTransitionManager sharedTransitionManager] setTransition:transition];
	[[HMGLTransitionManager sharedTransitionManager] dismissModalViewController:HMGLModalViewController];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [transitionArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
   
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell ==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    // Configure the cell...
    if ([transitionArray objectAtIndex:indexPath.row] == transition) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        selectedTransitionIdx = indexPath.row;
    }
    else{
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    cell.textLabel.text = [transitionNameArr objectAtIndex:indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row != selectedTransitionIdx) {
        transition = [transitionArray objectAtIndex:indexPath.row];
        [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,[NSIndexPath indexPathForRow:selectedTransitionIdx inSection:0], nil] withRowAnimation:UITableViewRowAnimationNone];
    }
    
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
}

-(void)switchToView1
{
    UIView *contentView = view1.superview;
    
    [[HMGLTransitionManager sharedTransitionManager] setTransition:transition];
    [[HMGLTransitionManager sharedTransitionManager] beginTransition:contentView];
    view2.frame = view1.frame;
    [view1 removeFromSuperview];
    [contentView addSubview:view2];
    
    [[HMGLTransitionManager sharedTransitionManager] commitTransition];
}

-(void)switchToView2
{
    UIView *contentView = view2.superview;
    [[HMGLTransitionManager sharedTransitionManager] setTransition:transition];
    [[HMGLTransitionManager sharedTransitionManager] beginTransition:contentView];
    view1.frame = view2.frame;
    [view2 removeFromSuperview];

    [contentView addSubview:view1];
    [[HMGLTransitionManager sharedTransitionManager] commitTransition];
}

- (IBAction)ibaTransition:(id)sender {
    UIButton *btn = (UIButton *)sender;
    if (btn.superview == view1) {
        [self switchToView1];
    }else
    {
        [self switchToView2];
    }
}

-(IBAction)ibaTransition2:(id)sender
{
    [[HMGLTransitionManager sharedTransitionManager] setTransition:transition];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    HMGLModalViewController *modalviewVc = [storyboard instantiateViewControllerWithIdentifier:@"HMGLmodelView"];
//    HMGLModalViewController *modalviewVc = [[HMGLModalViewController alloc] init];


    modalviewVc.delegate = self;
    [[HMGLTransitionManager sharedTransitionManager] presentModalViewController:modalviewVc onViewController:self];

}
@end

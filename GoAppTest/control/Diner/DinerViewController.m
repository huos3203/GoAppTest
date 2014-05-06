//
//  DinerViewController.m
//  GoAppTest
//
//  Created by huoshuguang on 14-4-22.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import "DinerViewController.h"
#import "DinerOrder.h"
#import "DinerItem.h"
@interface DinerViewController ()

@end

@implementation DinerViewController
{
    dispatch_queue_t queue;
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
    
    currentItemIndex = 0;
    _order = [[DinerOrder alloc] init];

    //创建队列
    queue = dispatch_queue_create("pyc.com.cn", nil);
}

-(void)viewDidAppear:(BOOL)animated
{
    [self updateInventoryButtons];
    _ibChalkboardLabel.text = @"正在加载菜单信息...";
    
    dispatch_async(queue, ^{
         _inventory = [[DinerItem retrieveInventoryItems] mutableCopy];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self updateCurrentInventoryItem];
            [self updateInventoryButtons];
            _ibChalkboardLabel.text = @"菜单加载完成！";
        });
    });
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)ibaRemoveItem:(id)sender {
    NSLog(@"取消订单");
    [_order removeItemFromOrder:[self.inventory objectAtIndex:currentItemIndex]];
    [self updateOrderBoard];
    [self updateCurrentInventoryItem];
    [self updateInventoryButtons];
    
    UILabel* removeItemDisplay = [[UILabel alloc] initWithFrame:_ibCurrentItemImageView.frame];
    [removeItemDisplay setCenter:_ibChalkboardLabel.center];
    [removeItemDisplay setText:@"-1"];
    [removeItemDisplay setTextAlignment:NSTextAlignmentCenter];
    [removeItemDisplay setTextColor:[UIColor redColor]];
    [removeItemDisplay setBackgroundColor:[UIColor clearColor]];
    [removeItemDisplay setFont:[UIFont boldSystemFontOfSize:32.0]];
    [[self view] addSubview:removeItemDisplay];
    
    [UIView animateWithDuration:1.0
                     animations:^{
                         [removeItemDisplay setCenter:[_ibCurrentItemImageView center]];
                         [removeItemDisplay setAlpha:0.0];
                     } completion:^(BOOL finished) {
                         [removeItemDisplay removeFromSuperview];
                     }];
    
}

- (IBAction)ibaAddItem:(id)sender {
        NSLog(@"添加订单");
    [_order addItemToOrder:[self.inventory objectAtIndex:currentItemIndex]];
    [self updateOrderBoard];
    [self updateCurrentInventoryItem];
    [self updateInventoryButtons];
    
    UILabel* addItemDisplay = [[UILabel alloc] initWithFrame:_ibCurrentItemImageView.frame];
    [addItemDisplay setText:@"+1"];
    [addItemDisplay setTextColor:[UIColor whiteColor]];
    [addItemDisplay setBackgroundColor:[UIColor clearColor]];
    [addItemDisplay setTextAlignment:NSTextAlignmentCenter];
    [addItemDisplay setFont:[UIFont boldSystemFontOfSize:32.0]];
    [[self view] addSubview:addItemDisplay];
    
    [UIView animateWithDuration:1.0
                     animations:^{
                         [addItemDisplay setCenter:_ibChalkboardLabel.center];
                         [addItemDisplay setAlpha:0.0];
                     } completion:^(BOOL finished) {
                         [addItemDisplay removeFromSuperview];
                     }];

}

- (IBAction)ibaTotalOrder:(id)sender {
        NSLog(@"订单总价");
}

- (IBAction)ibaPreviousItem:(id)sender {
        NSLog(@"上一个菜单");
        currentItemIndex --;
        [self updateCurrentInventoryItem];
        [self updateInventoryButtons];
}

- (IBAction)ibaNextItem:(id)sender {
        NSLog(@"下一个菜单");
        currentItemIndex ++;
        [self updateCurrentInventoryItem];
        [self updateInventoryButtons];
}


- (void)updateInventoryButtons {
    if (!self.inventory || [self.inventory count] == 0) {
        _ibAddItemButton.enabled = NO;
        _ibRemoveItemButton.enabled = NO;
        _ibNextItemButton.enabled = NO;
        _ibPreviousItemButton.enabled = NO;
        _ibTotalOrderButton.enabled = NO;
    } else {
        if (currentItemIndex <= 0) {
            _ibPreviousItemButton.enabled = NO;
        } else {
            _ibPreviousItemButton.enabled = YES;
        }
        if (currentItemIndex >= [self.inventory count]-1) {
            _ibNextItemButton.enabled = NO;
        } else {
            _ibNextItemButton.enabled = YES;
        }
        
        DinerItem* currentItem = [self.inventory objectAtIndex:currentItemIndex];
        if (currentItem) {
            _ibAddItemButton.enabled = YES;
        } else {
            _ibAddItemButton.enabled = NO;
        }
        if (![_order findKeyForOrderItem:currentItem])
        {
            _ibRemoveItemButton.enabled = NO;
        } else {
            _ibRemoveItemButton.enabled = YES;
        }
        if ([_order.orderItems count] == 0) {
            _ibTotalOrderButton.enabled = NO;
        } else {
            _ibTotalOrderButton.enabled = YES;
        }
    }
}

- (void)updateCurrentInventoryItem {
    if (currentItemIndex >= 0 && currentItemIndex < [self.inventory count]) {
        DinerItem* currentItem = [self.inventory objectAtIndex:currentItemIndex];
        _ibCurrentItemLabel.text = currentItem.name;
        _ibCurrentItemImageView.image = [UIImage imageNamed:[currentItem pictureFile]];
    }
}

-(void)updateOrderBoard
{
    if ([_order.orderItems count]>0) {
        _ibChalkboardLabel.text = [_order orderDescription];
    }else{
        _ibChalkboardLabel.text = @"暂时还没有订单项！";
    }
}

@end

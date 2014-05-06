//
//  DinerViewController.h
//  GoAppTest
//
//  Created by huoshuguang on 14-4-22.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DinerOrder;
@interface DinerViewController : UIViewController
{
    int currentItemIndex;
}

@property(nonatomic,strong)NSMutableArray *inventory;
@property(nonatomic,strong)DinerOrder  *order;


@property (weak, nonatomic) IBOutlet UIButton *ibRemoveItemButton;

@property (weak, nonatomic) IBOutlet UIButton *ibAddItemButton;

@property (weak, nonatomic) IBOutlet UIButton *ibPreviousItemButton;

@property (weak, nonatomic) IBOutlet UIButton *ibNextItemButton;

@property (weak, nonatomic) IBOutlet UIButton *ibTotalOrderButton;

@property (weak, nonatomic) IBOutlet UILabel *ibChalkboardLabel;

@property (weak, nonatomic) IBOutlet UIImageView *ibCurrentItemImageView;

@property (weak, nonatomic) IBOutlet UILabel *ibCurrentItemLabel;

- (IBAction)ibaRemoveItem:(id)sender;

- (IBAction)ibaAddItem:(id)sender;

- (IBAction)ibaTotalOrder:(id)sender;

- (IBAction)ibaPreviousItem:(id)sender;

- (IBAction)ibaNextItem:(id)sender;

- (void)updateCurrentInventoryItem;
- (void)updateInventoryButtons;
@end

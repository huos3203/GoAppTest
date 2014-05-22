//
//  BlockButton.h
//  GoAppTest
//
//  Created by huoshuguang on 14-5-18.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BlockButton;
typedef void(^TounchBlock)(BlockButton *);

@interface BlockButton : UIButton

@property(nonatomic,strong)TounchBlock block;




@end

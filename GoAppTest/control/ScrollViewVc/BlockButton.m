//
//  BlockButton.m
//  GoAppTest
//
//  Created by huoshuguang on 14-5-18.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import "BlockButton.h"

@implementation BlockButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

-(void)clickAction
{
    
    _block(self);

}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
//    UITouch
//    UIGestureRecognizer
//    UITapGestureRecognizer
//    UIPickerView
//    UIDatePicker
//    UIImagePickerControllerSourceType
}
-(void)dealloc
{
//    Block_release(<#...#>)
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

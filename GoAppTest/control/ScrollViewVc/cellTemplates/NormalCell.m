//
//  NormalCell.m
//  GoAppTest
//
//  Created by huoshuguang on 14-5-22.
//  Copyright (c) 2014年 sqliteTest. All rights reserved.
//

#import "NormalCell.h"

@implementation NormalCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)loadTask:(MyTask*)task
{
    self.ibTitle.text = task.title;
    self.ibProgress.progress = task.progress;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    static int count = 0;
    count++;
    NSLog(@"NormalCell: %d", count);
    return [super initWithCoder:aDecoder];
}


@end

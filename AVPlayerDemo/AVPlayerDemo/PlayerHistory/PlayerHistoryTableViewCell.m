//
//  PlayerHistoryTableViewCell.m
//  AVPlayerDemo
//
//  Created by Yx on 15/12/2.
//  Copyright © 2015年 WuhanBttenMobileTechnologyCo.,Ltd. All rights reserved.
//

#import "PlayerHistoryTableViewCell.h"

@implementation PlayerHistoryTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

+ (UINib *)nib
{
    return [UINib nibWithNibName:@"PlayerHistoryTableViewCell" bundle:nil];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

//
//  PlayerHistoryTableViewCell.h
//  AVPlayerDemo
//
//  Created by Yx on 15/12/2.
//  Copyright © 2015年 WuhanBttenMobileTechnologyCo.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayerHistoryTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *LuHisImage;
@property (weak, nonatomic) IBOutlet UILabel *LuHisTitle;
@property (weak, nonatomic) IBOutlet UILabel *LuHisDate;
@property (weak, nonatomic) IBOutlet UILabel *labelTime;

+ (UINib *)nib;
@end

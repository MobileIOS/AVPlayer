//
//  PlayerHistoryTableViewCell+ConfigureForHistory.h
//  AVPlayerDemo
//
//  Created by Yx on 15/12/10.
//  Copyright © 2015年 WuhanBttenMobileTechnologyCo.,Ltd. All rights reserved.
//

#import "PlayerHistoryTableViewCell.h"
@class UserVideo;

@interface PlayerHistoryTableViewCell (ConfigureForHistory)

- (void)configureForPhoto:(UserVideo *)userVideo;

@end

//
//  PlayerHistoryTableViewCell+ConfigureForHistory.m
//  AVPlayerDemo
//
//  Created by Yx on 15/12/10.
//  Copyright © 2015年 WuhanBttenMobileTechnologyCo.,Ltd. All rights reserved.
//

#import "PlayerHistoryTableViewCell+ConfigureForHistory.h"
#import "UserVideo.h"

@implementation PlayerHistoryTableViewCell (ConfigureForHistory)

- (void)configureForPhoto:(UserVideo *)userVideo;
{
    self.LuHisTitle.text = userVideo.title;
    self.LuHisDate.text = userVideo.createTime;
    self.labelTime.text = [NSString stringWithFormat:@"观看至%@", [self displayTime:userVideo.playTime]];
}

- (NSString*)displayTime:(int)timeInterval{
    NSString * time = @"";
    int seconds = timeInterval % 60;
    int minutes = (timeInterval / 60) % 60;
    int hours = timeInterval / 3600;
    NSString * secondsStr=seconds<10?[NSString stringWithFormat:@"%@%d",@"0",seconds]:[NSString stringWithFormat:@"%d",seconds];
    NSString * minutesStr=minutes<10?[NSString stringWithFormat:@"%@%d",@"0",minutes]:[NSString stringWithFormat:@"%d",minutes];
    NSString * hoursStr=hours<10?[NSString stringWithFormat:@"%@%d",@"0",hours]:[NSString stringWithFormat:@"%d",hours];
    time = [NSString stringWithFormat:@"%@%@%@%@%@",hoursStr,@":",minutesStr,@":",secondsStr];
    return time;
}
@end

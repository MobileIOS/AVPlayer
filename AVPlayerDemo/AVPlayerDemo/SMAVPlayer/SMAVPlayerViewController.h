//
//  SMAVPlayerViewController.h
//  AVPlayerDemo
//
//  Created by Yx on 15/11/29.
//  Copyright © 2015年 WuhanBttenMobileTechnologyCo.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SMAVPlayerViewController : UIViewController{
    NSTimer *splashTimer;
}

@property (nonatomic,assign)float startTime;
@property (nonatomic, strong) NSMutableArray *arrVedio;
@end

//
//  UserVideo.h
//  AVPlayerDemo
//
//  Created by Yx on 15/12/3.
//  Copyright © 2015年 WuhanBttenMobileTechnologyCo.,Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserVideo : NSObject
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *createTime;
@property (assign, nonatomic) NSInteger userid;
@property (assign, nonatomic) NSInteger videoType;
@property (assign, nonatomic) NSInteger playTime;
@property (strong, nonatomic) NSString *videoUrl;
@property (strong, nonatomic) NSString *picUrl;
@end

//
//  BaseUINavigationViewController.h
//  LeaderMicroLesson
//
//  Created by Yx on 15/10/28.
//  Copyright © 2015年 WuhanBttenMobileTechnologyCo.,Ltd. All rights reserved.
//
// 扩展UINavigationController 使其所有push的VC都可以侧滑返回
#import <UIKit/UIKit.h>

@interface BaseUINavigationViewController : UINavigationController
@property (nonatomic, readonly) UIScreenEdgePanGestureRecognizer *screenEdgePanGestureRecognizer;

@end

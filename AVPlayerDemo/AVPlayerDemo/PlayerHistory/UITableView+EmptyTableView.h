//
//  UITableView+EmptyTableView.h
//  LeaderMicroLesson
//
//  Created by Yx on 15/11/23.
//  Copyright © 2015年 WuhanBttenMobileTechnologyCo.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (EmptyTableView)
@property (strong, nonatomic) UILabel *labelEmptyCategory;
//提示暂无相关内容
- (void)showLabelEmptyCate;
//清空提示信息
- (void)clearLabelEmptyCate;
@end

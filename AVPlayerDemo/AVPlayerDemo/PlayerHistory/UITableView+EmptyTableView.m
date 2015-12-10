//
//  UITableView+EmptyTableView.m
//  LeaderMicroLesson
//
//  Created by Yx on 15/11/23.
//  Copyright © 2015年 WuhanBttenMobileTechnologyCo.,Ltd. All rights reserved.
//

#import "UITableView+EmptyTableView.h"
#import <objc/runtime.h>

static char labelEmptyCategoryStatic;
@implementation UITableView (EmptyTableView)

- (void)showLabelEmptyCate
{
    self.labelEmptyCategory = [[UILabel alloc] initWithFrame:CGRectMake(0, 250, 200, 40)];
    self.labelEmptyCategory.textAlignment = NSTextAlignmentCenter;
    self.labelEmptyCategory.center = CGPointMake(CGRectGetWidth(self.frame)/2, CGRectGetHeight(self.frame)/2);
    self.labelEmptyCategory.textColor = [UIColor grayColor];
    self.labelEmptyCategory.text = @"暂无相关信息";
    self.labelEmptyCategory.hidden = NO;
    self.labelEmptyCategory.font = [UIFont boldSystemFontOfSize:19];
    [self addSubview:self.labelEmptyCategory];
    [self bringSubviewToFront:self.labelEmptyCategory];

}

- (void)clearLabelEmptyCate
{
    if (self.labelEmptyCategory.hidden == NO && self.labelEmptyCategory != nil) {
        self.labelEmptyCategory.hidden = YES;
    }
}


- (void)setLabelEmptyCategory:(UILabel *)labelEmpty{
    objc_setAssociatedObject(self, &labelEmptyCategoryStatic, labelEmpty, OBJC_ASSOCIATION_RETAIN);
}


- (UILabel *)labelEmptyCategory{
    return objc_getAssociatedObject(self, &labelEmptyCategoryStatic);
}
@end

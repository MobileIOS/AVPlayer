//
//  BaseUINavigationViewController.m
//  LeaderMicroLesson
//
//  Created by Yx on 15/10/28.
//  Copyright © 2015年 WuhanBttenMobileTechnologyCo.,Ltd. All rights reserved.
//

#import "BaseUINavigationViewController.h"

@interface BaseUINavigationViewController ()

@end

@implementation BaseUINavigationViewController
@dynamic screenEdgePanGestureRecognizer;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController
{
    if (self = [super initWithRootViewController:rootViewController]) {
//    // 设置navigationBar是否透明，不透明的话会使可用界面原点下移（0，0）点为导航栏左下角下方的那个点
//        self.navigationBar.translucent = NO;
//    // 设置navigationBar是不是使用系统默认返回，默认为YES
//        self.interactivePopGestureRecognizer.enabled = YES;
//    // 创建一个颜色，便于之后设置颜色使用
 //       UIColor * color = [UIColor blackColor];
//    // 设置navigationBar元素的背景颜色，不包括title
 //       self.navigationBar.tintColor = color;
//    // 设置navigationController的title的字体颜色
//       NSDictionary * dict=[NSDictionary dictionaryWithObject:color forKey:NSForegroundColorAttributeName];
//       self.navigationBar.titleTextAttributes = dict;
        self.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;
  }
   return self;
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
   if (self.viewControllers.count == 1 )//关闭主界面的右滑返回
   {

     return NO;
   }
   else
   {
       return YES;
   }
}

//解决scrollView中侧滑返回失效http://www.cnblogs.com/lexingyu/p/3702742.html
- (UIScreenEdgePanGestureRecognizer *)screenEdgePanGestureRecognizer
{
    UIScreenEdgePanGestureRecognizer *screenEdgePanGestureRecognizer = nil;
    if (self.view.gestureRecognizers.count > 0)
    {
        for (UIGestureRecognizer *recognizer in self.view.gestureRecognizers)
        {
            if ([recognizer isKindOfClass:[UIScreenEdgePanGestureRecognizer class]])
            {
                screenEdgePanGestureRecognizer = (UIScreenEdgePanGestureRecognizer *)recognizer;
                break;
            }
        }
    }
    
    return screenEdgePanGestureRecognizer;
}

@end

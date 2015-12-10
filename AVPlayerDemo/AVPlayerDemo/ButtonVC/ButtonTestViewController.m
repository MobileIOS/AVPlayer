//
//  ButtonTestViewController.m
//  AVPlayerDemo
//
//  Created by Yx on 15/12/10.
//  Copyright © 2015年 WuhanBttenMobileTechnologyCo.,Ltd. All rights reserved.
//

#import "ButtonTestViewController.h"
#import "UIControl+RepeatClick.h"

@interface ButtonTestViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btnTop;
@property (weak, nonatomic) IBOutlet UILabel *labShow;

@end

@implementation ButtonTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.btnTop.acceptEventInterval = 0.5;
}

- (IBAction)tapAction:(id)sender {
    self.labShow.text = [NSString stringWithFormat:@"O(∩_∩)O哈哈哈~%d",arc4random() % 100];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

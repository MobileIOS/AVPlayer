//
//  PlayerListViewController.m
//  AVPlayerDemo
//
//  Created by Yx on 15/11/25.
//  Copyright © 2015年 WuhanBttenMobileTechnologyCo.,Ltd. All rights reserved.
//

#import "PlayerListViewController.h"
#import "SMAVPlayer/SMAVPlayerViewController.h"
#import "VedioModel.h"
#import "PlayerHistoryViewController.h"
#import "ButtonTestViewController.h"

@interface PlayerListViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableViewMain;
@property (weak, nonatomic) IBOutlet UIView *viewTableHead;
@property (weak, nonatomic) IBOutlet UIImageView *imageTableHead;
@property (strong, nonatomic) NSMutableArray *arrDataSource;

@end

@implementation PlayerListViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:@"PlayerListViewController" bundle:nibBundleOrNil]) {
        
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"AVPlayer";
    self.tableViewMain.rowHeight = 52;
    self.tableViewMain.tableHeaderView = self.viewTableHead;
    self.arrDataSource = [NSMutableArray arrayWithObjects:@"",@"",@"", nil];
}

- (void)viewWillAppear:(BOOL)animated
{
    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)])
    {
        SEL selector = NSSelectorFromString(@"setOrientation:");
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
        [invocation setSelector:selector];
        [invocation setTarget:[UIDevice currentDevice]];
        int val = UIInterfaceOrientationPortrait;
        [invocation setArgument:&val atIndex:2];
        [invocation invoke];
    }
}

#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return self.arrDataSource.count;
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellId=@"PlayerListViewCellID";
    UITableViewCell *cell=nil;
    cell=[tableView dequeueReusableCellWithIdentifier:cellId];
    if(cell==nil){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    cell.textLabel.textColor = [UIColor redColor];
    cell.detailTextLabel.textColor=[UIColor colorWithRed:0x21/255.0f green:0x88/255.0f blue:0x68/255.0f alpha:1];
    cell.detailTextLabel.numberOfLines = 0;
    if (indexPath.row == 0) {
        cell.textLabel.text = @"播放器";
    }else if(indexPath.row == 1){
        cell.textLabel.text = @"播放历史";
    }else{
        cell.textLabel.text = @"防止按钮多次点击";
    }
    return cell;
}

#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        SMAVPlayerViewController *playerVC = [[SMAVPlayerViewController alloc] initWithNibName:@"SMAVPlayerViewController" bundle:nil];
        NSMutableArray *arrVedio = [NSMutableArray array];
        for (NSInteger i = 0 ; i < 2; i++) {
            VedioModel *vedioModel = [[VedioModel alloc] init];
            switch (i) {
                case  0:
                    vedioModel.strURL = @"http://221.229.165.31:80/play/274CF5C996AFCE2C751D315B5D1BF131B8C08208/298088%5Fstandard.mp4";
                    vedioModel.strTitle = @"娲石集团：人品铸产品";
                    break;
                case  1:
                    vedioModel.strURL = @"http://7xoour.com2.z0.glb.qiniucdn.com/fdbe32614a1167756be2a65721e15c59";
                    vedioModel.strTitle = @"精伦电子";
                    break;
                case  2:
                    vedioModel.strURL = @"http://7xoour.com2.z0.glb.qiniucdn.com/0ca32443a48076a75e6b534b64a4c221";
                    vedioModel.strTitle = @"德骼拜尔";
                    break;
                default:
                    break;
            }
            vedioModel.vedioType = 1;
            vedioModel.strUserID = @"1";
            [arrVedio addObject:vedioModel];
        }
        playerVC.arrVedio = arrVedio;
        [self presentViewController:playerVC animated:YES completion:nil];
    }else if(indexPath.row == 1){
        PlayerHistoryViewController *historyVC = [[PlayerHistoryViewController alloc] initWithNibName:@"PlayerHistoryViewController" bundle:nil];
        [self.navigationController pushViewController:historyVC animated:YES];
    }else{
        ButtonTestViewController *buttonVC = [[ButtonTestViewController alloc] initWithNibName:@"ButtonTestViewController" bundle:nil];
        [self.navigationController pushViewController:buttonVC animated:YES];
    }
    [self.tableViewMain deselectRowAtIndexPath:[self.tableViewMain indexPathForSelectedRow] animated:YES];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat yOffset = self.tableViewMain.contentOffset.y;
    //向上偏移量变正  向下偏移量变负
    if (yOffset < 0) {
        CGFloat factor = ABS(yOffset)+175;
        CGRect f = CGRectMake(-([[UIScreen mainScreen] bounds].size.width*factor/175-[[UIScreen mainScreen] bounds].size.width)/2,-ABS(yOffset), [[UIScreen mainScreen] bounds].size.width*factor/175, factor);
        self.imageTableHead.frame = f;
    }else {
        CGRect f = self.viewTableHead.frame;
        f.origin.y = 0;
        self.viewTableHead.frame = f;
        self.imageTableHead.frame = CGRectMake(0, f.origin.y, [[UIScreen mainScreen] bounds].size.width, 175);
    }
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

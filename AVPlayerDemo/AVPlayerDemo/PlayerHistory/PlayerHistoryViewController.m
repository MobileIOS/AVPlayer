//
//  PlayerHistoryViewController.m
//  AVPlayerDemo
//
//  Created by Yx on 15/12/2.
//  Copyright © 2015年 WuhanBttenMobileTechnologyCo.,Ltd. All rights reserved.
//

#import "PlayerHistoryViewController.h"
#import "PlayerHistoryTableViewCell.h"
#import "PlayerHistoryTableViewCell+ConfigureForHistory.h"
#import "VedioHistory.h"
#import "UserVideo.h"
#import "VedioModel.h"
#import "SMAVPlayerViewController.h"
#import "UIScrollView+MJExtension.h"
#import "UIScrollView+MJRefresh.h"
#import "UITableView+EmptyTableView.h"
#import "MBMessageTip.h"
#import "ArrayDataSource.h"

static NSString * const PlayerHistoryTableViewCellIdentifier = @"PlayerHistoryTableViewCell";

@interface PlayerHistoryViewController ()<UITableViewDelegate>
@property (nonatomic, strong) ArrayDataSource *photosArrayDataSource;
@property (strong, nonatomic) IBOutlet UITableView *tableviewMain;
@property (strong, nonatomic) NSMutableArray *arrVedio;
@property (assign, nonatomic) int page;
@end

@implementation PlayerHistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableviewMain.rowHeight = 80;
    self.title =@"观看历史";
    _arrVedio = [NSMutableArray array];
    [self setExtraCellLineHidden:self.tableviewMain];
    __weak PlayerHistoryViewController *weakSelf = self;
    [self.tableviewMain addFooterWithCallback:^{
        ++weakSelf.page;
        NSArray *arr = [NSArray array];
        VedioHistory *vedioHistory = [[VedioHistory alloc] init];
        arr = [vedioHistory queryLuyanUserId:@"1" page:weakSelf.page];
        if (arr.count > 0) {
            [weakSelf.arrVedio addObjectsFromArray:arr];
            [weakSelf setupTableView];
            //[weakSelf.tableviewMain reloadData];
        }else{
            --weakSelf.page;
            [MBMessageTip messageWithTip:weakSelf.view withMessage:@"没有更多了" ];
        }
        [weakSelf.tableviewMain footerEndRefreshing];
    }];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
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
    [_arrVedio removeAllObjects];
    VedioHistory *vedioHistory = [[VedioHistory alloc] init];
    _page = 1;
    _arrVedio = [vedioHistory queryLuyanUserId:@"1" page:_page];
    if (_arrVedio==nil||_arrVedio.count==0) {
        [_tableviewMain showLabelEmptyCate];
    }else{
        [_tableviewMain clearLabelEmptyCate];
    }
    [self setupTableView];
}

- (void)setupTableView
{
    TableViewCellConfigureBlock configureCell = ^(PlayerHistoryTableViewCell *cell, UserVideo *userVideo) {
        [cell configureForPhoto:userVideo];
    };
    self.photosArrayDataSource = [[ArrayDataSource alloc] initWithItems:_arrVedio
                                                         cellIdentifier:PlayerHistoryTableViewCellIdentifier
                                                     configureCellBlock:configureCell];
    self.tableviewMain.dataSource = self.photosArrayDataSource;
    [self.tableviewMain registerNib:[PlayerHistoryTableViewCell nib] forCellReuseIdentifier:PlayerHistoryTableViewCellIdentifier];
}

/*
#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arrVedio.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellTableIdentifer = @"PlayerHistoryTableViewCell";
    PlayerHistoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellTableIdentifer];
    if(cell==nil){
        cell = [[[NSBundle mainBundle] loadNibNamed:CellTableIdentifer owner:self options:nil] lastObject];
    }
    UserVideo *userVideo = _arrVedio[indexPath.row];
  // [cell.LuHisImage setImageWithURL:[NSURL URLWithString:userVideo.picUrl] placeholderImage:[UIImage imageNamed:@"default_home.png"] contentModel:UIViewContentModeScaleAspectFill];
    cell.LuHisTitle.text = userVideo.title;
    cell.LuHisDate.text = userVideo.createTime;
    cell.labelTime.text = [NSString stringWithFormat:@"观看至%@", [self displayTime:userVideo.playTime]];
    return cell;
}

*/
#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    SMAVPlayerViewController *playerVC = [[SMAVPlayerViewController alloc] initWithNibName:@"SMAVPlayerViewController" bundle:nil];
    NSMutableArray *arrVedio = [NSMutableArray array];
    
    UserVideo *vedioData = [self.photosArrayDataSource itemAtIndexPath:indexPath];
    VedioModel *vedioModel = [[VedioModel alloc] init];
    vedioModel.strURL = vedioData.videoUrl;
    vedioModel.strTitle = vedioData.title;
    vedioModel.vedioType = 1;
    vedioModel.strImage = vedioData.picUrl;
    vedioModel.strUserID = @"1";
    vedioModel.strIndex = vedioData.playTime;
    [arrVedio addObject:vedioModel];
    playerVC.arrVedio = arrVedio;
    playerVC.startTime = vedioData.playTime;
    [self presentViewController:playerVC animated:YES completion:nil];
    [self.tableviewMain deselectRowAtIndexPath:[self.tableviewMain indexPathForSelectedRow] animated:YES];
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

//隐藏多余空白行
-(void)setExtraCellLineHidden: (UITableView *)tableView
{
    if (!tableView) return;
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end

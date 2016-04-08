//
//  ViewController.m
//  AVKit
//
//  Created by zzm on 16/4/7.
//  Copyright © 2016年 7colors. All rights reserved.
//

#import "ViewController.h"
#import "HYVideoRecordViewController.h"
#import "VideoTableViewCell.h"

#define kScreenWidth CGRectGetWidth([UIScreen mainScreen].bounds)
#define kScreenHeight CGRectGetHeight([UIScreen mainScreen].bounds)

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation ViewController
@synthesize videoArray;
@synthesize videoTableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    if (!videoArray) {
        videoArray = [NSMutableArray array];
    }
    [videoArray removeAllObjects];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return videoArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"videocell";
    VideoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[VideoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    NSMutableDictionary *obj  = videoArray[indexPath.row];
    cell.nameLabel.text = [NSString stringWithFormat:@"%@",obj[@"url"]];
  
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnClicked:(id)sender
{
    HYVideoRecordViewController *recordVC = [[HYVideoRecordViewController alloc] initWithNibName:NSStringFromClass([HYVideoRecordViewController class]) bundle:nil];
    recordVC.needSavedPhotosAlbum = FALSE;
    [recordVC setFinishRecordBlock:^(NSDictionary *didFinishRecordBlockDic) {
        [videoArray addObject:didFinishRecordBlockDic];
        [videoTableView reloadData];
    }];
    
    [self presentViewController:recordVC animated:YES completion:NULL];
//    [self.navigationController pushViewController:recordVC animated:YES];
}

@end

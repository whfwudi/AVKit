//
//  ViewController.m
//  AVKit
//
//  Created by zzm on 16/4/7.
//  Copyright © 2016年 7colors. All rights reserved.
//

#import "ViewController.h"
#import "HYVideoRecordViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnClicked:(id)sender
{
    HYVideoRecordViewController *recordVC = [[HYVideoRecordViewController alloc] initWithNibName:NSStringFromClass([HYVideoRecordViewController class]) bundle:nil];
    recordVC.needSavedPhotosAlbum = FALSE;
    [recordVC setFinishRecordBlock:^(NSDictionary *didFinishRecordBlock) {
        
    }];
    
    [self presentViewController:recordVC animated:YES completion:NULL];
//    [self.navigationController pushViewController:recordVC animated:YES];
}

@end

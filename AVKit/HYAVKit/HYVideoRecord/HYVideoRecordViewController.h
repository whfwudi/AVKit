//
//  HYVideoRecordViewController.h
//  AVKit
//
//  Created by zzm on 16/4/7.
//  Copyright © 2016年 7colors. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^FinishRecordBlock)(NSDictionary *didFinishRecordBlock);

@interface HYVideoRecordViewController : UIViewController
@property (nonatomic) BOOL needSavedPhotosAlbum;
- (void)setFinishRecordBlock:(FinishRecordBlock )finishRecordBlockDic;

@end

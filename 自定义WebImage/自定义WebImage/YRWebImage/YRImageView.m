//
//  YRImageView.m
//  01-自定义操作
//
//  Created by YR-夜神月 on 16/3/2.
//  Copyright © 2016年 yr. All rights reserved.
//

#import "YRImageView.h"
#import "YRDownloadManager.h"

@interface YRImageView ()
/**
 *  记录当前正确下载图片的URL
 */
@property (nonatomic, copy) NSString *currentURLString;
@end

@implementation YRImageView
/**
 *  根据URLString设置imageView的图片
 */
- (void)setImageWithURLString:(NSString *)URLString {
    // 取消之前图片相对应的下载操作
    if ([self.currentURLString isEqualToString:URLString]) return;
    
    // 取消self.currentURLString对应的下载操作
    [[YRDownloadManager shareManager] cancelDownloadOperationWithURLString:URLString];
    
    // 记录当前app的图片URL
    self.currentURLString = URLString;
    
    // 由下载管理器单例下载图片
    [[YRDownloadManager shareManager] downloadOperationWithURLString:self.currentURLString finishedBlock:^(UIImage *image) {
        NSLog(@"");
        self.image = image;
    }];
}
@end

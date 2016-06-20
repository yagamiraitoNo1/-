//
//  YRDownloadManager.h
//  01-自定义操作
//
//  Created by YR-夜神月 on 16/3/2.
//  Copyright © 2016年 yr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YRDownloadManager : NSObject

/**
 *  全局访问点
 */
+ (instancetype)shareManager;

/**
 *  下载URL指定的图片
 *
 *  @param URLString     图片的URL
 *  @param finishedBlock 完成回调
 */
- (void)downloadOperationWithURLString:(NSString *)URLString finishedBlock:(void (^)(UIImage *image))finishedBlock;

/**
 *  取消URLString 对应的下载操作
 *
 *  @param URLString 图片URL
 */
- (void)cancelDownloadOperationWithURLString:(NSString *)URLString;

@end

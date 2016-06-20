//
//  YRDownloadOperation.h
//  01-自定义操作
//
//  Created by YR-夜神月 on 16/3/2.
//  Copyright © 2016年 yr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YRDownloadOperation : NSOperation

/**
 *  要下载图片对应的URL字符串
 */
@property (nonatomic, copy) NSString *URLString;

/**
 *  图片下载完成回调(不要和系统的completionBlock重名)
 */
@property (nonatomic, copy) void (^finishedBlock)(UIImage *image);

/**
 *  创建下载操作
 *
 *  @param URLString     下载图片的URL
 *  @param finishedBlock 完成回调
 *
 *  @return 下载操作
 */
+ (instancetype)downloadOperationWithURLString:(NSString *)URLString finishedBlock:(void (^)(UIImage *image))finishedBlock;

@end

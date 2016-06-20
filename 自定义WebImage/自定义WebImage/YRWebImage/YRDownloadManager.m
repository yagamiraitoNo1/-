//
//  YRDownloadManager.m
//  01-自定义操作
//
//  Created by YR-夜神月 on 16/3/2.
//  Copyright © 2016年 yr. All rights reserved.
//

#import "YRDownloadManager.h"
#import "YRDownloadOperation.h"

@interface YRDownloadManager ()

/**
 *  下载队列
 */
@property (nonatomic, strong) NSOperationQueue *downloadQueue;

/**
 *  操作缓存池
 */
@property (nonatomic, strong) NSMutableDictionary *operationCache;

@end

@implementation YRDownloadManager
/**
 *  全局访问点
 */
+ (instancetype)shareManager {
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

/**
 *  下载URL指定的图片
 *
 *  @param URLString     图片的URL
 *  @param finishedBlock 完成回调
 */
- (void)downloadOperationWithURLString:(NSString *)URLString finishedBlock:(void (^)(UIImage *))finishedBlock {
    // 创建下载操作
    YRDownloadOperation *downloadOp = [YRDownloadOperation downloadOperationWithURLString:URLString finishedBlock:finishedBlock];
    // 将操作添加到缓存池中
    [self.operationCache setObject:downloadOp forKey:URLString];
    
    // 将操作添加到队列中，只要将操作添加到队列中，就会自动异步执行操作的 main 方法， main 是操作的执行入口
    [self.downloadQueue addOperation:downloadOp];
    
}

/**
 *  取消URLString 对应的下载操作
 *
 *  @param URLString 图片URL
 */
- (void)cancelDownloadOperationWithURLString:(NSString *)URLString {
    // 根据URLString获得操作
    YRDownloadOperation *downloadOp = self.operationCache[URLString];
    // 如果不为空，则表示该操作没有被取消
    if (downloadOp == nil) return;
    // 取消正在下载的图片
    [downloadOp cancel];
    // 将操作从缓存池中移除
    [self.operationCache removeObjectForKey:URLString];
}

- (NSOperationQueue *)downloadQueue {
    if (!_downloadQueue) {
        _downloadQueue = [[NSOperationQueue alloc] init];
        [_downloadQueue setMaxConcurrentOperationCount:2];
    }
    return _downloadQueue;
}

- (NSMutableDictionary *)operationCache{
    if (!_operationCache) {
        _operationCache = [[NSMutableDictionary alloc] init];
    }
    return _operationCache;
}

@end

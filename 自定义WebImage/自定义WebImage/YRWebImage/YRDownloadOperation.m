//
//  YRDownloadOperation.m
//  01-自定义操作
//
//  Created by YR-夜神月 on 16/3/2.
//  Copyright © 2016年 yr. All rights reserved.
//

#import "YRDownloadOperation.h"
#import "NSString+Path.h"

@implementation YRDownloadOperation

+ (instancetype)downloadOperationWithURLString:(NSString *)URLString finishedBlock:(void (^)(UIImage *))finishedBlock{
    // 断言：预先判断某一条件一定成立，如果不成立，则直接崩溃
    NSAssert(finishedBlock != nil, @"finishedBlock 完成回调一定要传");
    
    // 创建操作
    YRDownloadOperation *downloadOp = [[YRDownloadOperation alloc] init];
    // 记录属性
    downloadOp.URLString = URLString;
    downloadOp.finishedBlock = finishedBlock;
    
    return downloadOp;
}

// 提示：自定义操作，重写main方法时，要加上自动释放池
/**
 *  如何传递参数
    1> 通过参数传递
    
    如何回调？通知／代理／block
    1> 使用系统block回调 ：完成回调completionBlock
    2> 自定义block
 */
- (void)main{
    @autoreleasepool {
//        NSLog(@"%s",__FUNCTION__);
        NSLog(@"下载%@ -- %@",[NSThread currentThread],self.URLString);
        // 将URLString转换成NSURL
        NSURL *url = [NSURL URLWithString:self.URLString];
        // 获得二进制数据
        NSData *data = [NSData dataWithContentsOfURL:url];
        // 将图片保存到沙盒中
        if (data != nil) {
            [data writeToFile:self.URLString.appendCachePath atomically:YES];
        }
        // 模拟延时
        [NSThread sleepForTimeInterval:0.5];
        // 判断操作是否被取消
        if (self.isCancelled) {
            NSLog(@"取消了下载...%@",self.URLString);
            return;
        }
        // 主线程回调
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.finishedBlock([UIImage imageWithData:data]);
        }];
    }
}

/**
 *  start 方法会将操作放到可调用线程池中，等待CPU调度
    main 是操作执行的入口
 
 */
- (void)start {
    NSLog(@"%s",__FUNCTION__);
    [super start];
}

@end

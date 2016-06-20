//
//  ViewController.m
//  01-自定义操作
//
//  Created by YR-夜神月 on 16/3/2.
//  Copyright © 2016年 yr. All rights reserved.
//

#import "ViewController.h"
//#import "YRDownloadOperation.h"
#import "YRApp.h"
#import "YRDownloadManager.h"

@interface ViewController ()
@property (nonatomic, weak) IBOutlet UIImageView *iconView;

@property (nonatomic, strong) NSArray *apps;
/**
 *  记录当前正确下载图片的URL
 */
@property (nonatomic, copy) NSString *currentURLString;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self test];
}

- (IBAction)cancel {
    // 当调用操作cancel方法时，依然会导致操作的start方调用
//    [self.queue cancelAllOperations];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    // 随机获得一个整数
    int index = arc4random_uniform((unsigned int)self.apps.count);
    YRApp *app = self.apps[index];
    // 取消之前图片对应的下载操作
    if ([self.currentURLString isEqualToString:app.icon]) return;
//    [self.operationCache[self.currentURLString] cancel];
    // 记录当前app的图片URL
    self.currentURLString = app.icon;
    
    // 通过下载管理器单例 接管 下载操作
    [[YRDownloadManager shareManager] downloadOperationWithURLString:self.currentURLString finishedBlock:^(UIImage *image) {
        NSLog(@"完成了吗 ＝ %@ %@",[NSThread currentThread],image);
        self.iconView.image = image;
    }];
}

- (NSArray *)apps{
    if (!_apps) {
        _apps = [YRApp apps];
    }
    return _apps;
}

@end

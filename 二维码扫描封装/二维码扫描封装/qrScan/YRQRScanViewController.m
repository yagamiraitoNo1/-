//
//  YRQRScanViewController.m
//  二维码扫描封装
//
//  Created by 夜神月 on 16/3/28.
//  Copyright © 2016年 yr. All rights reserved.
//

#import "YRQRScanViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "YRQRScanView.h"

@interface YRQRScanViewController ()<AVCaptureMetadataOutputObjectsDelegate>
@property (nonatomic, strong) AVCaptureSession *session;
@end

@implementation YRQRScanViewController

- (void)loadView {
    // 创建session
    self.session = [[AVCaptureSession alloc] init];
    // 把会话给预览视图
    self.view = [YRQRScanView qrScanViewWithSession:self.session];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 摄像头输入设备
    // 捕捉设备，默认后置摄像头
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    NSError *error = nil;
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:device error:&error];
    if (error) {
        NSLog(@"%@",error);
        return;
    }
    // 元数据输出对象
    AVCaptureMetadataOutput *output = [[AVCaptureMetadataOutput alloc] init];
    // 建立通道
    // 判断是否可以添加设备，添加输入设备
    if ([self.session canAddInput:input]) {
        [self.session addInput:input];
    }
    if ([self.session canAddOutput:output]) {
        [self.session addOutput:output];
    }
    // 设置元数据输出对象相关属性（必须在这里，否则output.availableMetadataObjectTypes无值）
    // org.iso.QRCode 二维码的一种
//    NSLog(@"%@",output.availableMetadataObjectTypes);
    output.metadataObjectTypes = @[@"org.iso.QRCode"];
    // 实现代理放啊放
    [output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    // 开始扫描
    [self.session startRunning];
}
- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection {
//    NSLog(@"%@",metadataObjects);
    AVMetadataMachineReadableCodeObject *objc = [metadataObjects firstObject];
    NSLog(@"%@",objc.stringValue);
    // 回调
    self.didCaptureQRCodeBlock(objc.stringValue);
    [self.session stopRunning];
}

- (void)dealloc {
    NSLog(@"%s", __FUNCTION__);
}

@end

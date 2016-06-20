//
//  YRQRScanView.m
//  二维码扫描封装
//
//  Created by 夜神月 on 16/3/28.
//  Copyright © 2016年 yr. All rights reserved.
//

#import "YRQRScanView.h"
#import <AVFoundation/AVFoundation.h>

@interface YRQRScanView ()
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;
@property (weak, nonatomic) IBOutlet UIImageView *lineImageView;

@end

@implementation YRQRScanView

/**
 *  告诉这个view创建的时候，使用layer是
 */
+ (Class)layerClass {
    return [AVCaptureVideoPreviewLayer class];
}

+ (instancetype)qrScanViewWithSession:(AVCaptureSession *)session {
    YRQRScanView *qrScanView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([YRQRScanView class]) owner:nil options:nil] lastObject];
    // 取出layer
    AVCaptureVideoPreviewLayer *layer = (AVCaptureVideoPreviewLayer *)qrScanView.layer;
    // 关联session
    layer.session = session;
    return qrScanView;
}

/**
 *  当从xib中把这个加载出来的时候调用
 */
- (void)awakeFromNib {
    CABasicAnimation *lineAnimation = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
    // 设置属性
    lineAnimation.fromValue = @(0);
    lineAnimation.toValue = @(self.bgImageView.bounds.size.height);
    // 间隔
    lineAnimation.duration = 1;
    lineAnimation.repeatCount = NSIntegerMax;
    
    [self.lineImageView.layer addAnimation:lineAnimation forKey:@"lineAnnimation"];
    
}

@end

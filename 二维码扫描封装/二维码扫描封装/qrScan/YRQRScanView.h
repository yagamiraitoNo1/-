//
//  YRQRScanView.h
//  二维码扫描封装
//
//  Created by 夜神月 on 16/3/28.
//  Copyright © 2016年 yr. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AVCaptureSession;

@interface YRQRScanView : UIView

+ (instancetype)qrScanViewWithSession:(AVCaptureSession *)session;

@end

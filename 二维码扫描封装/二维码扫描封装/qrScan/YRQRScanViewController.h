//
//  YRQRScanViewController.h
//  二维码扫描封装
//
//  Created by 夜神月 on 16/3/28.
//  Copyright © 2016年 yr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YRQRScanViewController : UIViewController

@property (nonatomic, copy) void (^didCaptureQRCodeBlock)(NSString *qrCode);

@end

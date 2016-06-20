//
//  ViewController.m
//  二维码扫描封装
//
//  Created by 夜神月 on 16/3/28.
//  Copyright © 2016年 yr. All rights reserved.
//

#import "ViewController.h"
#import "YRQRScanViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)scan:(id)sender {
    YRQRScanViewController *qrScanVc = [[YRQRScanViewController alloc] init];
    qrScanVc.didCaptureQRCodeBlock = ^(NSString *qrCode){
        self.label.text = qrCode;
        [self.navigationController popViewControllerAnimated:YES];
    };
    [self.navigationController pushViewController:qrScanVc animated:YES];
    
}

@end

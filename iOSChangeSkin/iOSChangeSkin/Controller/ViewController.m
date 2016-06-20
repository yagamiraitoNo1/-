//
//  ViewController.m
//  01-换肤
//
//  Created by 夜神月 on 16/3/26.
//  Copyright © 2016年 yr. All rights reserved.
//

#import "ViewController.h"
#import "YRSkinTools.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *faceImageView;
@property (weak, nonatomic) IBOutlet UIImageView *heartImageView;
@property (weak, nonatomic) IBOutlet UIImageView *rectImageView;
@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 读取皮肤的名字
    [self changeSkinWithName:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)blue {
    [self changeSkinWithName:@"blue"];
}
- (IBAction)red {
    [self changeSkinWithName:@"red"];
}
- (IBAction)green {
    [self changeSkinWithName:@"green"];
}

- (void)changeSkinWithName:(NSString *)skinName {
    [YRSkinTools setSkinName:skinName];
    
    self.faceImageView.image = [YRSkinTools imageNamed:@"face"];
    self.heartImageView.image = [YRSkinTools imageNamed:@"heart"];
    self.rectImageView.image = [YRSkinTools imageNamed:@"rect"];
    
    self.view.backgroundColor = [YRSkinTools colorWithName:YRBackgroundColor];
    self.textLabel.textColor = [YRSkinTools colorWithName:YRTextColor];
}

@end

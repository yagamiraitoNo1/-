//
//  YRThreeViewController.m
//  01-换肤
//
//  Created by 夜神月 on 16/3/26.
//  Copyright © 2016年 yr. All rights reserved.
//

#import "YRThreeViewController.h"
#import "YRSkinTools.h"

@interface YRThreeViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *faceImageView;
@property (weak, nonatomic) IBOutlet UIImageView *heartImageView;
@property (weak, nonatomic) IBOutlet UIImageView *rectImageView;
@end

@implementation YRThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getSkinName) name:@"skinTools" object:nil];
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"skinToolsaaaa" object:self userInfo:nil];
    
    // Do any additional setup after loading the view.
    [self getSkinName];
}

- (void)getSkinName {
    self.faceImageView.image = [YRSkinTools imageNamed:@"face"];
    self.heartImageView.image = [YRSkinTools imageNamed:@"heart"];
    self.rectImageView.image = [YRSkinTools imageNamed:@"rect"];
    
    self.view.backgroundColor = [YRSkinTools colorWithName:YRBackgroundColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

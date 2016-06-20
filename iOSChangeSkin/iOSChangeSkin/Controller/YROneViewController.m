//
//  YROneViewController.m
//  01-换肤
//
//  Created by 夜神月 on 16/3/26.
//  Copyright © 2016年 yr. All rights reserved.
//

#import "YROneViewController.h"
#import "YRSkinTools.h"

@interface YROneViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *faceImageView;
@property (weak, nonatomic) IBOutlet UIImageView *heartImageView;
@property (weak, nonatomic) IBOutlet UIImageView *rectImageView;
@end

@implementation YROneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.faceImageView.image = [YRSkinTools imageNamed:@"face"];
    self.heartImageView.image = [YRSkinTools imageNamed:@"heart"];
    self.rectImageView.image = [YRSkinTools imageNamed:@"rect"];
    
    self.view.backgroundColor = [YRSkinTools colorWithName:YRBackgroundColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

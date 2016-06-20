//
//  YRImageView.h
//  01-自定义操作
//
//  Created by YR-夜神月 on 16/3/2.
//  Copyright © 2016年 yr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YRImageView : UIImageView

/**
 *  根据URLString设置imageView的图片
 */
- (void)setImageWithURLString:(NSString *)URLString;

@end

//
//  YRSkinTools.h
//  01-换肤
//
//  Created by 夜神月 on 16/3/26.
//  Copyright © 2016年 yr. All rights reserved.
//

#import <UIKit/UIKit.h>

#define YRBackgroundColor @"backgroundColor"
#define YRTextColor @"textColor"

/**
 *  1. 第一种方式： 单例
    2. 第二种方式： 类方法
 */
@interface YRSkinTools : NSObject

/**
 *  根据图片名称返回当前皮肤的图片
 */
+ (UIImage *)imageNamed:(NSString *)name;
/**
 *  设置皮肤名称
 */
+ (void)setSkinName:(NSString *)skinName;
/**
 *  根据名称返回颜色
 */
+ (UIColor *)colorWithName:(NSString *)name;

@end

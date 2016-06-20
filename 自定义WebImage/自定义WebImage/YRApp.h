//
//  HMApp.h
//  07-异步加载网络图片-(掌握)
//
//  Created by SZSYKT_iOSBasic_2 on 16/3/1.
//  Copyright © 2016年 heima. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YRApp : NSObject
/**
 *  应用名称
 */
@property (nonatomic, copy) NSString *name;
/**
 *  应用图标对应的URL字符串
 */
@property (nonatomic, copy) NSString *icon;
/**
 *  下载量
 */
@property (nonatomic, copy) NSString *download;
/**
 *  图片
 */
//@property (nonatomic, strong) UIImage *image;

+ (instancetype)appWithDict:(NSDictionary *)dict;
+ (NSArray *)apps;
@end

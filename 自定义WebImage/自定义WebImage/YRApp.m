//
//  HMApp.m
//  07-异步加载网络图片-(掌握)
//
//  Created by SZSYKT_iOSBasic_2 on 16/3/1.
//  Copyright © 2016年 heima. All rights reserved.
//

#import "YRApp.h"

@implementation YRApp

+ (instancetype)appWithDict:(NSDictionary *)dict {
    id obj = [[self alloc] init];
    [obj setValuesForKeysWithDictionary:dict];
    return obj;
}

#pragma mark - 懒加载数据
+ (NSArray *)apps {
    // 获得文件路径
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"apps.plist" withExtension:nil];
    // 加载数据
    NSArray *appArray = [NSArray arrayWithContentsOfURL:url];
    // 创建模型数组
    // arrayWithCapacity：容量 在实例化数组的同时指定容量大小 分配指定容量大小的内存
    // 如果是10，一次性分配10个内存空间，
    // 如果添加11个元素，又会再分配10个内存空间。
    // [NSMutableArray array] 每次添加元素都会分配内存空间。
    // arrayWithCapacity：方法效率更高
    NSMutableArray *apps = [NSMutableArray arrayWithCapacity:appArray.count];
    // 字典转模型
    [appArray enumerateObjectsUsingBlock:^(NSDictionary *appDict, NSUInteger idx, BOOL * _Nonnull stop) {
        // 创建模型
        YRApp *app = [YRApp appWithDict:appDict];
        // 将模型添加到数组中
        [apps addObject:app];
    }];
    // NSMutableArray是线程不安全对象，为了保证线程安全，调用数组的copy方法，
    return [apps copy];
}
@end

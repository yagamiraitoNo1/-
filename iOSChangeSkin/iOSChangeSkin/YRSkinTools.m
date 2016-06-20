//
//  YRSkinTools.m
//  01-换肤
//
//  Created by 夜神月 on 16/3/26.
//  Copyright © 2016年 yr. All rights reserved.
//

#import "YRSkinTools.h"

#define YRSkinNameKey @"YRSkinNameKey"

/**
 *  皮肤的名称
 */
static NSString *YRSkinName;

/**
 *  对应皮肤的颜色， 组织方式 name:UIColor对象
 */
static NSMutableDictionary *YRSkinColors;

@implementation YRSkinTools

+ (void)load {
    YRSkinName = [[NSUserDefaults standardUserDefaults] objectForKey:YRSkinNameKey];
    if (YRSkinName == nil) {
        YRSkinName = @"blue";
    }
    
    YRSkinColors = [NSMutableDictionary dictionary];
    // 加载皮肤颜色
    [self loadSkinColor];
}


/**
 *  根据图片名称返回当前皮肤的图片
 */
+ (UIImage *)imageNamed:(NSString *)name {
    NSString *skinImageName = [NSString stringWithFormat:@"skin/%@/%@",YRSkinName, name];
    return [UIImage imageNamed:skinImageName];
}
/**
 *  设置皮肤名称
 */
+ (void)setSkinName:(NSString *)skinName {
    if (skinName != nil) {
        [[NSUserDefaults standardUserDefaults] setObject:skinName forKey:YRSkinNameKey];
        // 当皮肤改变时给皮肤名称赋值
        YRSkinName = skinName;
        // 更换皮肤的时候重新加载
        [self loadSkinColor];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"skinTools" object:self userInfo:nil];
    }
    
}



/**
 *  根据名称返回颜色
 */
+ (UIColor *)colorWithName:(NSString *)name {
    return YRSkinColors[name];
}

#pragma mark - 私有方法
+ (void)loadSkinColor {
    NSString *colorPlistName = [NSString stringWithFormat:@"skin/%@/SkinColors.plist",YRSkinName];
    NSString *colorPlistPath = [[NSBundle mainBundle] pathForResource:colorPlistName ofType:nil];
    // 颜色字典
    NSDictionary *colorDict = [NSDictionary dictionaryWithContentsOfFile:colorPlistPath];
    for (NSString *key in colorDict) {
        NSString *colorStr = colorDict[key];
        // 去掉空格
        colorStr = [colorStr stringByReplacingOccurrencesOfString:@" " withString:@""];
        // 截取rgba
        NSArray *rgbaStrs = [colorStr componentsSeparatedByString:@","];
        // 转换为RGBA的值
        CGFloat r = [rgbaStrs[0] doubleValue] / 255.0;
        CGFloat g = [rgbaStrs[1] doubleValue] / 255.0;
        CGFloat b = [rgbaStrs[2] doubleValue] / 255.0;
        CGFloat a = [rgbaStrs[3] doubleValue];
        // 颜色
        UIColor *color = [UIColor colorWithRed:r green:g blue:b alpha:a];
        // 把转换后的颜色保存到缓存中
        YRSkinColors[key] = color;
    }
}

@end

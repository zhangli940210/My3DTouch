//
//  LZHeroItem.m
//  my3DTouch
//
//  Created by apple on 16/3/12.
//  Copyright © 2016年 m14a.cn. All rights reserved.
//

#import "LZHeroItem.h"

@implementation LZHeroItem

+ (instancetype)itemWithDict:(NSDictionary *)dict
{
    LZHeroItem *item = [[LZHeroItem alloc] init];
    // KVC
    [item setValuesForKeysWithDictionary:dict];
    return item;
}

- (void)setIcon:(UIImage *)icon
{
    NSString *iconName = (NSString *)icon;
    _icon = [UIImage imageNamed:iconName];
}

@end

//
//  LZHeroItem.h
//  my3DTouch
//
//  Created by apple on 16/3/12.
//  Copyright © 2016年 m14a.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LZHeroItem : NSObject

//头像
@property (nonatomic, strong) UIImage *icon;

//姓名
@property (nonatomic, strong) NSString *name;

//描述
@property (nonatomic, strong) NSString *desc;

+ (instancetype)itemWithDict:(NSDictionary *)dict;

@end

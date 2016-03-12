//
//  AppDelegate.m
//  my3DTouch
//
//  Created by apple on 16/3/12.
//  Copyright © 2016年 m14a.cn. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 设置图标长按时,弹出的样式
    
    // iconWithType:图标的类型
    UIApplicationShortcutIcon *icon0 = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeSearch];
    
    UIApplicationShortcutItem *item0 = [[UIApplicationShortcutItem alloc] initWithType:@"type0" localizedTitle:@"路飞" localizedSubtitle:@"索隆" icon:icon0 userInfo:@{@"info" : @"我是要传入的信息"}];
    
    UIApplicationShortcutItem *item1 = [[UIApplicationShortcutItem alloc] initWithType:@"type1" localizedTitle:@"娜美" localizedSubtitle:@"罗宾" icon:icon0 userInfo:@{@"info" : @"我是要传入的信息"}];
    
    application.shortcutItems = @[item0, item1];
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
    
}

- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler
{
    if ([shortcutItem.type isEqualToString:@"tpye0"]) {
        NSLog(@"%@", shortcutItem.userInfo[@"info"]);
    } else {
        NSLog(@"%@", shortcutItem.userInfo[@"info"]);
    }
}

@end

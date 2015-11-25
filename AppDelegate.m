//
//  AppDelegate.m
//  ZZXLeftMenu
//
//  Created by 邹圳巡 on 15/11/24.
//  Copyright © 2015年 ZZX. All rights reserved.
//

#import "AppDelegate.h"
#import "ZZXViewController.h"
#import "ZZXFirstController.h"
#import "ZZXSecondController.h"
#import "ZZXThirdController.h"
#import "ZZXForthController.h"
#import "ZZXFifthController.h"
#import "ZZXSixthController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    ZZXFirstController *first = [[ZZXFirstController alloc]init];
    ZZXSecondController *second = [[ZZXSecondController alloc]init];
    ZZXThirdController *third = [[ZZXThirdController alloc]init];
    ZZXForthController *forth = [[ZZXForthController alloc]init];
    ZZXFifthController *fifth = [[ZZXFifthController alloc]init];
    ZZXSixthController *sixth = [[ZZXSixthController alloc]init];
    NSArray *titleArray = @[@"新闻",@"订阅",@"图片",@"视频",@"跟帖",@"电台"];
    NSArray *controllerArray = @[first,second,third,forth,fifth,sixth];
    NSArray *colorArray = @[ZZXColorRGBA(202, 68, 73, ZZX_LEFTMENU_ALPHA),ZZXColorRGBA(190, 111, 69, ZZX_LEFTMENU_ALPHA),ZZXColorRGBA(76, 132, 190, ZZX_LEFTMENU_ALPHA),ZZXColorRGBA(101, 170, 78, ZZX_LEFTMENU_ALPHA),ZZXColorRGBA(170, 172, 73, ZZX_LEFTMENU_ALPHA),ZZXColorRGBA(190, 62, 119, ZZX_LEFTMENU_ALPHA)];
    NSArray *iconArray = @[@"sidebar_nav_news",@"sidebar_nav_reading",@"sidebar_nav_photo",@"sidebar_nav_video",@"sidebar_nav_comment",@"sidebar_nav_radio"];
    
    self.window.rootViewController = [[ZZXViewController alloc] initWithTitleArray:titleArray controllerArray:controllerArray colorArray:colorArray iconArray:iconArray];
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

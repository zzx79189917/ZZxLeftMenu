//
//  ZZXNavigationController.m
//  ZZXLeftMenu
//
//  Created by 邹圳巡 on 15/11/24.
//  Copyright © 2015年 ZZX. All rights reserved.
//

#import "ZZXNavigationController.h"

@interface ZZXNavigationController ()

@end

@implementation ZZXNavigationController

+(void)initialize
{
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"top_navigation_background"] forBarMetrics:UIBarMetricsDefault];
}

@end

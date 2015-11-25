//
//  ZZXFirstController.m
//  ZZXLeftMenu
//
//  Created by 邹圳巡 on 15/11/25.
//  Copyright © 2015年 ZZX. All rights reserved.
//

#import "ZZXFirstController.h"

@implementation ZZXFirstController

-(void)viewDidLoad
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, ZZX_UI_SCREEN_WIDTH, ZZX_UI_SCREEN_HEIGHT)];
    label.text = @"第一个视图";
    label.font = [UIFont systemFontOfSize:150];
    label.numberOfLines = 0;
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
}
@end

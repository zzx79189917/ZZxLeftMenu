//
//  ZZXThirdController.m
//  ZZXLeftMenu
//
//  Created by 邹圳巡 on 15/11/25.
//  Copyright © 2015年 ZZX. All rights reserved.
//

#import "ZZXThirdController.h"

@implementation ZZXThirdController
-(void)viewDidLoad
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, ZZX_UI_SCREEN_WIDTH, ZZX_UI_SCREEN_HEIGHT)];
    label.text = @"第三个视图";
    [self.view addSubview:label];
}
@end

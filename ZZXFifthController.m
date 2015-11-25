//
//  ZZXFifthController.m
//  ZZXLeftMenu
//
//  Created by 邹圳巡 on 15/11/25.
//  Copyright © 2015年 ZZX. All rights reserved.
//

#import "ZZXFifthController.h"

@implementation ZZXFifthController
-(void)viewDidLoad
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, ZZX_UI_SCREEN_WIDTH, ZZX_UI_SCREEN_HEIGHT)];
    label.text = @"第五个视图";
    [self.view addSubview:label];
}
@end

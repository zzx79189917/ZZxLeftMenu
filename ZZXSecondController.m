//
//  ZZXSecondController.m
//  ZZXLeftMenu
//
//  Created by 邹圳巡 on 15/11/25.
//  Copyright © 2015年 ZZX. All rights reserved.
//

#import "ZZXSecondController.h"

@implementation ZZXSecondController

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.textLabel.text = @"第二个视图";
    return cell;
}
@end

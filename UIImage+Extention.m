//
//  UIImage+Extention.m
//  ZZXLeftMenu
//
//  Created by 邹圳巡 on 15/11/24.
//  Copyright © 2015年 ZZX. All rights reserved.
//

#import "UIImage+Extention.h"

@implementation UIImage (Extention)
+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGFloat imageW = 100;
    CGFloat imageH = 100;
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(imageW, imageH), NO, 0.0);
    [color set];
    UIRectFill(CGRectMake(0, 0, imageW, imageH));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end

//
//  ZZXLeftMenu.m
//  ZZXLeftMenu
//
//  Created by 邹圳巡 on 15/11/24.
//  Copyright © 2015年 ZZX. All rights reserved.
//

#import "ZZXLeftMenu.h"

@interface ZZXLeftMenu()
@property(nonatomic,weak) UIButton *selectedButton;
@end

@implementation ZZXLeftMenu

-(instancetype)initWithTitleArray:(NSArray *)titleArray color:(NSArray *)colorArray iconArray:(NSArray *)iconArray
{
    if (self=[super init]) {
        self.backgroundColor = [UIColor clearColor];
        for (int i=0; i<titleArray.count; i++) {
            [self buildButtonWithIcon:iconArray[i] title:titleArray[i] bgColor:colorArray[i]];
        }
    }
    return self;
}
/**
 *  布局子控件
 */
- (void)layoutSubviews
{
    [super layoutSubviews];
    NSUInteger subviewCount = self.subviews.count;
    CGFloat btnWidth = self.width;
    CGFloat btnHeight = self.height / subviewCount;
    for (int i = 0; i<subviewCount; i++) {
        UIButton *btn = self.subviews[i];
        btn.width = btnWidth;
        btn.height = btnHeight;
        btn.y = i * btnHeight;
    }
}

-(void)setDelegate:(id<ZZXLeftMenuDelegate>)delegate
{
    _delegate=delegate;
    [self selectbuttonSelect:[self.subviews firstObject]];
}

#pragma mark --添加方法
- (UIButton *)buildButtonWithIcon:(NSString *)iconName title:(NSString *)title bgColor:(UIColor *)bgColor
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.tag = self.subviews.count;
    [button addTarget:self action:@selector(selectbuttonSelect:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    
    [button setImage:[UIImage imageNamed:iconName] forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageWithColor:bgColor] forState:UIControlStateSelected];
    button.titleLabel.font = ZZX_LEFTMENU_ICON_FONT;
    
    button.contentHorizontalAlignment=UIControlContentHorizontalAlignmentLeft;
    
    button.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    
    button.adjustsImageWhenHighlighted=NO;
    
    
    return button;
}

#pragma mark --按钮方法
- (void)selectbuttonSelect:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(ZZXLeftMenu:fromIndex:toIndex:)]) {
        [self.delegate ZZXLeftMenu:self fromIndex:self.selectedButton.tag toIndex:sender.tag];
    }
    self.selectedButton.selected=NO;
    sender.selected=YES;
    self.selectedButton=sender;
}


@end

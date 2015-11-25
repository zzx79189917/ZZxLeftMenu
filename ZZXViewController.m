//
//  ViewController.m
//  ZZXLeftMenu
//
//  Created by 邹圳巡 on 15/11/24.
//  Copyright © 2015年 ZZX. All rights reserved.
//

#import "ZZXViewController.h"
#import "ZZXLeftMenu.h"
#import "ZZXNavigationController.h"

@interface ZZXViewController ()<ZZXLeftMenuDelegate>
{
    NSArray *_titleArray;
    NSArray *_colorArray;
    NSArray *_iconArray;
    NSArray *_controllerArray;
}
@property (nonatomic, weak) ZZXNavigationController *showingNavigationController;
@end

@implementation ZZXViewController

-(instancetype)initWithTitleArray:(NSArray *)titleArray controllerArray:(NSArray *)controllerArray colorArray:(NSArray *)colorArray iconArray:(NSArray *)iconArray{
    _titleArray = titleArray;
    _colorArray = colorArray;
    _iconArray = iconArray;
    _controllerArray = controllerArray;
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *image=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, ZZX_UI_SCREEN_WIDTH, ZZX_UI_SCREEN_HEIGHT)];
    image.image=[UIImage imageNamed:@"sidebar_bg@2x.jpg"];
    [self.view addSubview:image];
    
    for (int i=0; i<_titleArray.count; i++) {
        [self buildViewController:_controllerArray[i] title:_titleArray[i]];
    }
    
    ZZXLeftMenu *leftMenu = [[ZZXLeftMenu alloc]initWithTitleArray:_titleArray color:_colorArray iconArray:_iconArray];
    leftMenu.delegate = self;
    leftMenu.width = ZZX_LEFTMENU_WIDTH;
    leftMenu.height = ZZX_LEFTMENU_HEIGHT;
    leftMenu.y = ZZX_LEFTMENU_Y;
    [self.view addSubview:leftMenu];
    [self.view insertSubview:leftMenu atIndex:1];
}

-(void)buildViewController:(UIViewController *)controller title:(NSString *)title
{
    controller.view.backgroundColor = ZZXRandomColor;
    controller.title = title;
    controller.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"top_navigation_menuicon" target:self action:@selector(leftMenu)];
    ZZXNavigationController *nav = [[ZZXNavigationController alloc]initWithRootViewController:controller];
    [self addChildViewController:nav];
}

#pragma mark --方法
-(void)leftMenu
{
    [UIView animateWithDuration:ZZX_ANIMATION_DURATION_TIME animations:^{
        UIView *showingView = self.showingNavigationController.view;
        
        CGFloat navH = ZZX_UI_SCREEN_HEIGHT - 2 * ZZX_LEFTMENU_Y;
        CGFloat scale = navH / [UIScreen mainScreen].bounds.size.height;

        CGFloat leftMenuMargin = ZZX_UI_SCREEN_WIDTH * (1 - scale) * 0.5;
        CGFloat translateX = ZZX_LEFTMENU_WIDTH - leftMenuMargin;
        
        CGFloat topMargin = [UIScreen mainScreen].bounds.size.height * (1 - scale) * 0.5;
        CGFloat translateY = topMargin - ZZX_LEFTMENU_Y;

        CGAffineTransform scaleForm = CGAffineTransformMakeScale(scale, scale);

        CGAffineTransform translateForm = CGAffineTransformTranslate(scaleForm, translateX / scale, -translateY / scale);
        
        showingView.transform = translateForm;

        UIButton *shut = [[UIButton alloc] init];
        [shut addTarget:self action:@selector(shutLeftMenu:) forControlEvents:UIControlEventTouchUpInside];
        shut.frame = showingView.bounds;
        [showingView addSubview:shut];
    }];
}

#pragma mark --按钮方法
- (void)shutLeftMenu:(UIButton *)sender
{
    [UIView animateWithDuration:ZZX_ANIMATION_DURATION_TIME animations:^{
        self.showingNavigationController.view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [sender removeFromSuperview];
    }];
}

#pragma mark --leftmenu代理
-(void)ZZXLeftMenu:(ZZXLeftMenu *)LeftMenu fromIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex
{
    // 移除旧控制器的view
    ZZXNavigationController *oldNav = self.childViewControllers[fromIndex];
    [oldNav.view removeFromSuperview];
    
    // 显示新控制器的view
    ZZXNavigationController *newNav = self.childViewControllers[toIndex];
    // 设置新控制的transform跟旧控制器一样
    newNav.view.transform = oldNav.view.transform;
    // 设置阴影
    newNav.view.layer.shadowColor = [UIColor blackColor].CGColor;
    newNav.view.layer.shadowOffset = CGSizeMake(-3, 0);
    newNav.view.layer.shadowOpacity = 0.2;
    [self.view addSubview:newNav.view];
    
    // 2.设置当前正在显示的控制器
    self.showingNavigationController = newNav;

    [UIView animateWithDuration:ZZX_ANIMATION_DURATION_TIME animations:^{
        newNav.view.transform = CGAffineTransformIdentity;
    }];
}
@end

//
//  ZZXLeftMenu.h
//  ZZXLeftMenu
//
//  Created by 邹圳巡 on 15/11/24.
//  Copyright © 2015年 ZZX. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZZXLeftMenu;
@protocol ZZXLeftMenuDelegate <NSObject>
@optional
-(void)ZZXLeftMenu:(ZZXLeftMenu *)LeftMenu fromIndex:(NSUInteger )fromIndex toIndex:(NSUInteger )toIndex;
@end

@interface ZZXLeftMenu : UIView
@property(nonatomic,weak) id <ZZXLeftMenuDelegate> delegate;
-(instancetype)initWithTitleArray:(NSArray *)titleArray color:(NSArray *)colorArray iconArray:(NSArray *)iconArray;;
@end

//
//  UITabBar+XLGExtension.m
//  SharenGo
//  Notes：
//
//  Created by Jason_hzb on 2018/5/14.
//  Copyright © 2018年 小灵狗出行. All rights reserved.
//

#import "UITabBar+XLGExtension.h"
#import "UIView+XLGExtension.h"

#define TabbarItemNums  5.0    //tabbar的数量 如果是5个设置为5

@implementation UITabBar (XLGExtension)

//显示小红点附带数字
- (void)showBadgeOnItemIndex:(NSInteger)index andCount:(NSString *)count{
    //移除之前的小红点
    [self removeBadgeOnItemIndex:index];
    
    //新建小红点
    UIView *badgeView = [[UIView alloc] init];
    badgeView.tag = 888 + index;
    badgeView.layer.cornerRadius = 7.5;//圆形
    //    badgeView.backgroundColor = AppThemeColor;
    CGRect tabFrame = self.frame;
    
    //确定小红点的位置
    CGFloat percentX = (index + 0.6) / TabbarItemNums;
    CGFloat x = ceilf(percentX * tabFrame.size.width);
    CGFloat y = ceilf(0.1 * tabFrame.size.height);
    badgeView.frame = CGRectMake(x-3, y, 15.0, 15.0);//圆形大小为10
    badgeView.clipsToBounds = YES;
    [self addSubview:badgeView];
    
    UILabel *countLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, badgeView.width, badgeView.height)];
    countLab.text = count;
    countLab.textColor = [UIColor blackColor];
    countLab.font = [UIFont systemFontOfSize:10];
    countLab.textAlignment = NSTextAlignmentCenter;
    [badgeView addSubview:countLab];
}

//显示小红点
- (void)showBadgeOnItemIndex:(NSInteger)index{
    //移除之前的小红点
    [self removeBadgeOnItemIndex:index];
    
    //新建小红点
    UIView *badgeView = [[UIView alloc]init];
    badgeView.tag = 888 + index;
    badgeView.layer.cornerRadius = 4.0;//圆形
    //    badgeView.backgroundColor = AppThemeColor;
    CGRect tabFrame = self.frame;
    
    //确定小红点的位置
    CGFloat percentX = (index + 0.6) / TabbarItemNums;
    CGFloat x = ceilf(percentX * tabFrame.size.width);
    CGFloat y = ceilf(0.1 * tabFrame.size.height);
    badgeView.frame = CGRectMake(x-3.5, y+1, 8.0, 8.0);//圆形大小为10
    badgeView.clipsToBounds = YES;
    [self addSubview:badgeView];
}

//隐藏小红点
- (void)hideBadgeOnItemIndex:(NSInteger)index{
    //移除小红点
    [self removeBadgeOnItemIndex:index];
}

//移除小红点
- (void)removeBadgeOnItemIndex:(NSInteger)index{
    //按照tag值进行移除
    for (UIView *subView in self.subviews) {
        if (subView.tag == 888+index) {
            [subView removeFromSuperview];
        }
    }
}

@end

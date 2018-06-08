//
//  UILabel+XLGExtension.h
//  SharenGo
//  Notes：UILable 添加一些参数及方法
//
//  Created by Jason_hzb on 2018/5/14.
//  Copyright © 2018年 小灵狗出行. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (XLGExtension)

/**
 字间距
 */
@property (nonatomic, assign) CGFloat characterSpace;

/**
 行间距
 */
@property (nonatomic, assign) CGFloat lineSpace;

/**
 关键字
 */
@property (nonatomic, copy) NSString *keywords;
@property (nonatomic, strong) UIFont *keywordsFont;
@property (nonatomic, strong) UIColor *keywordsColor;

/**
 下划线
 */
@property (nonatomic, copy) NSString *underlineStr;
@property (nonatomic, strong) UIColor *underlineColor;

/**
 计算label宽高，必须调用
 
 @param maxWidth 最大宽度
 @return label的rect
 */
- (CGSize)getLableRectWithMaxWidth:(CGFloat)maxWidth;

@end

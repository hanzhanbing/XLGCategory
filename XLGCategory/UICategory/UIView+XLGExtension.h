//
//  UIView+XLGExtension.h
//  SharenGo
//  Notes：对UIView一些属性和动画的拓展
//
//  Created by Jason_hzb on 2018/5/14.
//  Copyright © 2018年 小灵狗出行. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 * IB_DESIGNABLE：让你的自定义 UIView 可以在 IB 中预览。
 * IBInspectable：让你的自定义 UIView 的属性出现在 IB 中 Attributes inspector。
 */

typedef NS_ENUM(NSInteger , AShowAnimationStyle) {
    AShowAnimationStyleDefault    = 0,
    AShowAnimationStyleLeftShake  ,
    AShowAnimationStyleTopShake   ,
    AShowAnimationStyleNO         ,
};

IB_DESIGNABLE
@interface UIView (XLGExtension)

//扩展frame属性
@property (nonatomic) CGFloat x;           ///< Shortcut for frame.origin.x.
@property (nonatomic) CGFloat y;           ///< Shortcut for frame.origin.y
@property (nonatomic) CGFloat left;        ///< Shortcut for frame.origin.x.
@property (nonatomic) CGFloat top;         ///< Shortcut for frame.origin.y
@property (nonatomic) CGFloat right;       ///< Shortcut for frame.origin.x + frame.size.width
@property (nonatomic) CGFloat bottom;      ///< Shortcut for frame.origin.y + frame.size.height
@property (nonatomic) CGFloat width;       ///< Shortcut for frame.size.width.
@property (nonatomic) CGFloat height;      ///< Shortcut for frame.size.height.
@property (nonatomic) CGFloat centerX;     ///< Shortcut for center.x
@property (nonatomic) CGFloat centerY;     ///< Shortcut for center.y
@property (nonatomic) CGPoint origin;      ///< Shortcut for frame.origin.
@property (nonatomic) CGSize  size;        ///< Shortcut for frame.size.

//扩展layer属性
@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;
@property (nonatomic, assign) IBInspectable CGFloat borderWidth;
@property (nonatomic, strong) IBInspectable UIColor *borderColor;

/**
 Returns the view's view controller (may be nil).
 */
@property (nullable, nonatomic, readonly) UIViewController *viewController;

/**
 是否显示在主窗口
 */
- (BOOL)isShowingOnKeyWindow;

/**
 UIView动画样式
 
 @param animationStyle 样式枚举
 */
- (void)setShowAnimationWithStyle:(AShowAnimationStyle)animationStyle;

/**
 单独显示某一侧的边框线
 */
- (void)setBorderWithView:(UIView *)view top:(BOOL)top left:(BOOL)left bottom:(BOOL)bottom right:(BOOL)right borderColor:(UIColor *)color borderWidth:(CGFloat)width;

/**
 画倾斜渐变视图
 */
- (void)drawLinearGradient:(CGContextRef)context
                      path:(CGPathRef)path
                startColor:(CGColorRef)startColor
                  endColor:(CGColorRef)endColor;

/**
 设置控件阴影样式
 */
- (void)setViewShadowColor:(UIColor *)shadowColor
             shadowOpacity:(CGFloat)shadowOpacity
                shadowBlur:(CGFloat)shadowBlur
              shadowOffset:(CGSize)shadowOffset;

@end

//
//  UIButton+XLGExtension.m
//  XLGCategoryDemo
//  Notes：
//
//  Created by Jason_hzb on 2018/6/28.
//  Copyright © 2018年 小灵狗出行. All rights reserved.
//

#import "UIButton+XLGExtension.h"

@implementation UIButton (XLGExtension)

/**
 *  设置button内部的image和title的布局样式
 *
 *  @param style 布局样式
 *  @param space 间距
 */
- (void)layoutButtonWithEdgeInsetsStyle:(ButtonEdgeInsetsStyle)style imageTitleSpace:(CGFloat)space {
    
    //1、得到imageView和titleLabel的宽、高
    CGFloat imageWidth = self.imageView.frame.size.width;
    CGFloat imageHeight = self.imageView.frame.size.height;
    
    CGFloat labelWidth = 0;
    CGFloat labelHeight = 0;
    if([UIDevice currentDevice].systemVersion.floatValue >=8.0) {
        //由于iOS8中titleLabel的size为0，分开设置
        labelWidth = self.titleLabel.intrinsicContentSize.width;
        labelHeight = self.titleLabel.intrinsicContentSize.height;
    } else {
        labelWidth = self.titleLabel.frame.size.width;
        labelHeight = self.titleLabel.frame.size.height;
    }
    //2、声明全局的imageEdgeInsets和labelEdgeInsets
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;
    
    //3、根据style和space设置
    switch (style) {
        case ButtonEdgeInsetsStyleTop:
            imageEdgeInsets = UIEdgeInsetsMake(-labelHeight-space/2.0, 0, 0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWidth, -imageHeight-space/2.0, 0);
            break;
        case ButtonEdgeInsetsStyleLeft:
            imageEdgeInsets = UIEdgeInsetsMake(0, -space/2.0, 0, space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, space/2.0, 0, space/2.0);
            break;
        case ButtonEdgeInsetsStyleBottom:
            imageEdgeInsets = UIEdgeInsetsMake(0, 0, -labelHeight-space/2.0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(-labelHeight-space/2.0, 0, 0, imageWidth);
            break;
        case ButtonEdgeInsetsStyleRight:
            imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth+space/2.0, 0, -labelWidth-space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWidth - space/2.0, 0, imageWidth+space/2.0);
            break;
            
        default:
            break;
    }
    
    self.titleEdgeInsets = labelEdgeInsets;
    self.imageEdgeInsets = imageEdgeInsets;
}

+ (UIButton *)rightBarButtonItemWithTitle:(NSString *)title
                                    image:(UIImage *)image
                              highlighted:(UIImage *)highlightedImage
                               frameWidth:(CGFloat)width
                               frameHight:(CGFloat)hight
                            setTitleColor:(UIColor *)setColor
                                   target:(id)target
                                 selector:(SEL)selector {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, width, hight);
    [button setTitle:title forState:UIControlStateNormal];
    if (setColor) {
        [button setTitleColor:setColor forState:UIControlStateNormal];
        [button setTitleColor:setColor forState:UIControlStateHighlighted];
    } else {
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    [button.titleLabel setFont:[UIFont fontWithName:@"Arial" size:15.0f]];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    [button setImage:image forState:UIControlStateNormal];
    [button setImage:highlightedImage forState:UIControlStateHighlighted];
    return button;
}

+ (UIButton *)leftBarButtonItemWithTitle:(NSString *)title
                                   image:(UIImage *)image
                             highlighted:(UIImage *)highlightedImage
                              frameWidth:(CGFloat)width
                              frameHight:(CGFloat)hight
                           setTitleColor:(UIColor *)setColor
                                  target:(id)target
                                selector:(SEL)selector {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, width, hight);
    [button setTitle:title forState:UIControlStateNormal];
    if (setColor) {
        [button setTitleColor:setColor forState:UIControlStateNormal];
        [button setTitleColor:setColor forState:UIControlStateHighlighted];
    } else {
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    [button.titleLabel setFont:[UIFont fontWithName:@"Arial" size:15]];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    [button setImage:image forState:UIControlStateNormal];
    [button setImage:highlightedImage forState:UIControlStateHighlighted];
    return button;
}

+ (UIButton *)buttonWithType:(UIButtonType)type frame:(CGRect)frame cornerRadius:(CGFloat)cornerRadius backgroundImage:(UIImage *)backgroundImage target:(id)target andAction:(SEL)selector {
    UIButton * button = [UIButton buttonWithType:type];
    button.frame = frame;
    button.layer.cornerRadius = cornerRadius;
    button.layer.masksToBounds = YES;
    [button setBackgroundImage:backgroundImage forState:UIControlStateNormal];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    return button;
}

+ (UIButton *)buttonWithType:(UIButtonType)type frame:(CGRect)frame cornerRadius:(CGFloat)cornerRadius backgroundImage:(UIImage *)backgroundImage tag:(NSInteger)tag target:(id)target andAction:(SEL)selector {
    UIButton * button = [UIButton buttonWithType:type];
    button.frame = frame;
    button.layer.cornerRadius = cornerRadius;
    button.layer.masksToBounds = YES;
    [button setBackgroundImage:backgroundImage forState:UIControlStateNormal];
    button.tag = tag;
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    return button;
}

+ (UIButton *)buttonWithType:(UIButtonType)type frame:(CGRect)frame cornerRadius:(CGFloat)cornerRadius backgroundColor:(UIColor *)backgroundColor tag:(NSInteger)tag target:(id)target andAction:(SEL)selector {
    UIButton * button = [UIButton buttonWithType:type];
    button.frame = frame;
    button.layer.cornerRadius = cornerRadius;
    button.layer.masksToBounds = YES;
    [button setBackgroundColor:backgroundColor];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    button.tag = tag;
    return button;
}

+ (UIButton *)buttonWithType:(UIButtonType)type frame:(CGRect)frame cornerRadius:(CGFloat)cornerRadius backgroundColor:(UIColor *)backgroundColor target:(id)target andAction:(SEL)selector {
    UIButton * button = [UIButton buttonWithType:type];
    button.frame = frame;
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = cornerRadius;
    [button setBackgroundColor:backgroundColor];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    return button;
}

+ (UIButton *)buttonWithType:(UIButtonType)type frame:(CGRect)frame normalBackgroundImage:(UIImage *)normalBackgroundImage selectedBackgroundImage:(UIImage *)selectedBackgroundImage target:(id)target andAction:(SEL)selector {
    UIButton * button = [UIButton buttonWithType:type];
    button.frame = frame;
    [button setBackgroundImage:normalBackgroundImage forState:UIControlStateNormal];
    [button setBackgroundImage:selectedBackgroundImage forState:UIControlStateSelected];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    return button;
}

+ (UIButton *)buttonWithType:(UIButtonType)type frame:(CGRect)frame normalBackgroundImage:(UIImage *)normalBackgroundImage selectedBackgroundImage:(UIImage *)selectedBackgroundImage tag:(NSInteger)tag target:(id)target andAction:(SEL)selector {
    UIButton * button = [UIButton buttonWithType:type];
    button.frame = frame;
    [button setBackgroundImage:normalBackgroundImage forState:UIControlStateNormal];
    [button setBackgroundImage:selectedBackgroundImage forState:UIControlStateSelected];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    button.tag = tag;
    return button;
}

+ (UIButton *)buttonWithType:(UIButtonType)type frame:(CGRect)frame title:(NSString *)title normalTitleColor:(UIColor *)normalTitleColor highlightedColor:(UIColor *)highlightedColor tag:(NSInteger)tag target:(id)target andAction:(SEL)selector {
    UIButton * button = [UIButton buttonWithType:type];
    button.frame = frame;
    [button setTitleColor:normalTitleColor forState:UIControlStateNormal];
    [button setTitleColor:highlightedColor forState:UIControlStateHighlighted];
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    button.tag = tag;
    return button;
}

+ (UIButton *)buttonWithType:(UIButtonType)type frame:(CGRect)frame title:(NSString *)title normalTitleColor:(UIColor *)normalTitleColor highlightedColor:(UIColor *)highlightedColor target:(id)target andAction:(SEL)selector {
    UIButton * button = [UIButton buttonWithType:type];
    button.frame = frame;
    [button setTitleColor:normalTitleColor forState:UIControlStateNormal];
    [button setTitleColor:highlightedColor forState:UIControlStateSelected];
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    return button;
}

+ (UIButton *)buttonWithType:(UIButtonType)type frame:(CGRect)frame title:(NSString *)title cornerRadius:(CGFloat)cornerRadius normalTitleColor:(UIColor *)normalTitleColor borderColor:(UIColor *)color target:(id)target andAction:(SEL)selector {
    UIButton * button = [UIButton buttonWithType:type];
    button.frame = frame;
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = cornerRadius;
    button.layer.borderWidth = 1;
    button.layer.borderColor = color.CGColor;
    [button setTitleColor:normalTitleColor forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    return button;
}

+ (UIButton *)buttonWithType:(UIButtonType)type frame:(CGRect)frame cornerRadius:(CGFloat)cornerRadius backgroundColor:(UIColor *)backgroundColor title:(NSString *)title normalTitleColor:(UIColor *)normalTitleColor highlightedTitleColor:(UIColor *)highlightedTitleColor font:(CGFloat)font target:(id)target andAction:(SEL)selector {
    UIButton * button = [UIButton buttonWithType:type];
    button.frame = frame;
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = cornerRadius;
    [button setBackgroundColor:backgroundColor];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:normalTitleColor forState:UIControlStateNormal];
    [button setTitleColor:highlightedTitleColor forState:UIControlStateHighlighted];
    button.titleLabel.font = [UIFont systemFontOfSize:font];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    return button;
}

+ (UIButton *)buttonWithType:(UIButtonType)type frame:(CGRect)frame cornerRadius:(CGFloat)cornerRadius backgroundColor:(UIColor *)backgroundColor title:(NSString *)title normalTitleColor:(UIColor *)normalTitleColor highlightedTitleColor:(UIColor *)highlightedTitleColor font:(CGFloat)font tag:(NSInteger)tag target:(id)target andAction:(SEL)selector {
    UIButton * button = [UIButton buttonWithType:type];
    button.frame = frame;
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = cornerRadius;
    [button setBackgroundColor:backgroundColor];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:normalTitleColor forState:UIControlStateNormal];
    [button setTitleColor:highlightedTitleColor forState:UIControlStateHighlighted];
    button.titleLabel.font = [UIFont systemFontOfSize:font];
    button.tag = tag;
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    return button;
}

@end

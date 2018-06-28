//
//  UIImage+XLGExtension.h
//  SharenGo
//  Notes：UIImage的一些图片处理方法
//
//  Created by Jason_hzb on 2018/5/14.
//  Copyright © 2018年 小灵狗出行. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (XLGExtension)

#pragma mark - 视图快照
+ (UIImage *)snapshotSingleView:(UIView *)view;

#pragma mark - 颜色转换成图片
+ (UIImage *)imageWithColor:(UIColor *)color;

#pragma mark - 颜色渐变
+ (UIImage *)gradientFromColor:(UIColor *)c1 toColor:(UIColor *)c2 withHeight:(int)height;

#pragma mark - 纠正图片的方向
- (UIImage *)fixOrientation;

#pragma mark - 按给定的方向旋转图片
- (UIImage*)rotate:(UIImageOrientation)orient;

#pragma mark - 垂直翻转
- (UIImage *)flipVertical;

#pragma mark - 水平翻转
- (UIImage *)flipHorizontal;

#pragma mark - 将图片旋转degrees角度
- (UIImage *)imageRotatedByDegrees:(CGFloat)degrees;

#pragma mark - 将图片旋转radians弧度
- (UIImage *)imageRotatedByRadians:(CGFloat)radians;

#pragma mark - UIImage缩放到固定的尺寸，新图片通过返回值返回
- (UIImage *)imageScaledToSize:(CGSize)newSize;

#pragma mark - UIImage缩放到固定的Frame，新图片通过返回值返回
- (UIImage *)imageScaledToRect:(CGRect)newRect;

#pragma mark - UIImage按比例将宽度高度差异小的一方缩放到指定的大小，然后截取另一方，使其跟newSize一样大
- (UIImage *)imageScaledInterceptToSize:(CGSize)newSize withNeed2x:(BOOL)need2x;

#pragma mark - UIImage缩放到固定的尺寸，高度宽度按照大的一边算
- (UIImage *)imageScaledToBigFixedSize:(CGSize)newSize;

#pragma mark - UIImage尺寸不足添黑边处理
- (UIImage *)imageBlackBackGroundToSize:(CGSize)newSize;

#pragma mark - UIImage图案填充到指定size
- (UIImage *)imageFillToSize:(CGSize)newSize;

#pragma mark - UIImage左右两点拉伸
- (UIImage *)imageStretchToSize:(CGSize)newSize withX1:(float)x1 withX2:(float)x2 y:(float)y;

@end

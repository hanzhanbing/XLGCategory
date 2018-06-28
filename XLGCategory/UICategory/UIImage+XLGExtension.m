//
//  UIImage+XLGExtension.m
//  SharenGo
//  Notes：
//
//  Created by Jason_hzb on 2018/5/14.
//  Copyright © 2018年 小灵狗出行. All rights reserved.
//

#import "UIImage+XLGExtension.h"

//由角度转换弧度
#define kDegreesToRadian(x)      (M_PI * (x) / 180.0)
//由弧度转换角度
#define kRadianToDegrees(radian) (radian * 180.0) / (M_PI)

@implementation UIImage (XLGExtension)

//视图快照
+ (UIImage *)snapshotSingleView:(UIView *)view {
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, YES, 0);
    [view drawViewHierarchyInRect:view.bounds afterScreenUpdates:YES];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

//颜色转换成图片
+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

//颜色渐变
+ (UIImage *)gradientFromColor:(UIColor *)c1 toColor:(UIColor *)c2 withHeight:(int)height {
    CGSize size = CGSizeMake(1, height);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    
    NSArray *colors = [NSArray arrayWithObjects:(id) c1.CGColor, (id) c2.CGColor, nil];
    CGGradientRef gradient = CGGradientCreateWithColors(colorspace, (CFArrayRef) colors, NULL);
    CGContextDrawLinearGradient(context, gradient, CGPointMake(0, 0), CGPointMake(0, size.height), 0);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorspace);
    UIGraphicsEndImageContext();
    return image;
}

/** 纠正图片的方向 */
- (UIImage *)fixOrientation
{
    if (self.imageOrientation == UIImageOrientationUp) return self;
    
    // We need to calculate the proper transformation to make the image upright.
    // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    switch (self.imageOrientation)
    {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.width, self.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, self.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        case UIImageOrientationUp:
        case UIImageOrientationUpMirrored:
            break;
    }
    
    switch (self.imageOrientation)
    {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        case UIImageOrientationUp:
        case UIImageOrientationDown:
        case UIImageOrientationLeft:
        case UIImageOrientationRight:
            break;
    }
    
    // Now we draw the underlying CGImage into a new context, applying the transform
    // calculated above.
    CGContextRef ctx = CGBitmapContextCreate(NULL, self.size.width, self.size.height,
                                             CGImageGetBitsPerComponent(self.CGImage), 0,
                                             CGImageGetColorSpace(self.CGImage),
                                             CGImageGetBitmapInfo(self.CGImage));
    CGContextConcatCTM(ctx, transform);
    
    switch (self.imageOrientation)
    {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            CGContextDrawImage(ctx, CGRectMake(0,0,self.size.height,self.size.width), self.CGImage);
            break;
            
        default:
            CGContextDrawImage(ctx, CGRectMake(0,0,self.size.width,self.size.height), self.CGImage);
            break;
    }
    
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    
    return img;
}

/** 按给定的方向旋转图片 */
- (UIImage*)rotate:(UIImageOrientation)orient
{
    CGRect bnds = CGRectZero;
    UIImage* copy = nil;
    CGContextRef ctxt = nil;
    CGImageRef imag = self.CGImage;
    CGRect rect = CGRectZero;
    CGAffineTransform tran = CGAffineTransformIdentity;
    
    rect.size.width = CGImageGetWidth(imag);
    rect.size.height = CGImageGetHeight(imag);
    
    bnds = rect;
    
    switch (orient)
    {
        case UIImageOrientationUp:
            return self;
            
        case UIImageOrientationUpMirrored:
            tran = CGAffineTransformMakeTranslation(rect.size.width, 0.0);
            tran = CGAffineTransformScale(tran, -1.0, 1.0);
            break;
            
        case UIImageOrientationDown:
            tran = CGAffineTransformMakeTranslation(rect.size.width,
                                                    rect.size.height);
            tran = CGAffineTransformRotate(tran, M_PI);
            break;
            
        case UIImageOrientationDownMirrored:
            tran = CGAffineTransformMakeTranslation(0.0, rect.size.height);
            tran = CGAffineTransformScale(tran, 1.0, -1.0);
            break;
            
        case UIImageOrientationLeft:
            bnds = swapWidthAndHeight(bnds);
            tran = CGAffineTransformMakeTranslation(0.0, rect.size.width);
            tran = CGAffineTransformRotate(tran, 3.0 * M_PI / 2.0);
            break;
            
        case UIImageOrientationLeftMirrored:
            bnds = swapWidthAndHeight(bnds);
            tran = CGAffineTransformMakeTranslation(rect.size.height,
                                                    rect.size.width);
            tran = CGAffineTransformScale(tran, -1.0, 1.0);
            tran = CGAffineTransformRotate(tran, 3.0 * M_PI / 2.0);
            break;
            
        case UIImageOrientationRight:
            bnds = swapWidthAndHeight(bnds);
            tran = CGAffineTransformMakeTranslation(rect.size.height, 0.0);
            tran = CGAffineTransformRotate(tran, M_PI / 2.0);
            break;
            
        case UIImageOrientationRightMirrored:
            bnds = swapWidthAndHeight(bnds);
            tran = CGAffineTransformMakeScale(-1.0, 1.0);
            tran = CGAffineTransformRotate(tran, M_PI / 2.0);
            break;
            
        default:
            return self;
    }
    
    UIGraphicsBeginImageContext(bnds.size);
    ctxt = UIGraphicsGetCurrentContext();
    
    switch (orient)
    {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            CGContextScaleCTM(ctxt, -1.0, 1.0);
            CGContextTranslateCTM(ctxt, -rect.size.height, 0.0);
            break;
            
        default:
            CGContextScaleCTM(ctxt, 1.0, -1.0);
            CGContextTranslateCTM(ctxt, 0.0, -rect.size.height);
            break;
    }
    
    CGContextConcatCTM(ctxt, tran);
    CGContextDrawImage(UIGraphicsGetCurrentContext(), rect, imag);
    
    copy = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return copy;
}

/** 垂直翻转 */
- (UIImage *)flipVertical
{
    return [self rotate:UIImageOrientationDownMirrored];
}

/** 水平翻转 */
- (UIImage *)flipHorizontal
{
    return [self rotate:UIImageOrientationUpMirrored];
}

/** 将图片旋转弧度radians */
- (UIImage *)imageRotatedByRadians:(CGFloat)radians
{
    // calculate the size of the rotated view's containing box for our drawing space
    UIView *rotatedViewBox = [[UIView alloc] initWithFrame:CGRectMake(0,0,self.size.width, self.size.height)];
    CGAffineTransform t = CGAffineTransformMakeRotation(radians);
    rotatedViewBox.transform = t;
    CGSize rotatedSize = rotatedViewBox.frame.size;
    
    // Create the bitmap context
    UIGraphicsBeginImageContext(rotatedSize);
    CGContextRef bitmap = UIGraphicsGetCurrentContext();
    
    // Move the origin to the middle of the image so we will rotate and scale around the center.
    CGContextTranslateCTM(bitmap, rotatedSize.width/2, rotatedSize.height/2);
    
    //   // Rotate the image context
    CGContextRotateCTM(bitmap, radians);
    
    // Now, draw the rotated/scaled image into the context
    CGContextScaleCTM(bitmap, 1.0, -1.0);
    CGContextDrawImage(bitmap, CGRectMake(-self.size.width / 2, -self.size.height / 2, self.size.width, self.size.height), [self CGImage]);
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

/** 将图片旋转角度degrees */
- (UIImage *)imageRotatedByDegrees:(CGFloat)degrees
{
    return [self imageRotatedByRadians:kDegreesToRadian(degrees)];
}

/** 交换宽和高 */
static CGRect swapWidthAndHeight(CGRect rect)
{
    CGFloat swap = rect.size.width;
    
    rect.size.width = rect.size.height;
    rect.size.height = swap;
    
    return rect;
}

//UIImage缩放到固定的尺寸，新图片通过返回值返回
- (UIImage *)imageScaledToSize:(CGSize)newSize
{
    UIGraphicsBeginImageContext(newSize);
    [self drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

//UIImage缩放到固定的Frame，新图片通过返回值返回
- (UIImage *)imageScaledToRect:(CGRect)newRect
{
    struct CGImage *cgImage = CGImageCreateWithImageInRect([self CGImage], newRect);
    UIImage *newImage = [UIImage imageWithCGImage:cgImage];
    
    // 要释放，否则会保留original image
    CGImageRelease(cgImage);
    return newImage;
}

//UIImage尺寸不足添黑边处理
- (UIImage *)imageBlackBackGroundToSize:(CGSize)newSize
{
    UIImage *image = [self imageScaledToBigFixedSize:newSize];
    UIGraphicsBeginImageContext(newSize);
    UIImage *backGroundImage = [UIImage imageNamed:@"5pix_blackImage.png"];
    [backGroundImage drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    [image drawInRect:CGRectMake((newSize.width-image.size.width)/2, (newSize.height-image.size.height)/2, image.size.width, image.size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

//UIImage缩放到固定的尺寸，高度宽度按照大的一边算
- (UIImage *)imageScaledToBigFixedSize:(CGSize)newSize
{
    CGFloat heightMultiple = self.size.height/newSize.height;
    CGFloat widthMultiple = self.size.width/newSize.width;
    if (widthMultiple > heightMultiple) {
        CGSize scaledSize = CGSizeMake(newSize.width, self.size.height/widthMultiple);
        return [self imageScaledToSize:scaledSize];
    } else {
        CGSize scaledSize = CGSizeMake(self.size.width/heightMultiple, newSize.height);
        return [self imageScaledToSize:scaledSize];
    }
}

//UIImage按比例将宽度高度差异小的一方缩放到指定的大小，然后截取另一方，使其跟newSize一样大
- (UIImage *)imageScaledInterceptToSize:(CGSize)newSize withNeed2x:(BOOL)need2x
{
    if (need2x)
    {
        newSize = CGSizeMake(newSize.width*2, newSize.height*2);
    }
    CGFloat heightMultiple = self.size.height/newSize.height;
    CGFloat widthMultiple = self.size.width/newSize.width;
    if (heightMultiple<widthMultiple) {
        CGSize scaledSize = CGSizeMake(self.size.width/heightMultiple, newSize.height);
        UIImage *scaledImage = [self imageScaledToSize:scaledSize];
        
        UIImage *newImage = [scaledImage imageScaledToRect:CGRectMake((scaledSize.width-newSize.width)/2, 0, newSize.width, newSize.height)];
        return newImage;
    } else {
        CGSize scaledSize = CGSizeMake(newSize.width, self.size.height/widthMultiple);
        UIImage *scaledImage = [self imageScaledToSize:scaledSize];
        
        UIImage *newImage = [scaledImage imageScaledToRect:CGRectMake(0, (scaledSize.height-newSize.height)/2, newSize.width, newSize.height)];
        return newImage;
    }
}

//UIImage图案填充到指定size
- (UIImage *)imageFillToSize:(CGSize)newSize
{
    UIGraphicsBeginImageContext(newSize);
    CGSize imageSize = self.size;
    int iCount = newSize.width/imageSize.width+1;
    int jCount = newSize.height/imageSize.height+1;
    for (int i = 0; i < iCount; i++)
    {
        for (int j = 0; j < jCount; j++)
        {
            [self drawInRect:CGRectMake(i*imageSize.width, j*imageSize.height, imageSize.width, imageSize.height)];
        }
    }
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    newImage = [newImage imageScaledToRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    return newImage;
}

//UIImage左右两点拉伸
- (UIImage *)imageStretchToSize:(CGSize)newSize withX1:(float)x1 withX2:(float)x2 y:(float)y
{
    UIImage *leftImage = [self imageScaledToRect:CGRectMake(0, 0, x1*2, self.size.height*2)];
    
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"leftImage"];
    [UIImageJPEGRepresentation(leftImage, 1) writeToFile:path atomically:YES];
    
    UIImage *leftStrechImage = [self imageScaledToRect:CGRectMake(x1*2-1, 0, 1, self.size.height*2)];
    path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"leftStrechImage"];
    [UIImageJPEGRepresentation(leftStrechImage, 1) writeToFile:path atomically:YES];
    
    UIImage *centerImage = [self imageScaledToRect:CGRectMake(x1*2, 0, x2*2-x1*2, self.size.height*2)];
    path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"centerImage"];
    [UIImageJPEGRepresentation(centerImage, 1) writeToFile:path atomically:YES];
    
    UIImage *rightImage = [self imageScaledToRect:CGRectMake(x2*2, 0, self.size.width*2-x2*2, self.size.height*2)];
    path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"rightImage"];
    [UIImageJPEGRepresentation(rightImage, 1) writeToFile:path atomically:YES];
    
    UIImage *rightStrechImage = [self imageScaledToRect:CGRectMake(x2*2, 0, 2, self.size.height*2)];
    path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"rightStrechImage"];
    [UIImageJPEGRepresentation(rightStrechImage, 1) writeToFile:path atomically:YES];
    
    float width = (newSize.width - self.size.width)/2;
    
    
    UIGraphicsBeginImageContext(CGSizeMake(newSize.width*2, newSize.height*2));
    float currentX = 0;
    //左
    [leftImage drawInRect:CGRectMake(0, 0, leftImage.size.width, leftImage.size.height)];
    currentX = leftImage.size.width;
    for (int i = 0; i < width; i++)
    {
        [leftStrechImage drawInRect:CGRectMake(currentX+i, 0, 1, leftStrechImage.size.height)];
    }
    currentX += width;
    //中
    [centerImage drawInRect:CGRectMake(currentX, 0, centerImage.size.width, centerImage.size.height)];
    currentX += centerImage.size.width;
    //右
    for (int i = 0; i < width; i++)
    {
        [rightStrechImage drawInRect:CGRectMake(currentX+i, 0, 1, rightStrechImage.size.height)];
    }
    currentX += width;
    [rightImage drawInRect:CGRectMake(currentX, 0, rightImage.size.width, rightImage.size.height)];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end

//
//  UIImage+VIRound.m
//  VIImageWorkerDemo
//
//  Created by Vito on 4/22/16.
//  Copyright © 2016 Meitu. All rights reserved.
//

#import "UIImage+VIRound.h"

@implementation UIImage (VIRound)

- (UIImage *)vi_applyRoundedCorners {
    CGFloat squareSize = MIN(self.size.width, self.size.height);
    
    CGRect rect = CGRectMake(0, 0, squareSize, squareSize);
    
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, self.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSaveGState(context);
    CGContextAddEllipseInRect(context, rect);
    CGContextClip(context);
    
    CGPoint drawPoint = CGPointMake(-(self.size.width - squareSize) / 2,
                                    -(self.size.height - squareSize) / 2);
    [self drawAtPoint:drawPoint];
    CGContextRestoreGState(context);
    
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return result;
}

- (UIImage *)vi_applyCornerRadius:(CGFloat)radius {
    CGFloat w = self.size.width;
    CGFloat h = self.size.height;
    
    // 防止圆角半径小于0，或者大于宽/高中较小值的一半。
    if (radius < 0) {
        radius = 0;
    } else if (radius > MIN(w, h)) {
        radius = MIN(w, h) / 2.;
    }
    
    UIImage *image = nil;
    CGRect imageFrame = CGRectMake(0, 0, w, h);
    UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
    [[UIBezierPath bezierPathWithRoundedRect:imageFrame cornerRadius:radius] addClip];
    [self drawInRect:imageFrame];
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}




@end

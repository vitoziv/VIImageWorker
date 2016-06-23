//
//  UIImage+VIBlur.h
//  VIImageWorkerDemo
//
//  Created by Vito on 4/22/16.
//  Copyright © 2016 Meitu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (VIBlur)

- (UIImage *)vi_applyBlurWithRadius:(CGFloat)blurRadius
                            tintColor:(UIColor *)tintColor
                saturationDeltaFactor:(CGFloat)saturationDeltaFactor
                            maskImage:(UIImage *)maskImage;

@end

//
//  UIImage+VIResize.h
//  VIImageWorkerDemo
//
//  Created by Vito on 4/22/16.
//  Copyright © 2016 Meitu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (VIResize)

- (UIImage *)vi_resizedImageWithContentMode:(UIViewContentMode)contentMode
                                       bounds:(CGSize)bounds
                         interpolationQuality:(CGInterpolationQuality)quality;

@end

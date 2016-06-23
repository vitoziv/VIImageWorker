//
//  UIImage+VIRound.h
//  VIImageWorkerDemo
//
//  Created by Vito on 4/22/16.
//  Copyright © 2016 Meitu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (VIRound)

- (UIImage *)vi_applyRoundedCorners;
- (UIImage *)vi_applyCornerRadius:(CGFloat)radius;

@end

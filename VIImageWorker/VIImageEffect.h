//
//  VIImageEffect.h
//  VIImageWorkerDemo
//
//  Created by Vito on 4/19/16.
//  Copyright © 2016 Meitu. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;
#import "VIIdentifierProtocol.h"

typedef NS_ENUM(NSUInteger, VIBlurImageEffectType) {
    VIBlurImageEffectTypeLightEffect = 0,
    VIBlurImageEffectTypeWhiteLightEffect,
    VIBlurImageEffectTypeExtraLightEffect,
    VIBlurImageEffectTypeDarkEffect
};

@protocol VIImageEffectDelegate <NSObject>

- (UIImage *)applyEffect:(UIImage *)image;

@end

@interface VIImageEffect : NSObject <VIImageEffectDelegate, VIIdentifierProtocol>

+ (instancetype)roundEffect;
+ (instancetype)cornerEffectWithRadius:(CGFloat)radius;
+ (instancetype)resizeEffectWithUISize:(CGSize)UISize contentMode:(UIViewContentMode)contentMode;

+ (instancetype)blurEffectWithType:(VIBlurImageEffectType)type;
+ (instancetype)blurEffectWithRadius:(CGFloat)radius
                           tintColor:(UIColor *)tintColor
               saturationDeltaFactor:(CGFloat)saturationDeltaFactor
                           maskImage:(UIImage *)maskImage;

@end

//
//  VIImageEffect.m
//  VIImageWorkerDemo
//
//  Created by Vito on 4/19/16.
//  Copyright © 2016 Meitu. All rights reserved.
//

#import "VIImageEffect.h"
#import "UIImage+VIRound.h"
#import "UIImage+VIResize.h"
#import "UIImage+VIBlur.h"

#pragma mark - VIRadiusImageEffect

@interface VIRadiusImageEffect : VIImageEffect

@property (nonatomic) CGFloat radius;
- (instancetype)initWithRadius:(CGFloat)radius;

@end

@implementation VIRadiusImageEffect

- (instancetype)initWithRadius:(CGFloat)radius {
    self = [super init];
    if (self) {
        _radius = radius;
    }
    return self;
}

- (UIImage *)applyEffect:(UIImage *)image {
    CGFloat scale = [UIScreen mainScreen].scale;
    CGFloat radius = self.radius * scale;
    image = [image vi_applyCornerRadius:radius];
    return image;
}

@end


#pragma mark - VIBlurImageEffect

@interface VIBlurImageEffect : VIImageEffect

@property (nonatomic) CGFloat radius;
@property (nonatomic, strong) UIColor *tintColor;
@property (nonatomic) CGFloat saturationDeltaFactor;
@property (nonatomic) UIImage *maskImage;

- (instancetype)initWithType:(VIBlurImageEffectType)type;
- (instancetype)initWithRadius:(CGFloat)radius
                     tintColor:(UIColor *)tintColor
         saturationDeltaFactor:(CGFloat)saturationDeltaFactor
                     maskImage:(UIImage *)maskImage;

@end

@implementation VIBlurImageEffect

- (instancetype)initWithType:(VIBlurImageEffectType)type {
    UIColor *tintColor;
    CGFloat radius = 20;
    CGFloat saturationDeltaFactor = 1.8;
    switch (type) {
        case VIBlurImageEffectTypeLightEffect: {
            tintColor = [UIColor colorWithRed:0.157 green:0.157 blue:0.157 alpha:.3f];
            radius = 30;
        }
            break;
        case VIBlurImageEffectTypeWhiteLightEffect: {
            tintColor = [UIColor colorWithRed:.98 green:.98 blue:.98 alpha:0.85];
        }
            break;
        case VIBlurImageEffectTypeExtraLightEffect: {
            tintColor = [UIColor colorWithWhite:0.97 alpha:0.82];
        }
            break;
        case VIBlurImageEffectTypeDarkEffect: {
            tintColor = [UIColor colorWithWhite:0.11 alpha:0.73];
        }
            break;
        default:
            return nil;
            break;
    }
    
    return [self initWithRadius:radius tintColor:tintColor saturationDeltaFactor:saturationDeltaFactor maskImage:nil];
}

- (instancetype)initWithRadius:(CGFloat)radius tintColor:(UIColor *)tintColor saturationDeltaFactor:(CGFloat)saturationDeltaFactor maskImage:(UIImage *)maskImage  {
    self = [super init];
    if (self) {
        _radius = radius;
        _tintColor = tintColor;
        _saturationDeltaFactor = saturationDeltaFactor;
        _maskImage = maskImage;
    }
    return self;
}

- (UIImage *)applyEffect:(UIImage *)image {
    image = [image vi_applyBlurWithRadius:self.radius tintColor:self.tintColor saturationDeltaFactor:self.saturationDeltaFactor maskImage:self.maskImage];
    return image;
}

- (NSString *)identifier {
    NSString *identifier = [NSString stringWithFormat:@"%@:{%@, %@, %@}",
                            [super identifier], @(self.radius), [self.tintColor description], @(self.saturationDeltaFactor)];
    return identifier;
}

@end

#pragma mark - VIResizeImageEffect

@interface VIResizeImageEffect : VIImageEffect

@property (nonatomic) CGSize UISize;
@property (nonatomic) UIViewContentMode contentMode;

- (instancetype)initWithUISize:(CGSize)UISize contentMode:(UIViewContentMode)contentMode;

@end

@implementation VIResizeImageEffect

- (instancetype)initWithUISize:(CGSize)UISize contentMode:(UIViewContentMode)contentMode {
    self = [super init];
    if (self) {
        _contentMode = contentMode;
        _UISize = UISize;
    }
    return self;
}

- (UIImage *)applyEffect:(UIImage *)image {
    CGFloat scale = [UIScreen mainScreen].scale;
    CGFloat width = self.UISize.width * scale;
    CGFloat height = self.UISize.height * scale;
    image = [image vi_resizedImageWithContentMode:self.contentMode
                                             bounds:CGSizeMake(width, height)
                               interpolationQuality:kCGInterpolationHigh];
    return image;
}

- (NSString *)identifier {
    NSString *identifier = [NSString stringWithFormat:@"%@:{%@, %@}", [super identifier], NSStringFromCGSize(self.UISize), @(self.contentMode)];
    return identifier;
}

@end

#pragma mark - VIRoundImageEffect

@interface VIRoundImageEffect : VIImageEffect

@end

@implementation VIRoundImageEffect

- (UIImage *)applyEffect:(UIImage *)image {
    return [image vi_applyRoundedCorners];
}

@end



@implementation VIImageEffect

- (NSString *)identifier {
    return NSStringFromClass(self.class);
}

- (UIImage *)applyEffect:(UIImage *)image {
    NSAssert(NO, @"Implement by subclass");
    return image;
}

+ (instancetype)roundEffect {
    return [VIRoundImageEffect new];
}

+ (instancetype)cornerEffectWithRadius:(CGFloat)radius {
    return [[VIRadiusImageEffect alloc] initWithRadius:radius];
}

+ (instancetype)resizeEffectWithUISize:(CGSize)UISize contentMode:(UIViewContentMode)contentMode {
    return [[VIResizeImageEffect alloc] initWithUISize:UISize contentMode:contentMode];
}

+ (instancetype)blurEffectWithType:(VIBlurImageEffectType)type {
    return [[VIBlurImageEffect alloc] initWithType:type];
}

+ (instancetype)blurEffectWithRadius:(CGFloat)radius
                           tintColor:(UIColor *)tintColor
               saturationDeltaFactor:(CGFloat)saturationDeltaFactor
                           maskImage:(UIImage *)maskImage {
    return [[VIBlurImageEffect alloc] initWithRadius:radius
                                            tintColor:tintColor
                                saturationDeltaFactor:saturationDeltaFactor
                                            maskImage:maskImage];
}

@end


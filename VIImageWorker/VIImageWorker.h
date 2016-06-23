//
//  VIImageWorker.h
//  VIImageWorkerDemo
//
//  Created by Vito on 4/19/16.
//  Copyright © 2016 Meitu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VIImageEffect.h"

@class UIImage;

@interface VIImageWorker : NSObject <VIIdentifierProtocol>

- (instancetype)initWithEffect:(VIImageEffect *)effect;
- (instancetype)initWithEffects:(NSArray<VIImageEffect *> *)effects;

- (VIImageWorker *)appendEffect:(VIImageEffect *)effect;
- (VIImageWorker *)appendEffects:(NSArray<VIImageEffect *> *)effects;

- (UIImage *)appleyEffectsToImage:(UIImage *)image;

@end

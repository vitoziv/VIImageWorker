//
//  VIImageWorker.m
//  VIImageWorkerDemo
//
//  Created by Vito on 4/19/16.
//  Copyright © 2016 Meitu. All rights reserved.
//

#import "VIImageWorker.h"

@interface VIImageWorker ()

@property (nonatomic, strong) NSMutableArray<VIImageEffect *> *effects;

@end

@implementation VIImageWorker

- (instancetype)init {
    self = [super init];
    if (self) {
        _effects = [NSMutableArray array];
    }
    return self;
}

- (instancetype)initWithEffect:(VIImageEffect *)effect {
    return [self initWithEffects:@[effect]];
}

- (instancetype)initWithEffects:(NSArray<VIImageEffect *> *)effects {
    self = [self init];
    if (self) {
        [_effects addObjectsFromArray:effects];
    }
    return self;
}

- (VIImageWorker *)appendEffect:(VIImageEffect *)effect {
    [self.effects addObject:effect];
    return self;
}
- (VIImageWorker *)appendEffects:(NSArray<VIImageEffect *> *)effects {
    [self.effects addObjectsFromArray:effects];
    return self;
}

- (UIImage *)appleyEffectsToImage:(UIImage *)image {
    for (VIImageEffect *effect in self.effects) {
        image = [effect applyEffect:image];
    }
    return image;
}

#pragma mark - VIIdentifierProtocol

- (NSString *)identifier {
    NSMutableString *name = [NSMutableString string];
    [self.effects enumerateObjectsUsingBlock:^(VIImageEffect * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx > 0) {
            [name appendString:@", "];
        }
        [name appendString:obj.identifier];
    }];
    return name;
}


@end

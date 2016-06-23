# VIImageWorker

VIImageWorker 是处理图片行为的封装，比较适合用在为图片添加多种处理时使用

## CocoaPods

使用 Pod 引入：`pod 'VIImageWorker'`

## 如何使用

    VIIWImageEffect *resizeEffect = [VIIWImageEffect resizeEffectWithUISize:self.workerImageView.bounds.size contentMode:self.workerImageView.contentMode];
    VIIWImageEffect *blurEffect = [VIIWImageEffect blurEffectWithType:MPIBlurImageEffectTypeLightEffect];
    VIIWImageEffect *cornorEffect = [VIIWImageEffect cornerEffectWithRadius:20];
    NSArray *effects = @[resizeEffect, blurEffect, cornorEffect];
    VIIWImageWorker *imageWorker = [[VIIWImageWorker alloc] initWithEffects:effects];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
        UIImage *effectImage = [imageWorker appleyEffectsToImage:image];
        
        dispatch_async(dispatch_get_main_queue(), ^(void) {
            self.workerImageView.image = effectImage;
        });
    });

## 扩展 Effect

如果已有的 Effect 不能满足需求，可以自己写 Effect 类。
继承 `VIImageEffect` 类，实现 `applyEffect:` 方法就可以。



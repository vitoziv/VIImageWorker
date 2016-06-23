//
//  ViewController.m
//  VIImageWorkerDemo
//
//  Created by Vito on 6/23/16.
//  Copyright © 2016 Vito. All rights reserved.
//

#import "ViewController.h"
#import "VIImageWorker.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UIImageView *workerImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *image = [UIImage imageNamed:@"1.jpg"];
    
    self.imageView.image = image;
    
    VIImageEffect *resizeEffect = [VIImageEffect resizeEffectWithUISize:self.workerImageView.bounds.size contentMode:self.workerImageView.contentMode];
    VIImageEffect *blurEffect = [VIImageEffect blurEffectWithType:VIBlurImageEffectTypeLightEffect];
    VIImageEffect *cornorEffect = [VIImageEffect cornerEffectWithRadius:20];
    NSArray *effects = @[resizeEffect, blurEffect, cornorEffect];
    VIImageWorker *imageWorker = [[VIImageWorker alloc] initWithEffects:effects];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
        UIImage *effectImage = [imageWorker appleyEffectsToImage:image];
        
        dispatch_async(dispatch_get_main_queue(), ^(void) {
            self.workerImageView.image = effectImage;
        });
    });
}

@end

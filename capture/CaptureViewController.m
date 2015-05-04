//
//  ViewController.m
//  capture
//
//  Created by Diego Watanabe on 4/13/15.
//  Copyright (c) 2015 blorgod. All rights reserved.
//

#import "CaptureViewController.h"
#import "GlitchKit.h"
#import <FastttCamera.h>

@interface CaptureViewController () <FastttCameraDelegate>
@property (nonatomic, strong) FastttCamera *fastCamera;

@end

@implementation CaptureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _fastCamera = [FastttCamera new];
    self.fastCamera.delegate = self;
    
    [self.fastCamera willMoveToParentViewController:self];
    [self.fastCamera beginAppearanceTransition:YES animated:NO];
    [self addChildViewController:self.fastCamera];
    [self.view addSubview:self.fastCamera.view];
    [self.fastCamera didMoveToParentViewController:self];
    [self.fastCamera endAppearanceTransition];
    
    self.fastCamera.view.frame = _pictureView.frame;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cameraButtonTouch:(id)sender {
    [self.fastCamera takePicture];
}
- (void)cameraController:(FastttCamera *)cameraController
didFinishScalingCapturedImage:(FastttCapturedImage *)capturedImage
{
    /**
     *  Here, capturedImage.scaledImage contains the scaled-down version
     *  of the image.
     */
    [self performSegueWithIdentifier:@"toWarning" sender:self];
}


@end


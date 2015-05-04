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
    NSData *imgData = UIImageJPEGRepresentation(capturedImage.scaledImage, 1); // 1 is compression quality
    
    // Identify the home directory and file name
    NSString  *jpgPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/Test.jpg"];
    
    // Write the file.  Choose YES atomically to enforce an all or none write. Use the NO flag if partially written files are okay which can occur in cases of corruption
    [imgData writeToFile:jpgPath atomically:YES];
    [self performSegueWithIdentifier:@"toWarning" sender:self];
}


@end


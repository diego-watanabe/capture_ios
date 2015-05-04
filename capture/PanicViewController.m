//
//  PanicViewController.m
//  capture
//
//  Created by Diego Watanabe on 4/13/15.
//  Copyright (c) 2015 blorgod. All rights reserved.
//

#import "PanicViewController.h"
#import "GlitchKit.h"

@interface PanicViewController ()

@end

@implementation PanicViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self performSelector:@selector(glitchKernelText) withObject:nil afterDelay:1.0];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)glitchKernelText{
    _kernelText.hidden=YES;
    [self performSelector:@selector(showPermissionViewController) withObject:nil afterDelay:.1];
}
- (void)showPermissionViewController{
    _kernelText.hidden = NO;
    [self performSegueWithIdentifier:@"permission" sender:self];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

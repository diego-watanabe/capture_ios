//
//  PanicViewController.m
//  capture
//
//  Created by Diego Watanabe on 4/13/15.
//  Copyright (c) 2015 blorgod. All rights reserved.
//

#import "PanicViewController.h"

@interface PanicViewController ()

@end

@implementation PanicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    UIView *topView = window.rootViewController.view;
    topView.alpha = 0;
    
    
    [UIView animateWithDuration:.5 delay:0 options:UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse animations:^{
        topView.alpha = 1;
    } completion:nil];
    [self performSelector:@selector(showPermissionViewController) withObject:nil afterDelay:5.0];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)showPermissionViewController{
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

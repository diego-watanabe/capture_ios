//
//  LoadingViewController.m
//  capture
//
//  Created by Diego Watanabe on 4/13/15.
//  Copyright (c) 2015 blorgod. All rights reserved.
//

#import "LoadingViewController.h"

@interface LoadingViewController ()

@end

@implementation LoadingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _progressBar.progress = 0.0;
    _progressValue = 0.0f;
    [self increaseProgressValue];
    [self performSelector:@selector(showPanicViewController) withObject:nil afterDelay:5.0];
    // Do any additional setup after loading the view.
}
-(void)increaseProgressValue{
    if(_progressBar.progress<1)
    {
        
        _progressValue = _progressValue+0.1;
        
        _progressBar.progress = _progressValue;
        
        [self performSelector:@selector(increaseProgressValue) withObject:self afterDelay:0.2];
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)showPanicViewController{
    [self performSegueWithIdentifier:@"panic" sender:self];
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

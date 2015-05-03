//
//  ResultsViewController.m
//  capture
//
//  Created by Diego Watanabe on 5/2/15.
//  Copyright (c) 2015 blorgod. All rights reserved.
//

#import "ResultsViewController.h"

@interface ResultsViewController ()

@end

@implementation ResultsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    defaults = [NSUserDefaults standardUserDefaults];
    // Do any additional setup after loading the view.
    NSLog(@"%@", [defaults objectForKey:@"test"]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)userButtonTouchUpInside:(id)sender {
    _displayDetails.hidden = NO;
    _displayDetails.backgroundColor = [UIColor greenColor];
}
- (IBAction)networkButtonTouchUpInside:(id)sender {
}

- (IBAction)exitDetailsTouchUpInside:(id)sender {
    _displayDetails.hidden = YES;
}
- (IBAction)captureButtonTouchUpInside:(id)sender {
}

- (IBAction)storeButtonTouchUpInside:(id)sender {
}
@end

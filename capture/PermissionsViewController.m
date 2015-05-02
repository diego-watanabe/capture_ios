//
//  PermissionsViewController.m
//  capture
//
//  Created by Diego Watanabe on 5/2/15.
//  Copyright (c) 2015 blorgod. All rights reserved.
//

#import "PermissionsViewController.h"

@interface PermissionsViewController ()

@end

@implementation PermissionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    defaults = [NSUserDefaults standardUserDefaults];
    // Do any additional setup after loading the view.
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

- (IBAction)captureTouchUpInside:(id)sender {
    emotionalState = _emotionalStateString.text;
    brandPreferences = _brandPreferencesString.text;
    [defaults setObject:emotionalState forKey:@"emotion"];
    [defaults setObject:brandPreferences forKey:@"brand"];
}
@end

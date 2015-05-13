//
//  PermissionViewController.m
//  capture
//
//  Created by Diego Watanabe on 4/13/15.
//  Copyright (c) 2015 blorgod. All rights reserved.
//

#import "PermissionViewController.h"

@interface PermissionViewController ()

@end

@implementation PermissionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _denyString.hidden = YES;
    _dontString.hidden = YES;
    _sudoString.hidden = YES;
    _kernelString.hidden = YES;
    _aliveString.hidden = YES;
    _notString.hidden = YES;
    _firstPanic.hidden = YES;
    _secondPanic.hidden = YES;
    _thirdPanic.hidden = YES;
    _fourthPanic.hidden = YES;

    [self locationPrompt];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
        if (alertView.tag == 0)//location
        {
            if (buttonIndex == 0)
            {
                NSLog(@"You have clicked Cancel");
                [self performSegueWithIdentifier:@"home" sender:self];
            
            }
            else if(buttonIndex == 1)
            {
                NSLog(@"You have clicked GOO");
                _denyString.hidden = NO;
                _dontString.hidden = NO;
                _recoveryTextLabel.text = @"RECOVERY: 10%... 40%...";
                [self contactPrompt];
            }
        }
        else if(alertView.tag == 1)
        {
            if (buttonIndex == 0)
            {
                NSLog(@"You have clicked Cancel");
                [self performSegueWithIdentifier:@"home" sender:self];

            }
            else if(buttonIndex == 1)
            {
                NSLog(@"You have clicked GOO");
                _sudoString.hidden = NO;
                _recoveryTextLabel.text = @"RECOVERY: 10%... 40%... 70%...";
                [self photoPrompt];
            }
        }
        else if(alertView.tag == 2)
        {
            if (buttonIndex == 0)
            {
                NSLog(@"You have clicked Cancel");
                [self performSegueWithIdentifier:@"home" sender:self];

            }
            else if(buttonIndex == 1)
            {
                NSLog(@"You have clicked GOO");
                _kernelString.hidden = NO;
                _aliveString.hidden = NO;
                _notString.hidden = NO;
                _firstPanic.hidden = NO;
                _secondPanic.hidden = NO;
                _thirdPanic.hidden = NO;
                _fourthPanic.hidden = NO;
                _recoveryTextLabel.text = @"RECOVERY: 10%... 40%... 70%... 99%...";
                [self systemPrompt];
            }
        }
        else if(alertView.tag == 3)
        {
            if (buttonIndex == 0)
            {
                NSLog(@"You have clicked Cancel");
                [self performSegueWithIdentifier:@"home" sender:self];

            }
            else if(buttonIndex == 1)
            {
                NSLog(@"You have clicked GOO");
                 [self performSegueWithIdentifier:@"result" sender:self];
            
            }
        }
}
-(void)locationPrompt
{
    UIAlertView * alert =[[UIAlertView alloc ] initWithTitle:@""
                                                     message:@"Allow Capture to Access your Location While Using the App?"
                                                    delegate:self
                                           cancelButtonTitle:@"NO"
                                           otherButtonTitles: nil];
    [alert addButtonWithTitle:@"Allow"];
    alert.tag = 0;
    [alert show];
}

-(void)contactPrompt
{
    UIAlertView * alert =[[UIAlertView alloc ] initWithTitle:@""
                                                     message:@"Allow Capture to Access your Contacts While Using the App?"
                                                    delegate:self
                                           cancelButtonTitle:@"NO"
                                           otherButtonTitles: nil];
    [alert addButtonWithTitle:@"Allow"];
    alert.tag = 1;
    [alert show];
}
-(void)photoPrompt
{
    UIAlertView * alert =[[UIAlertView alloc ] initWithTitle:@""
                                                     message:@"Allow Capture to Access your Photos While Using the App?"
                                                    delegate:self
                                           cancelButtonTitle:@"NO"
                                           otherButtonTitles: nil];
    [alert addButtonWithTitle:@"Allow"];
    alert.tag = 2;
    [alert show];
}
-(void)systemPrompt
{
    UIAlertView * alert =[[UIAlertView alloc ] initWithTitle:@""
                                                     message:@"Allow Capture to Access your System While Using the App?"
                                                    delegate:self
                                           cancelButtonTitle:@"NO"
                                           otherButtonTitles: nil];
    [alert addButtonWithTitle:@"Allow"];
    alert.tag = 3;
    [alert show];
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

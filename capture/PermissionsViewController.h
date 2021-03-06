//
//  PermissionsViewController.h
//  capture
//
//  Created by Diego Watanabe on 5/2/15.
//  Copyright (c) 2015 blorgod. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface PermissionsViewController : UIViewController{
    NSString *emotionalState;
    NSString *brandPreferences;
    User *user;
}
@property (weak, nonatomic) IBOutlet UITextField *emotionalStateString;
@property (weak, nonatomic) IBOutlet UITextField *brandPreferencesString;
- (IBAction)captureTouchUpInside:(id)sender;

@end

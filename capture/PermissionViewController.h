//
//  PermissionViewController.h
//  capture
//
//  Created by Diego Watanabe on 4/13/15.
//  Copyright (c) 2015 blorgod. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PermissionViewController : UIViewController <UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *recoveryTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *denyString;
@property (weak, nonatomic) IBOutlet UILabel *dontString;
@property (weak, nonatomic) IBOutlet UILabel *sudoString;
@property (weak, nonatomic) IBOutlet UILabel *kernelString;
@property (weak, nonatomic) IBOutlet UILabel *aliveString;
@property (weak, nonatomic) IBOutlet UILabel *notString;
@property (weak, nonatomic) IBOutlet UILabel *firstPanic;
@property (weak, nonatomic) IBOutlet UILabel *secondPanic;
@property (weak, nonatomic) IBOutlet UILabel *thirdPanic;
@property (weak, nonatomic) IBOutlet UILabel *fourthPanic;

@end

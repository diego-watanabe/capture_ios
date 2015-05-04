//
//  ViewController.h
//  capture
//
//  Created by Diego Watanabe on 4/13/15.
//  Copyright (c) 2015 blorgod. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface CaptureViewController : UIViewController {
    User *user;
}

- (IBAction)cameraButtonTouch:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *pictureView;



@end


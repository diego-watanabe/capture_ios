//
//  ResultsViewController.h
//  capture
//
//  Created by Diego Watanabe on 5/2/15.
//  Copyright (c) 2015 blorgod. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultsViewController : UIViewController{
    NSMutableDictionary *quotes;
    NSUserDefaults *defaults;
    NSString *detailsTitle;
    NSString *detailsBody;
}
@property (weak, nonatomic) IBOutlet UIButton *userButton;
- (IBAction)userButtonTouchUpInside:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *displayDetails;
@property (weak, nonatomic) IBOutlet UIButton *networkButton;
@property (weak, nonatomic) IBOutlet UIButton *captureButton;
- (IBAction)captureButtonTouchUpInside:(id)sender;
- (IBAction)storeButtonTouchUpInside:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *storeButton;
@property (nonatomic, retain) NSMutableDictionary *quotes;
@property (weak, nonatomic) IBOutlet UIView *imageButton;
@property (weak, nonatomic) IBOutlet UIButton *imageButtonTouchUpInside;
- (IBAction)networkButtonTouchUpInside:(id)sender;
- (IBAction)exitDetailsTouchUpInside:(id)sender;
@end

//
//  ResultsViewController.h
//  capture
//
//  Created by Diego Watanabe on 5/2/15.
//  Copyright (c) 2015 blorgod. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ALSystem.h"

@interface ResultsViewController : UIViewController{
    NSMutableDictionary *quotes;
    NSUserDefaults *defaults;
    NSString *detailsTitle;
    NSString *detailsBody;
    NSString *networkStatus;
    NSString *signalStrength;
    NSString *security;
    NSString *ipAddress;
    NSString *fileType;
    NSString *createdAt;
    NSString *dimensions;
    NSString *colorSpace;
    NSString *colorProfile;
    NSString *emotionalState;
    NSString *memory;
    NSString *processor;
    NSString *carrier;
    NSString *name;
    NSString *capacity;
    NSString *available;
    NSString *version;
    NSString *serial;
    NSString *model;
}

@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;
@property (weak, nonatomic) IBOutlet UILabel *label4;
@property (weak, nonatomic) IBOutlet UILabel *label5;
@property (weak, nonatomic) IBOutlet UILabel *label6;
@property (weak, nonatomic) IBOutlet UILabel *label7;
@property (weak, nonatomic) IBOutlet UILabel *label8;
@property (weak, nonatomic) IBOutlet UILabel *label9;
@property (weak, nonatomic) IBOutlet UILabel *label10;
@property (weak, nonatomic) IBOutlet UILabel *result1;
@property (weak, nonatomic) IBOutlet UILabel *result2;
@property (weak, nonatomic) IBOutlet UILabel *result3;

@property (weak, nonatomic) IBOutlet UILabel *result4;
@property (weak, nonatomic) IBOutlet UILabel *result5;
@property (weak, nonatomic) IBOutlet UILabel *result6;

@property (weak, nonatomic) IBOutlet UILabel *result7;
@property (weak, nonatomic) IBOutlet UILabel *result8;
@property (weak, nonatomic) IBOutlet UILabel *result9;
@property (weak, nonatomic) IBOutlet UILabel *result10;

@property (weak, nonatomic) IBOutlet UILabel *detailsTitleLabel;
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
- (IBAction)imageButtonTouchUpInside:(id)sender;
- (IBAction)networkButtonTouchUpInside:(id)sender;
- (IBAction)exitDetailsTouchUpInside:(id)sender;
@end

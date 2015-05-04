//
//  LoadingViewController.h
//  capture
//
//  Created by Diego Watanabe on 4/13/15.
//  Copyright (c) 2015 blorgod. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoadingViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIProgressView *progressBar;
@property (nonatomic) float progressValue;
@end

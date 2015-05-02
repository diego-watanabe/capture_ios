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
}
@property (nonatomic, retain) NSMutableDictionary *quotes;
@end

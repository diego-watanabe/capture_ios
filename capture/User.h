//
//  User.h
//  capture
//
//  Created by Diego Watanabe on 5/4/15.
//  Copyright (c) 2015 blorgod. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "JSONModel.h"

@interface User : JSONModel {
    NSString *emotionString;
    NSString *brandString;
    UIImage *userImage;
}
@property (nonatomic, retain) NSString *emotionString;
@property (nonatomic, retain) NSString *brandString;
@property (nonatomic, retain) UIImage *userImage;

+(id)sharedUser;

@end

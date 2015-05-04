//
//  User.m
//  capture
//
//  Created by Diego Watanabe on 5/4/15.
//  Copyright (c) 2015 blorgod. All rights reserved.
//

#import "User.h"


@implementation User

@synthesize brandString;
@synthesize emotionString;
@synthesize userImage;

+ (id) sharedUser {
    static User *sharedUser= nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedUser = [[self alloc] init];
    });
    return sharedUser;
}

- (id)init {
    if (self = [super init]){
        brandString = @"brands";
        emotionString = @"feelings";
        userImage = [UIImage imageNamed:@"alfredo"];
    }
    return self;
}

- (void)dealloc {
    
}

@end

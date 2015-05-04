//
//  ResultsViewController.m
//  capture
//
//  Created by Diego Watanabe on 5/2/15.
//  Copyright (c) 2015 blorgod. All rights reserved.
//

#import "ResultsViewController.h"

@interface ResultsViewController ()

@end

@implementation ResultsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    defaults = [NSUserDefaults standardUserDefaults];
    // Do any additional setup after loading the view.
    NSLog(@"%@", [defaults objectForKey:@"test"]);
    _displayDetails.hidden = YES;
    [self loadUserData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)loadUserData {
    name = [ALHardware deviceName];
    memory = [NSString stringWithFormat:@"%f",[ALMemory activeMemory]];
    processor = [ALHardware cpu];
    capacity = [ALDisk totalDiskSpace];
    available = [ALDisk freeDiskSpace];
    model = [ALHardware deviceModel];
    version = [ALHardware systemVersion];
}
-(void)loadStoreData{
    
}
-(void)loadCaptureData{
    
}
-(void)loadNetworkData{
    
}
-(void)loadImageData{
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)userButtonTouchUpInside:(id)sender {
    _displayDetails.hidden = NO;
    _displayDetails.backgroundColor = [self colorWithHexString:@"2fa21d"];
    _detailsTitleLabel.text = @"USER INFORMATION";
    _label1.text = @"Name";
    _label2.text = @"Applications";
    _label3.text = @"Capacity";
    _label4.text = @"Available";
    _label5.text = @"OS Version";
    _label6.text = @"Model";
    _label7.text = @"Memory";
    _label8.hidden = YES;
    _label9.hidden = YES;
    _label10.hidden = YES;
    
    _result1.text = name;
    _result2.text = @"4";
    _result3.text = capacity;
    _result4.text = available;
    _result5.text = version;
    _result6.text = model;
    _result7.text = memory;
    _result8.hidden = YES;
    _result9.hidden = YES;
    _result10.hidden = YES;

    

}
- (IBAction)networkButtonTouchUpInside:(id)sender {
    _displayDetails.hidden = NO;
    _displayDetails.backgroundColor = [UIColor darkGrayColor];//[self colorWithHexString:@"e6e6e6"];
}


- (IBAction)captureButtonTouchUpInside:(id)sender {
    _displayDetails.hidden = NO;
    _displayDetails.backgroundColor = [self colorWithHexString:@"0054a6"];
}

- (IBAction)storeButtonTouchUpInside:(id)sender {
    _displayDetails.hidden = NO;
    _displayDetails.backgroundColor = [self colorWithHexString:@"65338c"];
    _detailsTitleLabel.text = @"APP STORE";

//    [_label1 setFont:[UIFont fontWithName:@"Menlo" size: 11]];
//    [_label2 setFont:[UIFont fontWithName:@"Menlo" size: 11]];
//    [_label3 setFont:[UIFont fontWithName:@"Menlo" size: 11]];
//    [_label4 setFont:[UIFont fontWithName:@"Menlo" size: 11]];
//    [_label5 setFont:[UIFont fontWithName:@"Menlo" size: 11]];
//    [_label6 setFont:[UIFont fontWithName:@"Menlo" size: 11]];
//    [_label7 setFont:[UIFont fontWithName:@"Menlo" size: 11]];
    
    _label8.hidden = YES;
    _label9.hidden = YES;
    _label10.hidden = YES;

    
    _label1.text = @"Opened July 10, 2008";
    _label2.text = @"$10billion worth of capital generated in 2014";
    _label3.text = @"$500million spent on iOS apps in the first week of January 2015";
    _label4.text = @"Cumulative developer revenues are $25billion(2014)";
    _label5.text = @"Making 2014 revenues 40% of total app sales.";
    _label6.text = @"627,000 jobs created in the US(2014)";
    _label7.text = @"The 1.4 million iOS app catalog is sold in 155 countries(2014)";
    
}
- (IBAction)imageButtonTouchUpInside:(id)sender {
    _displayDetails.hidden = NO;
    _displayDetails.backgroundColor = [self colorWithHexString:@"ff0000"];
}
- (IBAction)exitDetailsTouchUpInside:(id)sender {
    _displayDetails.hidden = YES;
    
    _label1.text = @"";
    _label2.text = @"";
    _label3.text = @"";
    _label4.text = @"";
    _label5.text = @"";
    _label6.text = @"";
    _label7.text = @"";
    _label8.text = @"";
    _label9.text = @"";
    _label10.text = @"";
    
    _result1.text = @"";
    _result2.text = @"";
    _result3.text = @"";
    _result4.text = @"";
    _result5.text = @"";
    _result6.text = @"";
    _result7.text = @"";
    _result8.text = @"";
    _result9.text = @"";
    _result10.text = @"";
}

-(UIColor*)colorWithHexString:(NSString*)hex
{
    NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor grayColor];
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    
    if ([cString length] != 6) return  [UIColor grayColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}


@end

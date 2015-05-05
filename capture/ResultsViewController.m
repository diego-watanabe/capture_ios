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
    // Do any additional setup after loading the view.
    _displayDetails.hidden = YES;
    user = [User sharedUser];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)loadUserData {
    name = [ALHardware deviceName];
    memory = [NSString stringWithFormat:@"%ld",(long)[ALMemory totalMemory]];
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
    networkStatus = [self checkConnections];
    signalStrength = [ALNetwork cellIPAddress];
    mac = [ALNetwork macAddress];
    ipAddress = [ALNetwork currentIPAddress];
    externalIP = [ALNetwork externalIPAddress];
    internalIP = [ALNetwork cellIPAddress];
    
}
-(NSString*)checkConnections{
    if([ALNetwork connectedVia3G]){
        return @"CONNECTED";
    }else {
        return @"UNAVAILABLE";
    }
}
-(NSString*)wifiConnection{
    if([ALNetwork connectedViaWiFi]){
        return @"CONNECTED";
    }else {
        return @"UNAVAILABLE";
    }
}
-(void)loadImageData{
    _imageView.image = [UIImage imageNamed:@"alfredo"];
    fileType = @"JPG";
    fileSize = @"1.23MB";
    dimensions = [NSString stringWithFormat:@"%iX%i", (int)user.userImage.size.width, (int)user.userImage.size.height];
    colorSpace = [NSString stringWithFormat:@"%li", (long)user.userImage.renderingMode];
    colorProfile = [NSString stringWithFormat:@"%@", user.indexPropertyName];
    emotionalState = user.emotionString;
    brands = user.brandString;
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
    [self loadUserData];
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
    _label8.text = @"";
    _label9.text = @"";
    _label10.text = @"";
    _label11.text = @"";
    
    _result1.text = name;
    _result2.text = @"4";
    _result3.text = capacity;
    _result4.text = available;
    _result5.text = version;
    _result6.text = model;
    _result7.text = memory;
    _result8.text = @"";
    _result9.text = @"";
    _result10.text = @"";
}
- (IBAction)networkButtonTouchUpInside:(id)sender {
    [self loadNetworkData];
    _displayDetails.hidden = NO;
    _displayDetails.backgroundColor = [UIColor darkGrayColor];//[self colorWithHexString:@"e6e6e6"];
    _detailsTitleLabel.text = @"NETWORK";

    _label1.text = @"4G Status";
    _label2.text = @"MAC";
    _label3.text = @"Cell IP";
    _label4.text = @"External IP";
    _label5.text = @"Current IP";
    _label6.text = @"WIFI Status";
    _label7.text = @"";
    _label8.text = @"";
    _label9.text = @"";
    _label10.text = @"";
    _label11.text = @"";
    
    _result1.text = networkStatus;
    _result2.text = mac;
    _result3.text = internalIP;
    _result4.text = externalIP;
    _result5.text = ipAddress;
    _result6.text = [self wifiConnection];
    _result7.text = @"";
    _result8.text = @"";
    _result9.text = @"";
    _result10.text = @"";
}


- (IBAction)captureButtonTouchUpInside:(id)sender {
    _displayDetails.hidden = NO;
    _displayDetails.backgroundColor = [self colorWithHexString:@"0054a6"];
    _detailsTitleLabel.text = @"CAPTURE";

    _label1.text = @"Released:";
    _label2.text = @"By:";
    _label3.text = @"Language:";
    _label4.text = @"Store Status:";
    _label5.text = @"Source Code:";
    _label6.text = @"";
    _label7.text = @"Statement:";
    _label8.text = @"To provide the latest and most";
    _label9.text = @"sophisticated experience in image";
    _label10.text = @"capture technology.You will never";
    _label11.text = @"look at your images the same way again!!";
    
    _result1.text = @"May 2015";
    _result2.text = @"Alfredo Domador, Diego Watanabe";
    _result3.text = @"Objective-C";
    _result4.text = @"REJECTED";
    _result5.text = @"?!?!!??!";
    _result6.text = @"";
    _result7.text = @"";
    _result8.text = @"";
    _result9.text = @"";
    _result10.text = @"";
}

- (IBAction)storeButtonTouchUpInside:(id)sender {
    _displayDetails.hidden = NO;
    _displayDetails.backgroundColor = [self colorWithHexString:@"65338c"];
    _detailsTitleLabel.text = @"APP STORE";
    _longtext.hidden = NO;
    _longtext.text = @"Opened July 10, 2008\n\n\n$500 million spent on iOS apps in first week of January 2015\nCumulative developer revenues were $25,000,000,000\n(making 2014 revenues 40% of all app sales since store opened in 2008)\n\n\n627,000 job created in the US(2014)\n\n\n1.4 million iOS apps catalog is sold in 155 countries(2014)\n\nFor further inquiries:\nhttp://www.asymco.com/2015/01/22/bigger-than-hollywood";
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
    _label11.text = @"";

    
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
- (IBAction)imageButtonTouchUpInside:(id)sender {
    [self loadImageData];
    _displayDetails.hidden = NO;
    _displayDetails.backgroundColor = [self colorWithHexString:@"ff0000"];
    _detailsTitleLabel.text = @"IMAGE INFORMATION";
    
    _label1.text = @"Kind";
    _label2.text = @"Image Size";
    _label3.text = @"Image Dimensions";
    _label4.text = @"Rendering Mode";
    _label5.text = @"Color Profile";
    _label6.text = @"Emotional State";
    _label7.text = @"Brand(s)";
    _label8.text = @"";
    _label9.text = @"";
    _label10.text = @"";
    _label11.text = @"";

    
    _result1.text = fileType;
    _result2.text = fileSize;
    _result3.text = dimensions;
    _result4.text = colorSpace;
    _result5.text = colorProfile;
    _result6.text = emotionalState;
    _result7.text = brands;
    _result8.text = @"";
    _result9.text = @"";
    _result10.text = @"";
    
}
- (IBAction)exitDetailsTouchUpInside:(id)sender {
    _displayDetails.hidden = YES;
    _longtext.hidden = YES;
    _imageView.hidden = YES;
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
    _label11.text = @"";

    
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


- (IBAction)recoverImage:(id)sender {
    if(displaying){
        displaying = NO;
        _imageView.hidden = YES;
    }
    else {
        displaying = YES;
        _imageView.hidden = NO;
    }
    
    
}
@end

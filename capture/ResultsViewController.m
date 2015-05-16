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
    displaying = NO;
    _displayDetails.hidden = YES;
    //recovery buttons
    _recoveryButton.hidden = YES;
    _topRightRecovery.hidden = YES;
    _bottomRightRecovery.hidden = YES;
    _bottomLeftRecovery.hidden = YES;
    
    user = [User sharedUser];
    _imageView.image = user.userImage;
    timer = [NSTimer scheduledTimerWithTimeInterval:5.0
                                             target:self
                                           selector:@selector(timeFired)
                                           userInfo:nil
                                            repeats:YES];
}
- (void)timeFired
{
    // Here your countdown and...
    if (!displaying) {
        NSInteger randomNumber = arc4random() % 13;
        NSLog(@"%i, %@",randomNumber, displaying);
        if(randomNumber == 1&&!displaying){
          //  [self performSelector:@selector(showButton) withObject:nil afterDelay:1.0];
            _recoveryButton.hidden = NO;
            NSLog(@"fired1");
            displaying = YES;
        }
        else if(randomNumber == 2&&!displaying){
           // [self performSelector:@selector(showButton) withObject:nil afterDelay:1.0];
            NSLog(@"fired2");
            displaying = YES;
            _topRightRecovery.hidden = NO;
        }
        else if(randomNumber == 3&&!displaying){
            //[self performSelector:@selector(showButton) withObject:nil afterDelay:1.0];
            NSLog(@"fired3");
            displaying = YES;
            _bottomLeftRecovery.hidden = NO;
        }
        else if(randomNumber == 0&&!displaying){
            //[self performSelector:@selector(showButton) withObject:nil afterDelay:1.0];
            NSLog(@"fired4");
            displaying = YES;
            _bottomRightRecovery.hidden = NO;
        }
    }
}
-(void)showButton{
    _recoveryButton.hidden = NO;
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
   // _imageView.image = [UIImage imageNamed:@"alfredo"];
    fileType = @"JPG";
    fileSize = @"1.23MB";
    dimensions = [NSString stringWithFormat:@"%iX%i", (int)user.userImage.size.width, (int)user.userImage.size.height];
    colorSpace = [NSString stringWithFormat:@"%li", (long)user.userImage.renderingMode];
    colorProfile = [NSString stringWithFormat:@"%@", user.indexPropertyName];
    emotionalState = user.emotionString;
    brands = user.brandString;
}


// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    [timer invalidate];
}


- (IBAction)userButtonTouchUpInside:(id)sender {
    displaying = YES;
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
    _recoveryButton.hidden = YES;
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
    _recoveryButton.hidden = YES;
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
    _recoveryButton.hidden = YES;
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
    _recoveryButton.hidden = YES;
    _displayDetails.hidden = NO;
    _displayDetails.backgroundColor = [self colorWithHexString:@"ff0000"];
    _detailsTitleLabel.text = @"IMAGE INFORMATION";
    _imageView.hidden = YES;
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
    displaying = NO;
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
    _detailsTitleLabel.text = @"RECOVERY1";

    displaying = YES;
    _recoveryButton.hidden = YES;
    _bottomRightRecovery.hidden = YES;
    _bottomLeftRecovery.hidden = YES;
    _topRightRecovery.hidden = YES;
    
    NSInteger randomNumber = arc4random() % 3;
    _displayDetails.hidden = NO;
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
    _recoveryButton.hidden = YES;

    if(randomNumber==0){
        _imageView.hidden = NO;
    }
    else if(randomNumber==1){
        _longtext.hidden = NO;
        _longtext.text = @"ˇŒ%I¯ıï8ﬁ«ÈÌÏw[¢heÈóã˝7~≤Xú8–>E˜Âr=˚,›Ω4IÊF—ﬂïˆP˛Ÿ>¶&…MG>50j≈uujjSWw˜…ˇ_N>?‡ˆ%I2Âèsπıqö„ÖL≤∑Êr˜≈q∏—](î7ÜF˘H)Gæ   ˆÔèMqˆv ∑”=|/éØ(eÊ$…dåø˜†Ü¯˜¿∫ﬁP∏%éˇ;é?_,˛~Zô	€[¢hZÊßæYÍò> √ç>)¬ÂOK fy±ò„	q”?Îéóâﬁ!@ ≈Ôg∂d≠ÃÂ sIõzgà˙ƒ ∑zª$‹¯Õër_.ó˛HπcÇÀí‰≤~œıG¶ìÄ£∞Ï8y_…>˘¬@ádæW⁄8ß7Dæw‰c“ˇdø57⁄R¨dgéZJ?X¿ >ás¬èåíÂ2SßNù4i“ÈzˆŒŒŒñññCáfas d $$%%$˘”éîj6eBù¸]o≤ÙIôÔï˙fj©<¬◊èîŒN˙^È,ÓÚc.Õ‹ﬁTZLìÍ3Â‘Á<¶uôµ5µÍ¢ã.Zµj’ÏŸ≥OÔÀËËË∏˚Óªó-[ñ8xÜîj/e¶ñ&âæYéØî…D•’æ◊&Iz`&[!;2ÈsKØÔΩõ=ù;*ù~ƒ±äZˇœÍ∏q„˛ı_ˇu⁄¥iïJ/^ºwÔﬁ¸«Ùgû d≠0§öâJóì9–{ª î√Â∫~Àe¢ﬁ´»§nJí•QñãŸ_”j}`ØπÊöaÈò]ªvµµµ7ﬂ|≥?ÌH†•+v”’ªü<Ú“/Âs≥øP∫^¯ïû‚T^)Núr‹‹‰æΩ.∏‡Ç!Ó·‡¡ÉÛÁœ=4yÚ‰U´Vùˆ◊R®DÈ®¥‰•œ1Ñßzo¨/M≠/]jØOª§ß597‘øúÔ∫ÎÆµk◊Ümmmã-⁄ ⁄˜∆Ì/áﬂì	S£1ı∆ê2@uà˜<ü˚ÔU!e [í)Wﬂ¸G<fÁ”Òéı!qäxKüœ=}gü-…yoN¶ŒI{®ˇwè0ajÒ“Ù<˚Å…•Ë©®#ü1Ï'ºò¯¿é8<¶è∆Y≈Y˙ª«¯òﬁß.Éîj¥cv>ù{˛ü{nç©—µøÔ›ïœÒ∞ü~'>∞3-ÜlpÙl	è˘“831TÍ°∞%Ÿ˘tÒ œÜ}¶ﬂ=ö$˝-TH¯ëÆˆ#v€Vz%ç≥z”’^~ñû€•WÌ›ö€Û|˙,Qü«≥˜«i«Ù9zÂà«µÔ}µÇóô2©û§(ÔÛá˜Ü«Á˛{Uÿg·˙ˇ[~LÓ«_è∑~#ôy}ˆh 	9‚Yû˛?·Y¬ç‰º7¯`‘≤ÏFM ¸Ù;=ø’7ˆôÇÈw‹Â«øªΩÛÈ¡˜ô4ŒJ.|Oüüv=œR:˙ˇfá˜ê20*uµ«{^ø˜tÃ†Î|„›ˇïé‹Ù‹>∞3ª™f‡Œ8gVœo«zÿPïz+±Bê20:ïgë˙L–µxf˝iTﬂX.õ¡î‘ÆY	Ø™t|(9ˇ-ﬁJ†ke`t(MÕ38“y¢d¬î–1!z‚ü=—≥<ÂuÛãåtﬁ™q÷©ã∞¯˘O‘3ìU™´#˛oÏ«_œﬁ=Èu9Äî*Z|‰CG}ÿÓÁ{~+πIŒô’ì2{^—N™'zB«¸¯ÎÒÅù!}äÉ‰Œ… „ïom˘pºıG‹ó2 eÄöîå©èè'eˆÙ§Lr~)eB–ÑÇÈôrz>]:3pd4ŒÏπ¸Ã)X≈í=ª8uŒÄè)^˘øΩπ eÄQ`bœ≤Ÿ¡Ø˚“”1]Ì=SKΩÁ4ıÃ1Ì|:~˘«}R&ôy˝´7Œs2–Ÿ⁄√¢ÁDÎÆˆ¸|6jﬂõ{˛Kûwùú≤â-@ ≤Ú7$KœoÌ{≥]¢ﬁC5GD∆êÁqzÚËx*dL}ÒÕ—sQôΩ[CTı)*Ä»L0Zå©OŒ{SœøÛˇΩ*: ∫ôWgó&LIgñı|£4«4åØdÄçÈiP}´Á¢2«zÂÄîjﬂ´'ÔÕı˘Ù¢ÙÛÏËπ1¶æ¯«wØ¸l˘WöØ∞•„C='W˜vIœ9JØÆ—¯Î‚õ?ñÆ⁄ ﬂ˘Œw<ÿ––0oﬁºÊÊfc¿Ë·®Ã	[∞`¡˘Áüˇ»#èd7~˛Ûü√◊Ïc˙{Êôg˘nYvo°Q“ç·F∏ˆê}¢%Kñºı≠oΩ„é;¬ñ5‹Œæ∞˛OÙ˜ﬂ˘ÈﬁÇÏ?KÿCÿ2sÊÃIﬁn√ç7ﬁ8¯cööö˙#ô0aB¯z…%óî∑Ñ¯Â/Ÿ––ê›Óñoˇœˇ¸O˘∆€ﬂ˛ˆ4h“Ñ(y‡Å¬çø¸Àø|€€ﬁˆùÔ|'‹ΩÂñ[¬ìÜGñ˜æÓÜj9p‡¿ñ-[BÒÑ']∂lŸÄØ˘≈Úò–:!2˙oœfƒÁKB«¨^Ω∫º1=xæÜmQéåP$È›¥{“c3Kó.M_F¯nhî'ûxœ¶L∏˝ó%·ˆß?˝ÈG}4DœÄ):ÈSü˙T¯˙—è~tﬁºyﬁe˙ò¶¶¶lN•ÅÚÉ¸‡hsCi–ÑªKñ,Ÿ≤eÀ≈_|¥c6ﬁˆ∂PŸu'√(=¶í∂Kàí–QÔLSz¿ÊíK.Iøõ=˙477ßŒvO!Ä˙o|‰ëG}Ù—ÜÜÜ+Vxê25.=ºRÊ‘òI˜¸É¸ J(å-[∂døõ6MˇÂ,Èrú£•Ãí%K¢“ÃWüÌ·Ò∑‹rK∏±|˘rKd⁄cy‰ë}Nzzp%Ìï7";
        _recoveryButton.hidden = YES;
    }
    else if(randomNumber==2){
        _longtext.hidden = NO;
        _longtext.text = @"'The point of representability is the point of power. And the point of power today is not in the image. The point of power resides in networks, computers, algorithms, information, and data.'\n\nAlexander R. Galloway\n\nFirst published in 2012 by Polity Press\n\nPolity Press \n65 Bridge Street\nCambridge CB2 1UR, UK\n\nISBN — 13:978-0-7456-6252-7 (hardback)\nISBN — 13:978-0-7456-6253-4 (paperback)";
    }
}
- (IBAction)topRightTouchUpInside:(id)sender {
    _detailsTitleLabel.text = @"RECOVERY2";

    displaying = YES;
    _recoveryButton.hidden = YES;
    _bottomRightRecovery.hidden = YES;
    _bottomLeftRecovery.hidden = YES;
    _topRightRecovery.hidden = YES;
    
    NSInteger randomNumber = arc4random() % 3;
    _displayDetails.hidden = NO;
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
    _recoveryButton.hidden = YES;

    if(randomNumber==0){
        _imageView.hidden = NO;
    }
    else if(randomNumber==1){
        _imageView.image = [UIImage imageNamed:@"abacus"];
        _imageView.hidden = NO;
        _recoveryButton.hidden = YES;
    }
    else if(randomNumber==2){
        _imageView.image = [UIImage imageNamed:@"mac"];
        _imageView.hidden = NO;
        _recoveryButton.hidden = YES;
    }
}

- (IBAction)bottomLeftTouchUpInside:(id)sender {
    _detailsTitleLabel.text = @"RECOVERY3";

    displaying = YES;
    _recoveryButton.hidden = YES;
    _bottomRightRecovery.hidden = YES;
    _bottomLeftRecovery.hidden = YES;
    _topRightRecovery.hidden = YES;
    
    NSInteger randomNumber = arc4random() % 3;
    _displayDetails.hidden = NO;
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
    _recoveryButton.hidden = YES;

    if(randomNumber==0){
        _imageView.hidden = NO;
    }
    else if(randomNumber==1){
        _imageView.image = [UIImage imageNamed:@"map1"];
        _imageView.hidden = NO;
        _recoveryButton.hidden = YES;
    }
    else if(randomNumber==2){
        _imageView.image = [UIImage imageNamed:@"map2"];
        _imageView.hidden = NO;
        _recoveryButton.hidden = YES;
    }
}

- (IBAction)bottomRightTouchUpInside:(id)sender {
   _detailsTitleLabel.text = @"RECOVERY";

    displaying = YES;
    _recoveryButton.hidden = YES;
    _bottomRightRecovery.hidden = YES;
    _bottomLeftRecovery.hidden = YES;
    _topRightRecovery.hidden = YES;
    
    NSInteger randomNumber = arc4random() % 3;
    _displayDetails.hidden = NO;
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
    _recoveryButton.hidden = YES;

    if(randomNumber==0){
        _imageView.hidden = NO;
    }
    else if(randomNumber==1){
        _longtext.hidden = NO;
        _longtext.text = @"else if(randomNumber==1){\n  _longtext.hidden = NO;\n  _longtext.text =@sdfasdf\n  _recoveryButton.hidden = YES;\nelse if(randomNumber==2){\n  _longtext.hidden = NO;\n  _longtext.text = @somedasdagasdsavemeplz\n_longtext.text = @asdfepingasdfwfe\n}";
        _recoveryButton.hidden = YES;
    }
    else if(randomNumber==2){
        _longtext.hidden = NO;
        _longtext.text = @"- (IBAction)bottomRightTouchUpInside:(id)sender {\n  displaying = YES;\n  _recoveryButton.hidden = YES;\n  _bottomRightRecovery.hidden = YES;\n  _bottomLeftRecovery.hidden = YES;\n  _topRightRecovery.hidden = YES;/n  NSInteger randomNumber = arc4random() % 3;\n  _displayDetails.hidden = NO;";
    }
}

@end

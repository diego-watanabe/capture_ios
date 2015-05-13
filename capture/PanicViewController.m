//
//  PanicViewController.m
//  capture
//
//  Created by Diego Watanabe on 4/13/15.
//  Copyright (c) 2015 blorgod. All rights reserved.
//

#import "PanicViewController.h"
#import "GlitchKit.h"

@interface PanicViewController ()

@end

@implementation PanicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _kernel.text = @"panic (cpu:0): Don't be alarmed\nKernel Trap at 0x5aa45fcd, type 14= Capture is\nonly trying: to enter your system\n\n\nCRO: 0x8001003b,  CR2: 0x0000000  CR3: 0x00101000,\nEAX: For obvious  EBX: reasons    ECX:0x5aa45f63\nEDX: Your system  CR2: is refusing    EBP: Force\nESI: Must be      EDA: implementing  CAB: Immediately\nDebugger called:\n<PANIC><PANIC><PANIC><PANIC><PANIC><PANIC><PANIC><PANIC>\n<PANIC><PANIC><PANIC><PANIC><PANIC><PANIC><PANIC><PANIC>\nBSD process name corresponding to current thread:\nit won't be much longer.\nCapture Recovery Implementation: Almost set\n\n0x5a973e38 : 0x666 (LET US IN 0x0 0x1 0x66aaf7c0 !~)\n___ZNk80SObjecct13taggedReleaseEPK+Corruption deep:\n0x5a973e38 : 0x666 (LET US IN 0x0 0x1 0x66aaf7c0 !~)\n___ZNk80SObjecct13taggedReleaseEPK+Corruption deep:\n0x5a973e38 : 0x666 (LET US IN 0x0 0x1 0x66aaf7c0 !~)\n___ZNk80SObjecct13taggedReleaseEPK+Corruption deep:\n0x5a973e38 : 0x666 (LET US IN 0x0 0x1 0x66aaf7c0 !~)\n___ZNk80SObjecct13taggedReleaseEPK+Corruption deep:\n0x5a973e38 : 0x666 (LET US IN 0x0 0x1 0x66aaf7c0 !~)\n___ZNk80SObjecct13taggedReleaseEPK+Corruption deep:\n0x5a973e38 : 0x666 (LET US IN 0x0 0x1 0x66aaf7c0 !~)\n___ZNk80SObjecct13taggedReleaseEPK+Corruption deep:\n0x5a973e38 : 0x666 (LET US IN 0x0 0x1 0x66aaf7c0 !~)\n___ZNk80SObjecct13taggedReleaseEPK+Corruption deep:\n0x5a973e38 : 0x666 (LET US IN 0x0 0x1 0x66aaf7c0 !~)\n___ZNk80SObjecct13taggedReleaseEPK+Corruption deep:\n0x5a973e38 : 0x666 (LET US IN 0x0 0x1 0x66aaf7c0 !~)\n___ZNk80SObjecct13taggedReleaseEPK+Corruption deep:\n0x5a973e38 : 0x666 (LET US IN 0x0 0x1 0x66aaf7c0 !~)\n___ZNk80SObjecct13taggedReleaseEPK+Corruption deep:\n0x5a973e38 : 0x666 (LET US IN 0x0 0x1 0x66aaf7c0 !~)\n___ZNk80SObjecct13taggedReleaseEPK+Corruption deep:\n0x5a973e38 : 0x666 (LET US IN 0x0 0x1 0x66aaf7c0 !~)\n___ZNk80SObjecct13taggedReleaseEPK+Corruption deep:\n0x5a973e38 : 0x666 (LET US IN 0x0 0x1 0x66aaf7c0 !~)\n___ZNk80SObjecct13taggedReleaseEPK+Corruption deep:\n0x5a973e38 : 0x666 (LET US IN 0x0 0x1 0x66aaf7c0 !~)\n___ZNk80SObjecct13taggedReleaseEPK+Corruption deep:\n0x5a973e38 : 0x666 (LET US IN 0x0 0x1 0x66aaf7c0 !~)\n___ZNk80SObjecct13taggedReleaseEPK+Corruption deep:\n";
    [self performSelector:@selector(glitchKernelText) withObject:nil afterDelay:1.0];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)glitchKernelText{
    _kernel.hidden=YES;
    [self performSelector:@selector(glitchKernelText2) withObject:nil afterDelay:1.0];

}
-(void)glitchKernelText2{
    _kernel.hidden = NO;
    [self performSelector:@selector(glitchKernelText3) withObject:nil afterDelay:1.0];

}
-(void)glitchKernelText3{
    _kernel.hidden = YES;
    [self performSelector:@selector(showPermissionViewController) withObject:nil afterDelay:1.5];
    
}
- (void)showPermissionViewController{
    _kernel.hidden = NO;
    [self performSegueWithIdentifier:@"permission" sender:self];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

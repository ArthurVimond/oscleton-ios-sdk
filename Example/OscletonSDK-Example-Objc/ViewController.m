//
//  ViewController.m
//  OscletonSDK-Example-Objc
//
//  Created by Arthur Vimond on 29/10/2018.
//  Copyright © 2018 Arthur Vimond. All rights reserved.
//

#import "ViewController.h"
@import OscletonSDK;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[[OscletonSDK instance] controller] play];
    OSResult result = [[[OscletonSDK instance] configuration] setComputerIP:@"192"];
    if (result == OSResultError) {

    }
    
}


@end

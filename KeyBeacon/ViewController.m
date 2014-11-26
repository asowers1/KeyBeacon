//
//  ViewController.m
//  KeyBeacon
//
//  Created by Andrew Sowers on 10/19/14.
//  Copyright (c) 2014 Andrew Sowers. All rights reserved.
//

#import "ViewController.h"
#import "beaconController.h"

@interface ViewController ()
@property (nonatomic,strong)beaconController*beacon;
@end

@implementation ViewController
@synthesize beacon;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0/255.0f green:77/255.0f blue:64/255.0 alpha:0];
    beacon = [[beaconController alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

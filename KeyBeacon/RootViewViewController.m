//
//  RootViewViewController.m
//  KeyBeacon
//
//  Created by Andrew Sowers on 10/30/14.
//  Copyright (c) 2014 Andrew Sowers. All rights reserved.
//

#import "RootViewViewController.h"

@interface RootViewViewController ()

@end

@implementation RootViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                                                           [UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0], NSForegroundColorAttributeName,
                                                    
                                                           [UIFont fontWithName:@"Copperplate-Light" size:22.0], NSFontAttributeName, nil]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
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

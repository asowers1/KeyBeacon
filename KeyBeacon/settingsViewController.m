//
//  settingsViewController.m
//  KeyBeacon
//
//  Created by Andrew Sowers on 10/19/14.
//  Copyright (c) 2014 Andrew Sowers. All rights reserved.
//

#import "settingsViewController.h"
#import "hexKeyboard.h"
#import "plistHelper.h"

@interface settingsViewController ()

@end

@implementation settingsViewController
@synthesize uuidInputField,rangePicker;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.uuidInputField.inputView = [[hexKeyboard alloc] initWithTextField:self.uuidInputField:self.view.bounds.size.width];
    //self.navigationItem.title = @"Setup iBeacon";
    NSString * selectedUISegmentedControl = [[[plistHelper alloc]init]readFromPlist:@"data.plist" :@"iBeacon_range"];
    NSUUID   * uuid = [[NSUUID alloc] initWithUUIDString:[[[plistHelper alloc]init]readFromPlist:@"data.plist" :@"iBeacon_uuid"]];
    if (uuid) {
        self.uuidInputField.text = uuid.UUIDString;
    }
    NSLog(@"SelectedUISegmentedControl: %@",selectedUISegmentedControl);
    if ([selectedUISegmentedControl  isEqual: @"Immediate"]) {
        rangePicker.selectedSegmentIndex = 0;
    }else if([selectedUISegmentedControl isEqual:@"Near"]){
        rangePicker.selectedSegmentIndex = 1;
    }else if([selectedUISegmentedControl isEqual:@"Far"]){
        rangePicker.selectedSegmentIndex = 2;
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)updateUUIDString:(NSString *)uuidString
{
    NSLog(@"Writing UUID: %@",uuidString);
    [[[plistHelper alloc] init]rwDataToPlist:@"data.plist" :@"iBeacon_uuid" :uuidString];
}

-(void)updateBeaconRange:(NSString *)range
{
    NSLog(@"Writing beacon range: %@",range);
    [[[plistHelper alloc] init]rwDataToPlist:@"data.plist" :@"iBeacon_range":range];
}

- (IBAction)Set:(id)sender {
    
    
    NSString * UUIDString = uuidInputField.text;
    NSUUID* UUID = [[NSUUID alloc] initWithUUIDString:UUIDString];
    if(UUID)
    {
        NSLog(@"valid UUID");
        [self updateUUIDString:UUIDString];
        [self updateBeaconRange:[rangePicker titleForSegmentAtIndex:rangePicker.selectedSegmentIndex]];
        [self dismissViewControllerAnimated:1 completion:nil];
        
    }
    else{
        NSLog(@"invalid UUID");
        UIAlertController *alertController = [UIAlertController
                                              alertControllerWithTitle:@"Invalid UUID"
                                              message:@"Please enter a vaid UUID to proceed"
                                              preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *cancelAction        = [UIAlertAction
                                              actionWithTitle:NSLocalizedString(@"Cancel", @"Cancel action")
                                              style:UIAlertActionStyleCancel
                                              handler:^(UIAlertAction *action)
                                              {
                                                  NSLog(@"Cancel action");
                                                  [self.uuidInputField resignFirstResponder];
                                              }];
        
        UIAlertAction *okAction            = [UIAlertAction
                                              actionWithTitle:NSLocalizedString(@"OK", @"OK action")
                                              style:UIAlertActionStyleDefault
                                              handler:^(UIAlertAction *action)
                                              {
                                                  NSLog(@"OK action");
                                              }];
        
        [alertController addAction:cancelAction];
        [alertController addAction:okAction];
        [self presentViewController:alertController animated:YES completion:nil];
        
    }
}


- (IBAction)infoButton:(id)sender {
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"KeyBeacon Information"
                                          message:@"\nSetup steps:\n\n1.  Configure your iBeacon®\n2. Input the UUID\n3. Input the Range\n\n\nKeyBeacon was created by Andrew Sowers.\n\niBeacon is a registered trademark of Apple Inc."                                       preferredStyle:UIAlertControllerStyleAlert];
    
    
    UIAlertAction *okAction            = [UIAlertAction
                                          actionWithTitle:NSLocalizedString(@"OK", @"OK action")
                                          style:UIAlertActionStyleDefault
                                          handler:^(UIAlertAction *action)
                                          {
                                              NSLog(@"OK action");
                                          }];
    
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
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

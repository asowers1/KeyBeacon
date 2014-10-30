//
//  settingsViewController.h
//  KeyBeacon
//
//  Created by Andrew Sowers on 10/19/14.
//  Copyright (c) 2014 Andrew Sowers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface settingsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *uuidInputField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *rangePicker;
@end

//
//  beaconController.m
//  KeyBeacon
//
//  Created by Andrew Sowers on 11/22/14.
//  Copyright (c) 2014 Andrew Sowers. All rights reserved.
//

#import "beaconController.h"
@implementation beaconController
@synthesize status;
-(id)init{
    self = [super init];
    if (self)
    {
        // superclass successfully initialized, further
        // initialization happens here ...
    
        plist = [[plistHelper alloc] init];
        NSUUID* UUID = [[NSUUID alloc] initWithUUIDString:[plist readFromPlist:@"data.plist" :@"iBeacon_uuid"]];
        if (UUID) {
            NSLog(@"start listening for %@",UUID);
            listener = [[BUOYListener alloc] init];
            NSArray * beacons = [[NSArray alloc] initWithObjects:UUID, nil];
            [listener listenForBeaconsWithProximityUUIDs:beacons notificationInterval:1];
            status = 1;
        }else{
            status = -1;
        }
        
        
    }
    return self;
}


@end

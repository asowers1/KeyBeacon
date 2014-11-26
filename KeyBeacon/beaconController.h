//
//  beaconController.h
//  KeyBeacon
//
//  Created by Andrew Sowers on 11/22/14.
//  Copyright (c) 2014 Andrew Sowers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "plistHelper.h"
#import "BUOYListener.h"
@interface beaconController : NSObject{
    BUOYListener *listener;
    plistHelper  *plist;
}
@property (nonatomic) NSInteger status;
@end

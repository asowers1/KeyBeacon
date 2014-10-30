//
//  plistHelper.h
//  KeyBeacon
//
//  Created by Andrew Sowers on 10/21/14.
//  Copyright (c) 2014 Andrew Sowers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface plistHelper : NSObject

- (void) rwDataToPlist:(NSString *)fileName :(NSString *)key :(NSString *)value;
- (NSString *) readFromPlist:(NSString *)fileName :(NSString *)key;
@end

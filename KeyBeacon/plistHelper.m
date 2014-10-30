//
//  plistHelper.m
//  KeyBeacon
//
//  Created by Andrew Sowers on 10/21/14.
//  Copyright (c) 2014 Andrew Sowers. All rights reserved.
//

#import "plistHelper.h"

@implementation plistHelper

- (void) rwDataToPlist:(NSString *)fileName :(NSString *)key :(NSString *)value

{
    // Get plist file path
    
    NSArray *sysPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory ,NSUserDomainMask, YES);
    NSString *documentsDirectory = [sysPaths objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:fileName];
    NSLog(@"Plist File Path: %@", filePath);
    
    // Define mutable dictionary
    NSMutableDictionary *plistDict;
    
    // Check if file exists at path and read data from the file if exists
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath])
    {
        plistDict = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
    }
    else
    {
        //If doesn't exist, start with an empty dictionary
        plistDict = [[NSMutableDictionary alloc] init];
        
    }
    
    
    // Step5: Set data in dictionary
    
    [plistDict setValue:value forKey: key];
    
    NSLog(@"plist data: %@", [plistDict description]);
    
    
    // Write data from the mutable dictionary to the plist file
    
    BOOL didWriteToFile = [plistDict writeToFile:filePath atomically:YES];
    
    if (didWriteToFile)
    {
        NSLog(@"Write to .plist file is a SUCCESS!");
    }
    else
    {
        NSLog(@"Write to .plist file is a FAILURE!");
        
    }
    
}

- (NSString *) readFromPlist:(NSString *)fileName :(NSString *)key
{
    // Get plist file path
    
    NSArray *sysPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory ,NSUserDomainMask, YES);
    NSString *documentsDirectory = [sysPaths objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:fileName];
    NSLog(@"Plist File Path: %@", filePath);
    
    // Define mutable dictionary
    NSMutableDictionary *plistDict;
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath])
    {
        plistDict = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
    }
    else
    {
        return @"failed";
    }
    
    return [plistDict valueForKey:key];
}


@end

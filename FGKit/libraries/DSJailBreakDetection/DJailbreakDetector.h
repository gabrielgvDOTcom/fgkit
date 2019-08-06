//
//  DJailbreakDetector.h
//  DJailbreakDetector
//
//  Created by Diego Sepúlveda on 8/9/16.
//  Copyright © 2016 ionix. All rights reserved.
//
//
//  Based in FGJailbreakDetector, DTTJailbreakDetection, JailbrokenDetector
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DJailbreakDetector : NSObject

/**
 *  Check if the device has been jailbroken
 *
 *  - Simulator is not detectable
 *  - Check if Cydia is existed
 *  - Check if your application is running from inside a restricted sandbox
 *  - Using the `lstat` function to check if '/Applications' folder is actually a directory or just a symbolic link. A symbolic link means the device has been jailbroken.
 *
 *  @return YES if device has been jailbroken, otherwise NO
 */
+ (BOOL)hasJailbroken;

+ (BOOL)amIBeingDebugged;

+ (NSString*)getVal;

+ (NSString*)getDig;

@end

//
//  UIApplication+DKTAdditions.m
//
//  Copyright 2010 Trollwerks Inc. All rights reserved.
//

#import "UIApplication+DKTAdditions.h"
#import "LogEvent.h"

@implementation UIApplication (DKTAdditions)

- (NSString *)dktVersion
{
   return @"DrawKitTouch 1.0(6) -- " __DATE__;
}

- (void)dktSetLogging:(BOOL)enabled
{
   LoggingController* sharedLoggingController = [LoggingController sharedLoggingController];
   NSArray* eventTypeNames = [sharedLoggingController eventTypeNames];
   NSUserDefaults* userPrefs = [NSUserDefaults standardUserDefaults];
   for (NSString *name in eventTypeNames)
      [userPrefs setBool:enabled forKey:name];
}

@end

//
//  main.m
//
//  Copyright Trollwerks Inc. 2010. All rights reserved.
//

#include <sys/time.h>

static void uncaughtExceptionHandler(NSException *exception)
{
   NSLog(@"EPIC FAIL: uncaughtExceptionHandler triggered with %@!", exception);
}

int main(int argc, char *argv[])
{
   static struct timeval now = { 0, 0 };
   gettimeofday(&now, NULL);
	srand(now.tv_sec);
	srandom(now.tv_sec);

   NSSetUncaughtExceptionHandler(&uncaughtExceptionHandler);
   
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    int retVal = UIApplicationMain(argc, argv, nil, nil);
    [pool release];
    return retVal;
}

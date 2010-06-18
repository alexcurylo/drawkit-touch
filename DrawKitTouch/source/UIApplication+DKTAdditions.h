//
//  UIApplication+DKTAdditions.h
//
//  Copyright 2010 Trollwerks Inc. All rights reserved.
//

@interface UIApplication (DKTAdditions)

- (NSString *)dktVersion;

@end

// If a UIApplication category is available at runtime,
// then linking has gone as well as can be expected

CG_INLINE BOOL DKTDrawKitTouchAvailable(void)
{
   return [[UIApplication sharedApplication] respondsToSelector:@selector(dktVersion)];
}

//
//  UIApplication+DKTAdditions.h
//
//  Copyright 2010 Trollwerks Inc. All rights reserved.
//

@interface UIApplication (DKTAdditions)

- (NSString *)dktVersion;

// do we need to do something with this to emulate performSelector: ovverride in DKTDrawingView?
//- (BOOL)sendAction:(SEL)action to:(id)target from:(id)sender forEvent:(UIEvent *)event;

@end

//
//  DKBoundingRectHandle.h
//  GCDrawKit
//
//  Created by graham on 4/09/09.
//  Copyright 2009 Apptree.net. All rights reserved.
//

// not in iPhone SDK, should be left to .pch ...alex
//#import <Cocoa/Cocoa.h>
#import "DKHandle.h"


@interface DKBoundingRectHandle : DKHandle
@end


@interface DKLockedBoundingRectHandle : DKBoundingRectHandle
@end


@interface DKInactiveBoundingRectHandle : DKBoundingRectHandle
@end

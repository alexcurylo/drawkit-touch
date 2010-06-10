//
//  DKBezierLayoutManager.h
//  GCDrawKit
//
//  Created by graham on 26/11/2008.
//  Copyright 2008 Apptree.net. All rights reserved.
//

#if TARGET_OS_IPHONE
#error NSLayoutManager not available in iPhone SDK
#endif TARGET_OS_IPHONE


@interface DKBezierLayoutManager : NSLayoutManager
{
	NSBezierPath*		mPath;
}

- (NSBezierPath*)		textPath;
- (NSArray*)			glyphPathsForContainer:(NSTextContainer*) container usedSize:(NSSize*) aSize;

@end


/*

 This subclass of NSLayoutManager captures the laid-out text in a bezier path which it creates. It can be used where a normal
 NSLayoutManager would be used to return the text as a path.

*/


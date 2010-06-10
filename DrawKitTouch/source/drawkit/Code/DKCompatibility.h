//
//  DKCompatibility.h
//
//  Copyright 2010 Trollwerks Inc. All rights reserved.
//
//  Compatibility between NSGeometry and CGGeometry,
//  NSPasteboard and UIPasteboard
//

#if TARGET_OS_IPHONE

#pragma mark -
#pragma mark iOS SDK definitions

// types

typedef CGPoint NSPoint;
typedef NSPoint *NSPointPointer;
typedef NSPoint *NSPointArray;
#define NSZeroPoint CGPointZero
#define NSMakePoint CGPointMake
#define NSPointFromString CGPointFromString
#define NSStringFromPoint NSStringFromCGPoint
#define NSEqualPoints CGPointEqualToPoint
#define valueWithPoint valueWithCGPoint
#define pointValue CGPointValue
#define encodePoint encodeCGPoint
#define decodePointForKey decodeCGPointForKey
typedef CGSize NSSize;
typedef NSSize *NSSizePointer;
typedef NSSize *NSSizeArray;
#define NSZeroSize CGSizeZero
#define NSMakeSize CGSizeMake
#define NSSizeFromString CGSizeFromString
#define NSStringFromSize NSStringFromCGSize
#define NSEqualSizes CGSizeEqualToSize
#define valueWithSize valueWithCGSize
#define sizeValue CGSizeValue
#define encodeSize encodeCGSize
#define decodeSizeForKey decodeCGSizeForKey
typedef CGRect NSRect;
typedef NSRect *NSRectPointer;
typedef NSRect *NSRectArray;
#define NSZeroRect CGRectZero
#define NSMakeRect CGRectMake
#define NSRectFromString CGRectFromString
#define NSStringFromRect NSStringFromCGRect
#define NSEqualRects CGRectEqualToRect
#define valueWithRect valueWithCGRect
#define rectValue CGRectValue
#define encodeRect encodeCGRect
#define decodeRectForKey decodeCGRectForKey
#define NSRectToCGRect
#define NSIsEmptyRect CGRectIsEmpty
#define NSIntersectsRect CGRectIntersectsRect
#define NSContainsRect CGRectContainsRect
#define NSIntersectionRect CGRectIntersection
#define NSUnionRect CGRectUnion
#define NSOffsetRect CGRectOffset
#define NSInsetRect CGRectInset
#define NSHeight CGRectGetHeight
#define NSWidth CGRectGetWidth
#define NSMaxX CGRectGetMaxX
#define NSMaxY CGRectGetMaxY
#define NSMidX CGRectGetMidX
#define NSMidY CGRectGetMidY
#define NSMinX CGRectGetMinX
#define NSMinY CGRectGetMinY
#define NSPointInRect(x,y) CGRectContainsPoint(y,x)

enum {
   NSButtLineCapStyle = kCGLineCapButt,
   NSRoundLineCapStyle = kCGLineCapRound,
   NSSquareLineCapStyle = kCGLineCapSquare,
};
typedef enum CGLineCap NSLineCapStyle;
enum {
   NSMiterLineJoinStyle = kCGLineJoinMiter,
   NSRoundLineJoinStyle = kCGLineJoinRound,
   NSBevelLineJoinStyle = kCGLineJoinBevel
};
typedef enum CGLineJoin NSLineJoinStyle;

enum {
   DKLeftTextAlignment = UITextAlignmentLeft,
   DKRightTextAlignment = UITextAlignmentRight,
   DKCenterTextAlignment = UITextAlignmentCenter,
};
typedef UITextAlignment DKTextAlignment;

// classes

#import "DKTAffineTransform.h"
#define DKAffineTransform DKTAffineTransform

#import "UIBezierPath+DKTAdditions.h"
#define DKBezierPath UIBezierPath

#define DKPasteboard UIPasteboard

#define DKImage UIImage

#define DKFont UIFont

#define DKColor UIColor

#import "DKTShadow.h"
#define DKShadow DKTShadow

#define DKWindow UIWindow

#define DKButton UIButton

// functions

#define DKRectFill UIRectFill
void DKFrameRectWithWidth(CGRect aRect, CGFloat frameWidth);

#else

#pragma mark -
#pragma mark OS X SDK definitions

// types

enum {
   DKLeftTextAlignment = NSLeftTextAlignment,
   DKRightTextAlignment = NSRightTextAlignment,
   DKCenterTextAlignment = NSCenterTextAlignment,
};
typedef NSTextAlignment DKTextAlignment;

// classes

#define DKAffineTransform NSAffineTransform

#define DKBezierPath NSBezierPath

#define DKPasteboard NSPasteboard
#define dataForPasteboardType dataForType
#define forPasteboardType forType

#define DKImage NSImage

#define DKFont NSFont

#define DKColor NSColor

#define DKShadow NSShadow

#define DKWindow NSWindow

#define DKButton NSButton

// functions

#define DKRectFill NSRectFill
#define DKFrameRectWithWidth NSFrameRectWithWidth

#endif TARGET_OS_IPHONE

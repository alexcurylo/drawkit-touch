//
//  DKTDesktopPlaceholders.h
//
//  Copyright 2010 Trollwerks Inc. All rights reserved.
//

//
// Canonical list of all DrawKit desktop SDK-dependent references;
// DrawKitTouch compiles with this included 
// (and straightforward patches like removing inappropriate #imports).
//

// not existing

typedef struct CGPoint NSPoint;
typedef NSPoint *NSPointArray;
typedef struct CGRect NSRect;
typedef NSRect *NSRectPointer;
typedef struct CGSize NSSize;
typedef struct FSRef { int x; } FSRef;
typedef struct {
   CGFloat m11, m12, m21, m22;
   CGFloat tX, tY;
} NSAffineTransformStruct;
typedef unsigned int NSGlyph;
typedef NSUInteger NSFontTraitMask;
typedef struct CGImageDestination *CGImageDestinationRef;


enum {
   NSNonZeroWindingRule = 0,
   NSEvenOddWindingRule = 1
};
typedef NSUInteger NSWindingRule;
enum {
   NSMoveToBezierPathElement,
   NSLineToBezierPathElement,
   NSCurveToBezierPathElement,
   NSClosePathBezierPathElement
};
typedef NSUInteger NSBezierPathElement;
enum {
   NSMixedState = -1,
   NSOffState   =  0,
   NSOnState    =  1    
};
//typedef NSInteger NSCellStateValue;
enum {
   NSAutoPagination = 0,
   NSFitPagination = 1,
   //NSClipPagination = 2
};
typedef NSUInteger NSPrintingPaginationMode;
enum {
   //NSImageInterpolationDefault,
   NSImageInterpolationNone,
   NSImageInterpolationLow,
   NSImageInterpolationHigh
};
typedef NSUInteger NSImageInterpolation;
enum {
   NSButtLineCapStyle = kCGLineCapButt,
   NSRoundLineCapStyle = kCGLineCapRound,
   //NSSquareLineCapStyle = kCGLineCapSquare
};
typedef enum CGLineCap NSLineCapStyle;
enum {
   NSMiterLineJoinStyle = kCGLineJoinMiter,
   NSRoundLineJoinStyle = kCGLineJoinRound,
   NSBevelLineJoinStyle = kCGLineJoinBevel
};
typedef enum CGLineJoin NSLineJoinStyle;
/*
 enum {
   NSAlphaFirstBitmapFormat            = 1 << 0,       // 0 means is alpha last (RGBA, CMYKA, etc.)
   NSAlphaNonpremultipliedBitmapFormat = 1 << 1,       // 0 means is premultiplied
   NSFloatingPointSamplesBitmapFormat  = 1 << 2	// 0 is integer
};
*/
typedef NSUInteger NSBitmapFormat;
enum {
   //NSHorizontalRuler,
   NSVerticalRuler
};
typedef NSUInteger NSRulerOrientation;
enum {
   //NSAlphaShiftKeyMask         = 1 << 16,
   NSShiftKeyMask              = 1 << 17,
   NSControlKeyMask            = 1 << 18,
   NSAlternateKeyMask          = 1 << 19,
   NSCommandKeyMask            = 1 << 20,
   //NSNumericPadKeyMask         = 1 << 21,
   //NSHelpKeyMask               = 1 << 22,
   //NSFunctionKeyMask           = 1 << 23,
   NSDeviceIndependentModifierFlagsMask    = 0xffff0000UL
};
enum {
   NSLeftMouseDown             = 1,            
   NSLeftMouseUp               = 2,
   //NSRightMouseDown            = 3,
   //NSRightMouseUp              = 4,
   NSMouseMoved                = 5,
   NSLeftMouseDragged          = 6,
   //NSRightMouseDragged         = 7,
   //NSMouseEntered              = 8,
   //NSMouseExited               = 9,
   NSKeyDown                   = 10,
   //NSKeyUp                     = 11,
   //NSFlagsChanged              = 12,
   //NSAppKitDefined             = 13,
   //NSSystemDefined             = 14,
   //NSApplicationDefined        = 15,
   NSPeriodic                  = 16,
   //NSCursorUpdate              = 17,
   NSScrollWheel               = 22,
   //NSTabletPoint               = 23,
   //NSTabletProximity           = 24,
   //NSOtherMouseDown            = 25,
   //NSOtherMouseUp              = 26,
   //NSOtherMouseDragged         = 27
};
typedef NSUInteger NSEventType;
enum {
   NSLeftMouseDownMask         = 1 << NSLeftMouseDown,
   NSLeftMouseUpMask           = 1 << NSLeftMouseUp,
   //NSRightMouseDownMask        = 1 << NSRightMouseDown,
   //NSRightMouseUpMask          = 1 << NSRightMouseUp,
   NSMouseMovedMask            = 1 << NSMouseMoved,
   NSLeftMouseDraggedMask      = 1 << NSLeftMouseDragged,
   //NSRightMouseDraggedMask     = 1 << NSRightMouseDragged,
   //NSMouseEnteredMask          = 1 << NSMouseEntered,
   //NSMouseExitedMask           = 1 << NSMouseExited,
   NSKeyDownMask               = 1 << NSKeyDown,
   //NSKeyUpMask                 = 1 << NSKeyUp,
   //NSFlagsChangedMask          = 1 << NSFlagsChanged,
   //NSAppKitDefinedMask         = 1 << NSAppKitDefined,
   //NSSystemDefinedMask         = 1 << NSSystemDefined,
   //NSApplicationDefinedMask    = 1 << NSApplicationDefined,
   NSPeriodicMask              = 1 << NSPeriodic,
   //NSCursorUpdateMask          = 1 << NSCursorUpdate,
   NSScrollWheelMask           = 1 << NSScrollWheel,
   //NSTabletPointMask           = 1 << NSTabletPoint,
   //NSTabletProximityMask       = 1 << NSTabletProximity,
   //NSOtherMouseDownMask        = 1 << NSOtherMouseDown,
   //NSOtherMouseUpMask          = 1 << NSOtherMouseUp,
   //NSOtherMouseDraggedMask     = 1 << NSOtherMouseDragged,
   NSAnyEventMask              = NSUIntegerMax
};
enum {
   NSBorderlessWindowMask		= 0,
   //NSTitledWindowMask			= 1 << 0,
   //NSClosableWindowMask		= 1 << 1,
   //NSMiniaturizableWindowMask		= 1 << 2,
   //NSResizableWindowMask		= 1 << 3
};
enum {
   //NSBackingStoreRetained	 = 0,
   //NSBackingStoreNonretained	 = 1,
   NSBackingStoreBuffered	 = 2
};
typedef NSUInteger NSBackingStoreType;
enum {
	NSAnimationEffectDisappearingItemDefault = 0,
	//NSAnimationEffectPoof = 10
};
typedef NSUInteger NSAnimationEffect;
enum {
   //NSCompositeClear		= 0,
   NSCompositeCopy		= 1,
   NSCompositeSourceOver	= 2,
   //NSCompositeSourceIn		= 3,
   //NSCompositeSourceOut	= 4,
   NSCompositeSourceAtop	= 5,
   //NSCompositeDestinationOver	= 6,
   //NSCompositeDestinationIn	= 7,
   //NSCompositeDestinationOut	= 8,
   //NSCompositeDestinationAtop	= 9,
   //NSCompositeXOR		= 10,
   //NSCompositePlusDarker	= 11,
   //NSCompositeHighlight	= 12,
   //NSCompositePlusLighter	= 13
};
typedef NSUInteger NSCompositingOperation;
enum {
   //NSImageCacheDefault,
   //NSImageCacheAlways,
   //NSImageCacheBySize,
   NSImageCacheNever
};
typedef NSUInteger NSImageCacheMode;
enum {
   NSLeftTextAlignment		= 0,
   NSRightTextAlignment	= 1,
   NSCenterTextAlignment	= 2,
   NSJustifiedTextAlignment	= 3,
   NSNaturalTextAlignment	= 4
};
typedef NSUInteger NSTextAlignment;
/*
 enum {
   NSLineSweepLeft     = 0,
   NSLineSweepRight    = 1,
   NSLineSweepDown     = 2,
   NSLineSweepUp       = 3
};
*/
typedef NSUInteger NSLineSweepDirection;
/*
enum {
   NSLineDoesntMove    = 0, 
   NSLineMovesLeft     = 1,
   NSLineMovesRight    = 2,
   NSLineMovesDown     = 3,
   NSLineMovesUp       = 4
};
*/
typedef NSUInteger NSLineMovementDirection;
enum {
   NSUnderlineStyleNone                = 0x00,
   //NSUnderlineStyleSingle              = 0x01,
   NSUnderlineStyleThick               = 0x02,
   //NSUnderlineStyleDouble              = 0x09
};
enum {
   //NSUnderlinePatternSolid             = 0x0000,
   NSUnderlinePatternDot               = 0x0100,
   NSUnderlinePatternDash              = 0x0200,
   NSUnderlinePatternDashDot           = 0x0300,
   NSUnderlinePatternDashDotDot        = 0x0400
};
enum {
   //NSLineBreakByWordWrapping = 0,
   //NSLineBreakByCharWrapping,
   NSLineBreakByClipping,
   //NSLineBreakByTruncatingHead,
   //NSLineBreakByTruncatingTail,
   //NSLineBreakByTruncatingMiddle
};
typedef NSUInteger NSLineBreakMode;
enum {
   //NSStringDrawingTruncatesLastVisibleLine = (1 << 5),
   //NSStringDrawingUsesLineFragmentOrigin = (1 << 0),
   NSStringDrawingUsesFontLeading = (1 << 1),
   NSStringDrawingDisableScreenFontSubstitution = (1 << 2),
   NSStringDrawingUsesDeviceMetrics = (1 << 3),
   NSStringDrawingOneShot = (1 << 4)
};
typedef NSInteger NSStringDrawingOptions;
enum {
   NSDragOperationNone		= 0,
   NSDragOperationCopy		= 1,
   //NSDragOperationLink		= 2,
   NSDragOperationGeneric	= 4,
   //NSDragOperationPrivate	= 8,
   //NSDragOperationAll_Obsolete	= 15,
   //NSDragOperationMove		= 16,
   //NSDragOperationDelete	= 32,
   //NSDragOperationEvery	= NSUIntegerMax
};
typedef NSUInteger NSDragOperation;
/*
 enum {
   NSTIFFCompressionNone		= 1,
   NSTIFFCompressionCCITTFAX3		= 3,
   NSTIFFCompressionCCITTFAX4		= 4,
   NSTIFFCompressionLZW		= 5,
   NSTIFFCompressionJPEG		= 6,
   NSTIFFCompressionNEXT		= 32766,
   NSTIFFCompressionPackBits		= 32773,
   NSTIFFCompressionOldJPEG		= 32865
};
*/
typedef NSUInteger NSTIFFCompression;


#define NSEqualPoints CGPointEqualToPoint
#define NSEqualRects CGRectEqualToRect
#define NSEqualSizes CGSizeEqualToSize
#define NSHeight CGRectGetHeight
#define NSInsetRect CGRectInset
#define NSIntersectionRect CGRectIntersection
#define NSIntersectsRect CGRectIntersectsRect
#define NSIsEmptyRect CGRectIsEmpty
#define NSMakePoint CGPointMake
#define NSMakeRect CGRectMake
#define NSMakeSize CGSizeMake
#define NSMaxX CGRectGetMaxX
#define NSMaxY CGRectGetMaxY
#define NSMidX CGRectGetMidX
#define NSMidY CGRectGetMidY
#define NSMinX CGRectGetMinX
#define NSMinY CGRectGetMinY
#define NSOffsetRect CGRectOffset
#define NSPointInRect(x,y) CGRectContainsPoint(y,x)
#define NSPointFromString CGPointFromString
#define NSRectFromString CGRectFromString
#define NSRectToCGRect
#define NSSizeFromString CGSizeFromString
#define NSStringFromPoint NSStringFromCGPoint
#define NSStringFromRect NSStringFromCGRect
#define NSStringFromSize NSStringFromCGSize
#define NSUnionRect CGRectUnion
#define NSWidth CGRectGetWidth
#define NSZeroPoint CGPointZero
#define NSZeroRect CGRectZero
#define NSZeroSize CGSizeZero
// NSValue methods
#define valueWithPoint valueWithCGPoint
#define valueWithRect valueWithCGRect
#define valueWithSize valueWithCGSize
#define pointValue CGPointValue
#define rectValue CGRectValue
#define sizeValue CGSizeValue
// NSCoder methods
#define encodePoint encodeCGPoint
#define decodePointForKey decodeCGPointForKey
#define encodeRect encodeCGRect
#define decodeRectForKey decodeCGRectForKey
#define encodeSize encodeCGSize
#define decodeSizeForKey decodeCGSizeForKey


// no definition needed
@class NSAlert;
@class NSColorSpace;
// forward defines
@class NSApplication;
@class NSBezierPath;
@class NSBitmapImageRep;
@class NSEvent;
@class NSFont;
@class NSGraphicsContext;
@class NSImage;
@class NSLayoutManager;
@class NSMenu;
@class NSPasteboard;
@class NSRulerMarker;
@class NSScrollView;
@class NSTextView;
@class NSTypesetter;
@class NSView;
@class NSWindow;


extern NSString *NSCalibratedRGBColorSpace;
extern NSString *NSDeviceRGBColorSpace;
extern NSString *NSDeviceWhiteColorSpace;
extern NSString *NSViewFrameDidChangeNotification;
extern NSString *NSWindowDidBecomeMainNotification;
extern NSString *NSWindowDidResignMainNotification;
extern NSString *NSEventTrackingRunLoopMode;
extern NSString *NSFontAttributeName;
extern NSString *NSParagraphStyleAttributeName;
extern NSString *NSForegroundColorAttributeName;
extern NSString *NSUnderlineStyleAttributeName;
extern NSString *NSSuperscriptAttributeName;
extern NSString *NSBackgroundColorAttributeName;
extern NSString *NSKernAttributeName;
extern NSString *NSStrokeWidthAttributeName;
extern NSString *NSStrokeColorAttributeName;
extern NSString *NSUnderlineColorAttributeName;
extern NSString *NSStrikethroughStyleAttributeName;
extern NSString *NSStrikethroughColorAttributeName;
extern NSString *NSShadowAttributeName;
extern NSString *NSBaselineOffsetAttributeName;
extern NSString *NSStringPboardType;
extern NSString *NSFilenamesPboardType;
extern NSString *NSTIFFPboardType;
extern NSString *NSRTFPboardType;
extern NSString *NSTabularTextPboardType;
extern NSString *NSColorPboardType;
extern NSString *NSRTFDPboardType;
extern NSString *NSHTMLPboardType;
extern NSString *NSPDFPboardType;
extern NSString *NSFileContentsPboardType;
extern NSString *NSDragPboard;
extern CFStringRef kCGImagePropertyDPIHeight;
extern CFStringRef kCGImagePropertyDPIWidth;
extern CFStringRef kCGImagePropertyJFIFIsProgressive;
extern CFStringRef kCGImagePropertyJFIFDictionary;
extern CFStringRef kCGImagePropertyTIFFCompression;
extern CFStringRef kCGImagePropertyTIFFSoftware;
extern CFStringRef kCGImagePropertyTIFFArtist;
extern CFStringRef kCGImagePropertyTIFFDocumentName;
extern CFStringRef kCGImagePropertyTIFFDateTime;
extern CFStringRef kCGImagePropertyTIFFDictionary;
extern CFStringRef kCGImagePropertyPNGInterlaceType;
extern CFStringRef kCGImagePropertyPNGDictionary;
extern CFStringRef kCGImageDestinationLossyCompressionQuality;
extern NSString *NSImageCompressionMethod;
extern NSString *NSImageCompressionFactor;
extern NSString *NSImageProgressive;
extern NSString *NSImageInterlaced;
extern NSString *NSImageGamma;
extern CFStringRef kUTTypeJPEG;
extern CFStringRef kUTTypeTIFF;
extern CFStringRef kUTTypePNG;
extern NSApplication * NSApp;
// CarbonCore/fp.h -- no iPhone SDK equivalent??
extern const double_t pi;
// = kCGFloatingWindowLevel = CGWindowLevelForKey(kCGFloatingWindowLevelKey)
#define NSFloatingWindowLevel 3


@protocol NSValidatedUserInterfaceItem
- (SEL)action;
@end

@protocol NSUserInterfaceValidations
- (BOOL)validateUserInterfaceItem:(id <NSValidatedUserInterfaceItem>)anItem;
@end

@protocol NSTextViewDelegate
@end

@protocol NSDraggingInfo
- (NSPasteboard *)draggingPasteboard;
- (NSPoint)draggingLocation;
- (NSPoint)draggedImageLocation;
- (id)draggingSource;
@end

@interface NSObject(NSDraggingDestination)
- (BOOL)prepareForDragOperation:(id <NSDraggingInfo>)sender;
- (BOOL)performDragOperation:(id <NSDraggingInfo>)sender;
- (void)concludeDragOperation:(id <NSDraggingInfo>)sender;
- (NSDragOperation)draggingEntered:(id <NSDraggingInfo>)sender;
- (NSDragOperation)draggingUpdated:(id <NSDraggingInfo>)sender;
- (void)draggingExited:(id <NSDraggingInfo>)sender;
- (BOOL)wantsPeriodicDraggingUpdates;
@end

@protocol NSApplicationDelegate
@end

@interface NSAffineTransform : NSObject
+ (NSAffineTransform *)transform;
- (void)scaleBy:(CGFloat)scale;
- (void)scaleXBy:(CGFloat)scaleX yBy:(CGFloat)scaleY;
- (void)translateXBy:(CGFloat)deltaX yBy:(CGFloat)deltaY;
- (NSPoint)transformPoint:(NSPoint)aPoint;
- (NSSize)transformSize:(NSSize)aSize;
- (NSBezierPath *)transformBezierPath:(NSBezierPath *)aPath;
- (void)rotateByDegrees:(CGFloat)angle;
- (void)rotateByRadians:(CGFloat)angle;
- (void)set;
- (void)concat;
- (void)invert;
- (void)appendTransform:(NSAffineTransform *)transform;
- (void)prependTransform:(NSAffineTransform *)transform;
- (void)setTransformStruct:(NSAffineTransformStruct)transformStruct;
@end

@interface NSApplication : NSObject
- (BOOL)sendAction:(SEL)theAction to:(id)theTarget from:(id)sender;
- (NSEvent *)currentEvent;
- (NSEvent *)nextEventMatchingMask:(NSUInteger)mask untilDate:(NSDate *)expiration inMode:(NSString *)mode dequeue:(BOOL)deqFlag;
- (void)discardEventsMatchingMask:(NSUInteger)mask beforeEvent:(NSEvent *)lastEvent;
- (void)postEvent:(NSEvent *)event atStart:(BOOL)flag;
- (id <NSApplicationDelegate>)delegate;
- (NSWindow *)keyWindow;
- (NSWindow *)mainWindow;
@end

@interface NSAttributedString : NSObject
- (id)initWithString:(NSString *)str attributes:(NSDictionary *)attrs;
- (id)initWithAttributedString:(NSAttributedString *)attrStr;
- (id)initWithRTF:(NSData *)data documentAttributes:(NSDictionary **)dict;
- (id)initWithRTFD:(NSData *)data documentAttributes:(NSDictionary **)dict;
- (id)initWithHTML:(NSData *)data documentAttributes:(NSDictionary **)dict;
- (NSString *)string;
- (NSUInteger)length;
- (NSAttributedString *)attributedSubstringFromRange:(NSRange)range;
- (id)attribute:(NSString *)attrName atIndex:(NSUInteger)location effectiveRange:(NSRangePointer)range;
- (id)attribute:(NSString *)attrName atIndex:(NSUInteger)location longestEffectiveRange:(NSRangePointer)range inRange:(NSRange)rangeLimit;
- (NSDictionary *)attributesAtIndex:(NSUInteger)location effectiveRange:(NSRangePointer)range;
- (NSDictionary *)attributesAtIndex:(NSUInteger)location longestEffectiveRange:(NSRangePointer)range inRange:(NSRange)rangeLimit;
- (void)replaceCharactersInRange:(NSRange)range withString:(NSString *)str;
- (BOOL)isEqualToAttributedString:(NSAttributedString *)other;
- (NSSize)size;
- (void)drawAtPoint:(NSPoint)point;
- (BOOL)drawInRect:(NSRect)rect;
- (NSData *)RTFFromRange:(NSRange)range documentAttributes:(NSDictionary *)dict;
@end

@interface NSMutableAttributedString : NSAttributedString
- (void)beginEditing;
- (void)endEditing;
- (void)setAttributes:(NSDictionary *)attrs range:(NSRange)range;
- (void)addAttribute:(NSString *)name value:(id)value range:(NSRange)range;
- (void)addAttributes:(NSDictionary *)attrs range:(NSRange)range;
- (void)removeAttribute:(NSString *)name range:(NSRange)range;
- (void)fixAttributesInRange:(NSRange)range;
- (void)fixFontAttributeInRange:(NSRange)range;
- (void)appendAttributedString:(NSAttributedString *)attrString;
- (void)setAlignment:(NSTextAlignment)alignment range:(NSRange)range;
@end

@interface NSTextStorage : NSMutableAttributedString
- (NSArray *)layoutManagers;
- (void)addLayoutManager:(NSLayoutManager *)obj;
- (void)removeLayoutManager:(NSLayoutManager *)obj;
@end

@interface NSBezierPath : NSObject
+ (NSBezierPath *)bezierPath;
+ (NSBezierPath *)bezierPathWithRect:(NSRect)rect;
+ (NSBezierPath *)bezierPathWithOvalInRect:(NSRect)rect;
+ (void)setDefaultLineWidth:(CGFloat)lineWidth;
+ (CGFloat)defaultLineWidth;
+ (void)strokeRect:(NSRect)rect;
+ (void)strokeLineFromPoint:(NSPoint)point1 toPoint:(NSPoint)point2;
+ (void)clipRect:(NSRect)rect;
+ (void)setDefaultFlatness:(CGFloat)flatness;
+ (CGFloat)defaultFlatness;
- (NSBezierPath *)bezierPathByFlatteningPath;
- (NSBezierPath *)bezierPathByReversingPath;
- (void)moveToPoint:(NSPoint)point;
- (void)lineToPoint:(NSPoint)point;
- (void)relativeLineToPoint:(NSPoint)point;
- (void)curveToPoint:(NSPoint)endPoint controlPoint1:(NSPoint)controlPoint1 controlPoint2:(NSPoint)controlPoint2;
- (void)transformUsingAffineTransform:(NSAffineTransform *)transform;
- (void)appendBezierPath:(NSBezierPath *)path;
- (void)appendBezierPathWithRect:(NSRect)rect;
- (void)appendBezierPathWithOvalInRect:(NSRect)rect;
- (void)appendBezierPathWithArcWithCenter:(NSPoint)center radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle;
- (void)appendBezierPathWithArcWithCenter:(NSPoint)center radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle clockwise:(BOOL)clockwise;
- (void)appendBezierPathWithArcFromPoint:(NSPoint)point1 toPoint:(NSPoint)point2 radius:(CGFloat)radius;
- (void)appendBezierPathWithGlyph:(NSGlyph)glyph inFont:(NSFont *)font;
- (void)appendBezierPathWithPackedGlyphs:(const char *)packedGlyphs;
- (NSWindingRule)windingRule;
- (void)setWindingRule:(NSWindingRule)windingRule;
- (void)removeAllPoints;
- (BOOL)isEmpty;
- (NSPoint)currentPoint;
- (void)closePath;
- (void)fill;
- (void)stroke;
- (void)addClip;
- (BOOL)containsPoint:(NSPoint)point;
- (void)getLineDash:(CGFloat *)pattern count:(NSInteger *)count phase:(CGFloat *)phase;
- (CGFloat)lineWidth;
- (void)setLineWidth:(CGFloat)lineWidth;
- (CGFloat)miterLimit;
- (void)setMiterLimit:(CGFloat)miterLimit;
- (CGFloat)flatness;
- (void)setFlatness:(CGFloat)flatness;
- (void)setLineDash:(const CGFloat *)pattern count:(NSInteger)count phase:(CGFloat)phase;
- (NSLineCapStyle)lineCapStyle;
- (void)setLineCapStyle:(NSLineCapStyle)lineCapStyle;
- (NSLineJoinStyle)lineJoinStyle;
- (void)setLineJoinStyle:(NSLineJoinStyle)lineJoinStyle;
- (NSInteger)elementCount;
- (NSBezierPathElement)elementAtIndex:(NSInteger)index;
- (NSBezierPathElement)elementAtIndex:(NSInteger)index associatedPoints:(NSPointArray)points;
- (void)setAssociatedPoints:(NSPointArray)points atIndex:(NSInteger)index;
- (NSRect)controlPointBounds;
- (NSRect)bounds;
@end

@interface NSColor : NSObject
+ (NSColor *)cyanColor;
+ (NSColor *)blackColor;
+ (NSColor *)whiteColor;
+ (NSColor *)redColor;
+ (NSColor *)clearColor;
+ (NSColor *)brownColor;
+ (NSColor *)orangeColor;
+ (NSColor *)purpleColor;
+ (NSColor *)yellowColor;
+ (NSColor *)grayColor;
+ (NSColor *)lightGrayColor;
+ (NSColor *)darkGrayColor;
+ (NSColor *)magentaColor;
+ (NSColor *)blueColor;
+ (NSColor *)greenColor;
+ (NSColor *)colorWithCalibratedRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;
+ (NSColor *)colorWithCalibratedWhite:(CGFloat)white alpha:(CGFloat)alpha;
+ (NSColor *)colorWithCalibratedHue:(CGFloat)hue saturation:(CGFloat)saturation brightness:(CGFloat)brightness alpha:(CGFloat)alpha;
+ (NSColor *)colorWithDeviceRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;
+ (NSColor *)colorWithPatternImage:(NSImage*)image;
+ (NSColor *)colorFromPasteboard:(NSPasteboard *)pasteBoard;
+ (NSColor *)selectedTextBackgroundColor;
- (NSColor *)colorUsingColorSpaceName:(NSString *)colorSpace;
- (NSColor *)colorWithAlphaComponent:(CGFloat)alpha;
- (CGFloat)alphaComponent;
- (CGFloat)redComponent;
- (CGFloat)greenComponent;
- (CGFloat)blueComponent;
- (void)getRed:(CGFloat *)red green:(CGFloat *)green blue:(CGFloat *)blue alpha:(CGFloat *)alpha;
- (CGFloat)hueComponent;
- (CGFloat)saturationComponent;
- (CGFloat)brightnessComponent;
- (void)set;
- (void)setFill;
- (void)setStroke;
- (void)writeToPasteboard:(NSPasteboard *)pasteBoard;
- (void)drawSwatchInRect:(NSRect)rect;
- (NSInteger)numberOfComponents;
- (void)getComponents:(CGFloat *)components;
- (void)getHue:(CGFloat *)hue saturation:(CGFloat *)saturation brightness:(CGFloat *)brightness alpha:(CGFloat *)alpha;
@end

@interface NSColorList : NSObject
+ (NSColorList *)colorListNamed:(NSString *)name;
- (NSArray *)allKeys;
- (NSColor *)colorWithKey:(NSString *)key;
@end

@interface NSCursor : NSObject
+ (NSCursor *)currentCursor;
+ (NSCursor *)disappearingItemCursor;
+ (NSCursor *)arrowCursor;
+ (NSCursor *)resizeLeftRightCursor;
+ (NSCursor *)resizeUpDownCursor;
+ (NSCursor *)openHandCursor;
+ (NSCursor *)closedHandCursor;
+ (NSCursor *)crosshairCursor;
+ (NSCursor *)IBeamCursor;
+ (void)pop;
- (id)initWithImage:(NSImage *)newImage hotSpot:(NSPoint)aPoint;
- (void)push;
- (void)set;
- (void)setOnMouseEntered:(BOOL)flag;
@end

@interface NSPrintInfo : NSObject
- (NSSize)paperSize;
- (NSPrintingPaginationMode)horizontalPagination;
- (NSPrintingPaginationMode)verticalPagination;
- (CGFloat)leftMargin;
- (CGFloat)rightMargin;
- (CGFloat)topMargin;
- (CGFloat)bottomMargin;
@end

@interface NSPrintOperation : NSObject 
+ (NSPrintOperation *)printOperationWithView:(NSView *)view printInfo:(NSPrintInfo *)printInfo;
- (void)setShowPanels:(BOOL)flag;
@end

@interface NSDocument : NSObject
- (id)initWithType:(NSString *)typeName error:(NSError **)outError;
- (void)setUndoManager:(NSUndoManager *)undoManager;
- (void)setPrintInfo:(NSPrintInfo *)printInfo;
- (void)runModalPrintOperation:(NSPrintOperation *)printOperation delegate:(id)delegate didRunSelector:(SEL)didRunSelector contextInfo:(void *)contextInfo;
- (NSPrintInfo *)printInfo;
- (NSString *)displayName;
- (NSUndoManager *)undoManager;
- (NSURL *)fileURL;
@end

@interface NSDocumentController : NSObject
+ (id)sharedDocumentController;
- (id)currentDocument;
- (id)documentForWindow:(NSWindow *)window;
@end

@interface NSEvent : NSObject
+ (NSEvent *)mouseEventWithType:(NSEventType)type location:(NSPoint)location modifierFlags:(NSUInteger)flags timestamp:(NSTimeInterval)time windowNumber:(NSInteger)wNum context:(NSGraphicsContext*)context eventNumber:(NSInteger)eNum clickCount:(NSInteger)cNum pressure:(float)pressure;
- (NSInteger)clickCount;
- (unsigned short)keyCode;
- (NSWindow *)window;
- (NSPoint)locationInWindow;
- (NSTimeInterval)timestamp;
- (NSUInteger)modifierFlags;
- (CGFloat)deltaY;    
- (NSEventType)type;
- (NSString *)charactersIgnoringModifiers;
@end

@interface NSFont : NSObject
+ (NSFont *)fontWithName:(NSString *)fontName size:(CGFloat)fontSize;
- (NSRect)boundingRectForGlyph:(NSGlyph)aGlyph;
- (NSGlyph)glyphWithName:(NSString *)aName;
- (CGFloat)pointSize;
- (CGFloat)xHeight;
- (CGFloat)underlinePosition;
- (CGFloat)underlineThickness;
- (NSString *)displayName;
@end

@interface NSFontManager : NSObject
+ (NSFontManager *)sharedFontManager;
- (NSDictionary *)convertAttributes:(NSDictionary *)attributes;
- (NSFont *)convertFont:(NSFont *)fontObj;
- (NSFont *)convertFont:(NSFont *)fontObj toSize:(CGFloat)size;
- (NSFont *)convertFont:(NSFont *)fontObj toFace:(NSString *)typeface;
- (NSFont *)convertFont:(NSFont *)fontObj toFamily:(NSString *)family;
- (NSFont *)convertFont:(NSFont *)fontObj toHaveTrait:(NSFontTraitMask)trait;
- (NSFont *)convertFont:(NSFont *)fontObj toNotHaveTrait:(NSFontTraitMask)trait;
- (void)setSelectedAttributes:(NSDictionary *)attributes isMultiple:(BOOL)flag;
- (void)setSelectedFont:(NSFont *)fontObj isMultiple:(BOOL)flag;
- (NSMenu *)fontMenu:(BOOL)create;
@end

@interface NSGraphicsContext : NSObject
+ (NSGraphicsContext *)graphicsContextWithGraphicsPort:(void *)graphicsPort flipped:(BOOL)initialFlippedState;
+ (BOOL)currentContextDrawingToScreen;
+ (void)saveGraphicsState;
+ (void)restoreGraphicsState;
+ (NSGraphicsContext *)currentContext;
+ (void)setCurrentContext:(NSGraphicsContext *)context;
+ (NSGraphicsContext *)graphicsContextWithBitmapImageRep:(NSBitmapImageRep *)bitmapRep;
- (void)saveGraphicsState;
- (void)restoreGraphicsState;
- (void *)graphicsPort;
- (BOOL)isFlipped;
- (BOOL)isDrawingToScreen;
- (void)setImageInterpolation:(NSImageInterpolation)interpolation;
- (void)setCompositingOperation:(NSCompositingOperation)operation;
- (void)setShouldAntialias:(BOOL)antialias;
@end

@interface NSImageRep : NSObject
+ (id)imageRepWithData:(NSData *)epsData;
- (NSSize)size;
- (BOOL)draw;
- (BOOL)drawAtPoint:(NSPoint)point;
- (BOOL)drawInRect:(NSRect)rect;
@end

@interface NSBitmapImageRep : NSImageRep
+ (NSData *)TIFFRepresentationOfImageRepsInArray:(NSArray *)array;
- (id)initWithBitmapDataPlanes:(unsigned char **)planes pixelsWide:(NSInteger)width pixelsHigh:(NSInteger)height bitsPerSample:(NSInteger)bps samplesPerPixel:(NSInteger)spp hasAlpha:(BOOL)alpha isPlanar:(BOOL)isPlanar colorSpaceName:(NSString *)colorSpaceName bytesPerRow:(NSInteger)rBytes bitsPerPixel:(NSInteger)pBits; 
- (id)initWithBitmapDataPlanes:(unsigned char **)planes pixelsWide:(NSInteger)width pixelsHigh:(NSInteger)height bitsPerSample:(NSInteger)bps samplesPerPixel:(NSInteger)spp hasAlpha:(BOOL)alpha isPlanar:(BOOL)isPlanar colorSpaceName:(NSString *)colorSpaceName  bitmapFormat:(NSBitmapFormat)bitmapFormat bytesPerRow:(NSInteger)rBytes bitsPerPixel:(NSInteger)pBits; 
- (void)getPixel:(NSUInteger[])p atX:(NSInteger)x y:(NSInteger)y;
@end

@interface NSPDFImageRep : NSImageRep
- (NSData*)PDFRepresentation;
@end

@interface NSImage : NSObject
+ (BOOL)canInitWithPasteboard:(NSPasteboard *)pasteboard;
+ (NSArray *)imagePasteboardTypes;
+ (id)imageNamed:(NSString *)name;
- (id)initWithSize:(NSSize)aSize;
- (id)initWithPasteboard:(NSPasteboard *)pasteboard;
- (NSArray *)representations;
- (void)addRepresentation:(NSImageRep *)imageRep;
- (BOOL)isValid;
- (NSSize)size;
- (void)setSize:(NSSize)aSize;
- (id)initByReferencingFile:(NSString *)fileName;
- (void)setFlipped:(BOOL)flag;
- (BOOL)isFlipped;
- (void)setScalesWhenResized:(BOOL)flag;
- (void)setCacheMode:(NSImageCacheMode)mode;
- (void)recache;
- (void)lockFocus;
- (void)unlockFocus;
- (void)drawAtPoint:(NSPoint)point fromRect:(NSRect)fromRect operation:(NSCompositingOperation)op fraction:(CGFloat)delta;
- (void)drawInRect:(NSRect)rect fromRect:(NSRect)fromRect operation:(NSCompositingOperation)op fraction:(CGFloat)delta;
- (NSData *)TIFFRepresentation;
@end

@interface NSMenuItem : NSObject <NSValidatedUserInterfaceItem>
+ (NSMenuItem *)separatorItem;
- (id)initWithTitle:(NSString *)aString action:(SEL)aSelector keyEquivalent:(NSString *)charCode;
- (void)setTarget:(id)anObject;
- (void)setTitle:(NSString *)aString;
- (void)setState:(NSInteger)state;
- (NSInteger)state;
- (NSString *)title;
- (SEL)action;
- (void)setAction:(SEL)aSelector;
- (NSInteger)tag;
- (void)setTag:(NSInteger)anInt;
- (void)setEnabled:(BOOL)flag;
- (void)setSubmenu:(NSMenu *)submenu;
- (id)representedObject;
- (void)setRepresentedObject:(id)anObject;
- (NSMenu *)submenu;
- (void)setImage:(NSImage *)menuImage;
@end

@interface NSMenu : NSObject
- (NSArray *)itemArray;
- (NSInteger)numberOfItems;
- (void)insertItem:(NSMenuItem *)newItem atIndex:(NSInteger)index;
- (NSMenuItem *)addItemWithTitle:(NSString *)aString action:(SEL)aSelector keyEquivalent:(NSString *)charCode;
- (NSMenuItem *)itemAtIndex:(NSInteger)index;
- (NSMenuItem *)itemWithTag:(NSInteger)tag;
- (NSMenuItem *)itemWithTitle:(NSString *)aTitle;
- (void)addItem:(NSMenuItem *)newItem;
- (void)removeItem:(NSMenuItem *)item;
- (void)removeItemAtIndex:(NSInteger)index;
- (NSInteger)indexOfItemWithTitle:(NSString *)aTitle;
- (NSInteger)indexOfItemWithRepresentedObject:(id)object;
- (void)setAutoenablesItems:(BOOL)flag;
@end

@interface NSNib : NSObject
- (id)initWithNibNamed:(NSString *)nibName bundle:(NSBundle *)bundle;
- (BOOL)instantiateNibWithOwner:(id)owner topLevelObjects:(NSArray **)topLevelObjects;
@end

@interface NSParagraphStyle : NSObject
+ (NSParagraphStyle *)defaultParagraphStyle;
- (NSTextAlignment)alignment;
@end

@interface NSMutableParagraphStyle : NSParagraphStyle
- (void)setLineBreakMode:(NSLineBreakMode)mode;
- (void)setAlignment:(NSTextAlignment)alignment;
@end

@interface NSPasteboard : NSObject
+ (NSPasteboard *)generalPasteboard;
+ (NSPasteboard *)pasteboardWithName:(NSString *)name;
- (BOOL)setData:(NSData *)data forType:(NSString *)dataType;
- (NSInteger)declareTypes:(NSArray *)newTypes owner:(id)newOwner;
- (NSString *)availableTypeFromArray:(NSArray *)types;
- (NSInteger)addTypes:(NSArray *)newTypes owner:(id)newOwner;
- (NSData *)dataForType:(NSString *)dataType;
- (NSString *)stringForType:(NSString *)dataType;
- (id)propertyListForType:(NSString *)dataType;
- (BOOL)setString:(NSString *)string forType:(NSString *)dataType;
- (NSInteger)changeCount;
@end

@interface NSTextContainer : NSObject
- (id)initWithContainerSize:(NSSize)size;
- (NSSize)containerSize;
- (void)setContainerSize:(NSSize)size;
- (void)setWidthTracksTextView:(BOOL)flag;
- (void)setHeightTracksTextView:(BOOL)flag;
- (void)setLineFragmentPadding:(CGFloat)pad;
- (void)setTextView:(NSTextView *)textView;
- (NSRect)lineFragmentRectForProposedRect:(NSRect)proposedRect sweepDirection:(NSLineSweepDirection)sweepDirection movementDirection:(NSLineMovementDirection)movementDirection remainingRect:(NSRectPointer)remainingRect;
@end

@interface NSLayoutManager : NSObject
- (NSArray *)textContainers;
- (NSTextStorage *)textStorage;
- (NSTypesetter *)typesetter;
- (void)replaceTextStorage:(NSTextStorage *)newTextStorage;
- (void)setUsesScreenFonts:(BOOL)flag;
- (void)drawGlyphsForGlyphRange:(NSRange)glyphsToShow atPoint:(NSPoint)origin;
- (NSGlyph)glyphAtIndex:(NSUInteger)glyphIndex;
- (NSUInteger)characterIndexForGlyphAtIndex:(NSUInteger)glyphIndex;
- (NSPoint)locationForGlyphAtIndex:(NSUInteger)glyphIndex;
- (NSRect)lineFragmentUsedRectForGlyphAtIndex:(NSUInteger)glyphIndex effectiveRange:(NSRangePointer)effectiveGlyphRange;
- (NSRect)lineFragmentRectForGlyphAtIndex:(NSUInteger)glyphIndex effectiveRange:(NSRangePointer)effectiveGlyphRange withoutAdditionalLayout:(BOOL)flag;
- (void)drawBackgroundForGlyphRange:(NSRange)glyphsToShow atPoint:(NSPoint)origin;
- (NSRect)lineFragmentRectForGlyphAtIndex:(NSUInteger)glyphIndex effectiveRange:(NSRangePointer)effectiveGlyphRange;
- (NSRange)glyphRangeForTextContainer:(NSTextContainer *)container;
- (NSRect)usedRectForTextContainer:(NSTextContainer *)container;
- (void)addTextContainer:(NSTextContainer *)container;
- (BOOL)isValidGlyphIndex:(NSUInteger)glyphIndex;
- (NSRect)boundingRectForGlyphRange:(NSRange)glyphRange inTextContainer:(NSTextContainer *)container;
- (NSUInteger)glyphIndexForCharacterAtIndex:(NSUInteger)charIndex;
- (NSRange)characterRangeForGlyphRange:(NSRange)glyphRange actualGlyphRange:(NSRangePointer)actualGlyphRange;
- (NSRange)glyphRangeForBoundingRect:(NSRect)bounds inTextContainer:(NSTextContainer *)container;
- (NSRange)glyphRangeForCharacterRange:(NSRange)charRange actualCharacterRange:(NSRangePointer)actualCharRange;
@end

@interface NSResponder : NSObject
- (NSResponder *)nextResponder;
- (void)setNextResponder:(NSResponder *)aResponder;
- (void)keyDown:(NSEvent *)theEvent;
- (void)mouseUp:(NSEvent *)theEvent;
- (void)scrollWheel:(NSEvent *)theEvent;
- (void)interpretKeyEvents:(NSArray *)eventArray;
- (void)doCommandBySelector:(SEL)aSelector;
- (BOOL)tryToPerform:(SEL)anAction with:(id)anObject;
- (void)insertNewline:(id)sender;
- (void)insertTab:(id)sender;
- (void)insertNewlineIgnoringFieldEditor:(id)sender;
- (void)insertTabIgnoringFieldEditor:(id)sender;
@end

@interface NSShadow : NSObject
- (NSSize)shadowOffset;
- (CGFloat)shadowBlurRadius;
- (void)setShadowBlurRadius:(CGFloat)val;
- (NSColor *)shadowColor;
- (void)setShadowColor:(NSColor *)color;
- (void)setShadowOffset:(NSSize)offset;
- (void)set;
@end

@interface NSTypesetter : NSObject
- (CGFloat)baselineOffsetInLayoutManager:(NSLayoutManager *)layoutMgr glyphIndex:(NSUInteger)glyphIndex;
@end

@interface NSWindow : NSObject
- (id)initWithContentRect:(NSRect)contentRect styleMask:(NSUInteger)aStyle backing:(NSBackingStoreType)bufferingType defer:(BOOL)flag;
- (void)setExcludedFromWindowsMenu:(BOOL)flag;
- (NSInteger)windowNumber;
- (id)contentView;
- (NSRect)frame;
- (void)center;
- (void)setMenu:(NSMenu *)menu;
- (BOOL)isVisible;
- (BOOL)isMainWindow;
- (NSColor *)backgroundColor;
- (void)makeKeyAndOrderFront:(id)sender;
- (void)orderFront:(id)sender;
- (void)orderOut:(id)sender;
- (void)setLevel:(NSInteger)newLevel;
- (void)setFrame:(NSRect)frameRect display:(BOOL)flag;
- (void)discardEventsMatchingMask:(NSUInteger)mask beforeEvent:(NSEvent *)lastEvent;
- (void)postEvent:(NSEvent *)event atStart:(BOOL)flag;
- (NSEvent *)nextEventMatchingMask:(NSUInteger)mask;
- (void)invalidateCursorRectsForView:(NSView *)aView;
- (NSResponder *)firstResponder;
- (BOOL)makeFirstResponder:(NSResponder *)aResponder;
- (void)setAcceptsMouseMovedEvents:(BOOL)flag;
- (void)setReleasedWhenClosed:(BOOL)flag;
- (void)setHasShadow:(BOOL)hasShadow;
- (void)setAlphaValue:(CGFloat)windowAlpha;
- (void)setOpaque:(BOOL)isOpaque;
- (NSPoint)convertBaseToScreen:(NSPoint)aPoint;
- (void)setFrameOrigin:(NSPoint)aPoint;
- (void)setBackgroundColor:(NSColor *)color;
@end

@interface NSWindowController : NSResponder
- (NSWindow *)window;
- (IBAction)showWindow:(id)sender;
@end

@interface NSView : NSResponder
- (id)initWithFrame:(NSRect)frameRect;
- (NSUndoManager *)undoManager;
- (void)setNeedsDisplay:(BOOL)flag;
- (void)setNeedsDisplayInRect:(NSRect)invalidRect;
- (NSWindow *)window;
- (NSView *)superview;
- (NSRect)visibleRect;
- (NSRect)bounds;
- (void)setBoundsSize:(NSSize)newSize;
- (void)setFrame:(NSRect)frameRect;
- (BOOL)isFlipped;
- (NSRect)frame;
- (void)setFrameSize:(NSSize)newSize;
- (NSPoint)convertPoint:(NSPoint)aPoint fromView:(NSView *)aView;
- (BOOL)autoscroll:(NSEvent *)theEvent;
- (void)scrollPoint:(NSPoint)aPoint;
- (BOOL)scrollRectToVisible:(NSRect)aRect;
- (NSScrollView *)enclosingScrollView;
- (void)registerForDraggedTypes:(NSArray *)newTypes;
- (void)unregisterDraggedTypes;
- (void)addSubview:(NSView *)aView;
- (void)removeFromSuperview;
- (void)setPostsFrameChangedNotifications:(BOOL)flag;
- (BOOL)lockFocusIfCanDraw;
- (void)getRectsExposedDuringLiveResize:(NSRect[4])exposedRects count:(NSInteger *)count;
- (void)getRectsBeingDrawn:(const NSRect **)rects count:(NSInteger *)count;
- (BOOL)inLiveResize;
- (void)addCursorRect:(NSRect)aRect cursor:(NSCursor *)anObj;
- (NSMenu *)menuForEvent:(NSEvent *)event;
- (void)scaleUnitSquareToSize:(NSSize)newUnitSize;
- (NSPoint)convertPoint:(NSPoint)aPoint toView:(NSView *)aView;
- (BOOL)needsToDrawRect:(NSRect)aRect;
- (NSData *)dataWithPDFInsideRect:(NSRect)rect;
- (void)dragImage:(NSImage *)anImage at:(NSPoint)viewLocation offset:(NSSize)initialOffset event:(NSEvent *)event pasteboard:(NSPasteboard *)pboard source:(id)sourceObj slideBack:(BOOL)slideFlag;
@end

@interface NSClipView : NSView
- (NSRect)documentVisibleRect;
@end

@interface NSTextView : NSView
- (void)setDrawsBackground:(BOOL)flag;
- (void)setFieldEditor:(BOOL)flag;
- (void)setDelegate:(id <NSTextViewDelegate>)anObject;
- (void)setSelectedRange:(NSRange)charRange;
- (void)setAllowsUndo:(BOOL)flag;
- (void)setImportsGraphics:(BOOL)flag;
- (void)setTypingAttributes:(NSDictionary *)attrs;
- (NSTextContainer *)textContainer;
- (NSLayoutManager *)layoutManager;
- (NSTextStorage *)textStorage;
- (void)setTextContainerInset:(NSSize)inset;
- (void)setAutomaticQuoteSubstitutionEnabled:(BOOL)flag;
- (BOOL)isAutomaticQuoteSubstitutionEnabled;
- (void)setHorizontallyResizable:(BOOL)flag;
- (void)setVerticallyResizable:(BOOL)flag;
- (void)setMaxSize:(NSSize)newMaxSize;
- (void)setMinSize:(NSSize)newMinSize;
@end

@interface NSRulerView : NSView
+ (void)registerUnitWithName:(NSString *)unitName abbreviation:(NSString *)abbreviation unitToPointsConversionFactor:(CGFloat)conversionFactor stepUpCycle:(NSArray *)stepUpCycle stepDownCycle:(NSArray *)stepDownCycle;
- (NSRulerOrientation)orientation;
- (void)setOriginOffset:(CGFloat)offset;
- (void)setMeasurementUnits:(NSString *)unitName;
- (void)setClientView:(NSView *)client;
- (void)setAccessoryView:(NSView *)accessory;
- (void)setMarkers:(NSArray *)markers;
- (void)addMarker:(NSRulerMarker *)marker;
- (void)moveRulerlineFromLocation:(CGFloat)oldLocation toLocation:(CGFloat)newLocation;
- (void)setReservedThicknessForMarkers:(CGFloat)thickness;
@end

@interface NSRulerMarker : NSObject
- (id)initWithRulerView:(NSRulerView *)ruler markerLocation:(CGFloat)location image:(NSImage *)image imageOrigin:(NSPoint)imageOrigin;
- (void)setMarkerLocation:(CGFloat)location;
- (CGFloat)markerLocation;
- (NSRulerView *)ruler;
- (NSRect)imageRectInRuler;
@end

@interface NSScrollView : NSView
- (void)setRulersVisible:(BOOL)flag;
- (BOOL)rulersVisible;
- (NSRulerView *)horizontalRulerView;
- (NSRulerView *)verticalRulerView;
- (void)setHasHorizontalRuler:(BOOL)flag;
- (void)setHasVerticalRuler:(BOOL)flag;
- (void)setBackgroundColor:(NSColor *)color;
- (void)setDrawsBackground:(BOOL)flag;
- (NSClipView *)contentView;
@end

@interface NSCell : NSObject
// NSSegmentedCell
- (NSInteger)tagForSegment:(NSInteger)segment;
@end

@interface NSControl : NSView
- (SEL)action;
- (void)setFont:(NSFont *)fontObj;
- (void)setDoubleValue:(double)aDouble;
- (void)sizeToFit;
- (void)setStringValue:(NSString *)aString;
- (void)setFormatter:(NSFormatter *)newFormatter;
- (id)formatter;
- (NSCell *)cell;
@end

@interface NSSegmentedControl : NSControl
- (NSInteger)selectedSegment;
@end

@interface NSButton : NSControl
- (NSInteger)state;
- (void)setState:(NSInteger)value;
@end

@interface NSTextField : NSControl
- (void)setBezeled:(BOOL)flag;
- (void)setDrawsBackground:(BOOL)flag;
- (void)setEditable:(BOOL)flag;
- (void)setSelectable:(BOOL)flag;
- (void)setTextColor:(NSColor *)color;
@end


void FSPathMakeRef(void*, void*, void*);
void LSOpenApplication(void*, void*);
void NSRectFill(NSRect aRect);
void NSRectFillUsingOperation(NSRect aRect, NSCompositingOperation op);
void NSFrameRectWithWidth(NSRect aRect, CGFloat frameWidth);
BOOL NSMouseInRect(NSPoint aPoint, NSRect aRect, BOOL flipped);
void NSBeep(void);
void NSShowAnimationEffect(NSAnimationEffect animationEffect, NSPoint centerLocation, NSSize size, id animationDelegate, SEL didEndSelector, void *contextInfo);
extern CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options);
extern void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties);
extern bool CGImageDestinationFinalize(CGImageDestinationRef idst);


// existing classes with unavailable methods

@interface NSObject (NSMenuValidation)
- (BOOL)validateMenuItem:(NSMenuItem *)menuItem;
@end

@interface NSObject (NSCopying)
- (id)copyWithZone:(NSZone *)zone;
@end

@interface NSBundle (NSBundleImageExtension)
- (id)pathForImageResource:(id)a;
@end

@interface NSString(NSStringDrawing) // and NSExtendedStringDrawing
- (NSSize)sizeWithAttributes:(NSDictionary *)attrs;
- (void)drawAtPoint:(NSPoint)point withAttributes:(NSDictionary *)attrs;
- (void)drawInRect:(NSRect)rect withAttributes:(NSDictionary *)attrs;
- (NSRect)boundingRectWithSize:(NSSize)size options:(NSStringDrawingOptions)options attributes:(NSDictionary *)attributes;
@end

@interface NSDate (NSCalendarDateExtras)
+ (id)dateWithNaturalLanguageString:(NSString *)string;
- (NSString *)descriptionWithCalendarFormat:(NSString *)format timeZone:(NSTimeZone *)aTimeZone locale:(id)locale;
@end

@interface NSURL (NSPasteboardSupport)
+ (NSURL *)URLFromPasteboard:(NSPasteboard *)pasteBoard;
@end

@interface NSNumberFormatter (NSNumberFormatterCompatibility)
- (void)setFormat:(NSString *)string;
@end

@interface NSObject (RandomMetadataIntrospection)
- (NSDate *)dateValue;
- (NSRect)rect;
- (NSAttributedString *)attributedString;
@end


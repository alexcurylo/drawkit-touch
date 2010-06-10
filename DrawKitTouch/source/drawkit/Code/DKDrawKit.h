//
// DKDrawKit.h
//
// Umbrella #import for iPhone and non-iPhone projects
//

#import "DKCompatibility.h"

#ifdef TARGET_OS_IPHONE
// temporary until we work out actual replacements
#import "DKTDesktopPlaceholders.h"
#endif TARGET_OS_IPHONE


#ifndef TARGET_OS_IPHONE
// NSView-based classes with UIView-based DKTXxx analogues
#import "GCZoomView.h"
#import "DKDrawingView.h"
// CIFilters not available
#import "DKCIFilterRastGroup.h"
// NSDocument not available
#import "DKDrawingDocument.h"
// UIColor is the iPhone color class, most references abstracted to DKColor
#import "NSColor+DKAdditions.h"
#endif TARGET_OS_IPHONE


#ifdef TARGET_OS_IPHONE
// UIView-based analogues to the DKXxx versions
#import "DKTZoomView.h"
#import "DKTDrawingView.h"
// UIColor-based analogue to NSColor+DKAdditions.h
#import "UIColor+DKTAdditions.h"
// CoreGraphics analogue to NSShadow
#import "DKTShadow.h"
// CoreGraphics analogue to NSAffineTransform
#import "DKTAffineTransform.h"
// additions to emulate NSBezierPath
#import "UIBezierPath+DKTAdditions.h"
#endif TARGET_OS_IPHONE


#import "DKSelectionPDFView.h"
#import "DKToolController.h"
#import "DKDrawKitMacros.h"

#import "DKObjectStorageProtocol.h"
#import "DKLinearObjectStorage.h"
#import "DKBSPObjectStorage.h"
#import "DKBSPDirectObjectStorage.h"

#import "DKDrawing.h"
#import "DKDrawing+Paper.h"
#import "DKDrawing+Export.h"

#import "DKLayer.h"
#import "DKLayer+Metadata.h"
#import "DKLayerGroup.h"
#import "DKObjectOwnerLayer.h"
#import "DKObjectDrawingLayer.h"
#import "DKObjectDrawingLayer+Alignment.h"
#import "DKObjectDrawingLayer+BooleanOps.h"
#import "DKObjectDrawingLayer+Duplication.h"

#import "DKGridLayer.h"
#import "DKGuideLayer.h"
#import "DKDrawingInfoLayer.h"
#import "DKImageOverlayLayer.h"

#import "DKDrawableObject.h"
#import "DKDrawableObject+Metadata.h"
#import "DKDrawableShape.h"
#import "DKReshapableShape.h"
#import "DKDrawableShape+Hotspots.h"
#import "DKImageShape.h"
#import "DKImageShape+Vectorization.h"
#import "DKShapeGroup.h"
#import "DKDrawablePath.h"
#import "DKTextShape.h"
#import "DKTextPath.h"
#import "DKArcPath.h"
#import "DKRegularPolygonPath.h"

#import "DKStyleRegistry.h"
#import "DKStyle.h"
#import "DKStyle+Text.h"
#import "DKStyle+SimpleAccess.h"
#import "DKRasterizer.h"
#import "DKRastGroup.h"
#import "DKRasterizerProtocol.h"

#import "DKStrokeDash.h"
#import "DKFillPattern.h"
#import "DKHatching.h"
#import "DKStroke.h"
#import "DKZigZagStroke.h"
#import "DKRoughStroke.h"
#import "DKArrowStroke.h"
#import "DKFill.h"
#import "DKZigZagFill.h"
#import "DKTextAdornment.h"
#import "DKPathDecorator.h"
#import "DKQuartzBlendRastGroup.h"
#import "DKImageAdornment.h"

#import "DKDrawkitInspectorBase.h"

#import "DKDrawingToolProtocol.h"
#import "DKDrawingTool.h"
#import "DKToolRegistry.h"
#import "DKObjectCreationTool.h"
#import "DKPathInsertDeleteTool.h"
#import "DKSelectAndEditTool.h"
#import "DKZoomTool.h"
#import "DKShapeFactory.h"

#import "DKRandom.h"
#import "DKUniqueID.h"
#import "DKGeometryUtilities.h"
#import "DKDistortionTransform.h"
#import "DKCategoryManager.h"
#import "DKCommonTypes.h"
#import "DKKnob.h"
#import "DKRouteFinder.h"

#ifdef qUseCurveFit
 #import "CurveFit.h"
#endif
#import "DKGradient.h"
#import "DKGradient+UISupport.h"
#import "GCInfoFloater.h"
#import "DKUndoManager.h"
#import "NSBezierPath+Editing.h"
#import "NSBezierPath+GPC.h"
#import "NSBezierPath+Geometry.h"
#import "NSBezierPath+Text.h"
#import "NSDictionary+DeepCopy.h"
#import "NSShadow+Scaling.h"
#import "NSAffineTransform+DKAdditions.h"
#import "NSString+DKAdditions.h"
#import "NSMutableArray+DKAdditions.h"
#import "NSImage+DKAdditions.h"
#import "DKQuartzCache.h"

#ifdef qUseLogEvent
 #import "LogEvent.h"
#endif

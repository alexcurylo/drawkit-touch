//
//  DKTShadow.h
//
//  Copyright 2010 Trollwerks Inc. All rights reserved.
//
// CoreGraphics analogue to NSShadow
//

@interface DKTShadow : NSObject < NSCopying >
{
   CGSize shadowOffset;
   UIColor *shadowColor;
   CGFloat shadowBlurRadius;
}

@property (nonatomic) CGSize shadowOffset;
@property (nonatomic, copy) UIColor *shadowColor;
@property (nonatomic) CGFloat shadowBlurRadius;

- (id)copyWithZone:(NSZone *)zone;

- (void)set;

@end

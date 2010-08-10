//
//  DKTRulerScrollView.h
//
//  Copyright 2010 Trollwerks Inc. All rights reserved.
//
// UIScrollView subclass including NSScrollView style ruler support
//

@interface DKTRulerScrollView : UIScrollView
{
   BOOL hasHorizontalRuler;
   BOOL hasVerticalRuler;
   BOOL rulersVisible;
}

@property (nonatomic, assign) BOOL hasHorizontalRuler;
@property (nonatomic, assign) BOOL hasVerticalRuler;
@property (nonatomic, assign) BOOL rulersVisible;

- (void)awakeFromNib;

- (BOOL)touchesShouldBegin:(NSSet *)touches withEvent:(UIEvent *)event inContentView:(UIView *)view;
- (BOOL)touchesShouldCancelInContentView:(UIView *)view;

- (void)setRulersVisible:(BOOL)visible;

@end

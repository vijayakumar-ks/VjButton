//
//  VJButton.m
//  VJUI
//
//  Created by  on 10/01/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "VJButton.h"
#import <QuartzCore/QuartzCore.h>

@interface VjButton ()
@property (strong,nonatomic) CAGradientLayer *gradientLayer;
@property (strong,nonatomic) CAGradientLayer *highlightLayer;
@property (strong,nonatomic) CALayer *innerLayer;

- (void)setDefaults;
- (void)normalGradientLayer;
- (void)highlightGradientLayer;
- (void)innerBorderLayer;
@end

@implementation VjButton
@synthesize normalstartPointColor,normalstopPointColor,highlightstartPointColor,highlightstopPointColor;
@synthesize normalLocations;
@synthesize gradientLayer,highlightLayer,innerLayer;
@synthesize borderCornerRadius,borderWidth,borderColor;
@synthesize hightlightBackgroundColor,normalBackgroundColor;
@synthesize borderEtched;
@synthesize smoothHightlight;
 
- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setDefaults];
    }
    return self;
}

- (void)awakeFromNib;
{
    [self setDefaults];
}

- (void)setDefaults
{     
    normalBackgroundColor           = self.backgroundColor;
     
    hightlightBackgroundColor       = [UIColor blueColor];
    
    normalLocations                 = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.0], [NSNumber numberWithFloat:1.0], nil];
    
    borderEtched                    = TRUE;
    
    smoothHightlight                = FALSE;
}
 
-(void)setTitle:(NSString *)title forState:(UIControlState)state
{
    [super setTitle:title forState:state];
}

-(void)setTitleColor:(UIColor *)color forState:(UIControlState)state
{
    [super setTitleColor:color forState:state];
}

- (void)setHighlighted:(BOOL)highlighted
{
	[CATransaction begin];
	[CATransaction setDisableActions:!smoothHightlight];
    
	highlightLayer.hidden = !highlighted;
    
	[CATransaction commit];
	
	[super setHighlighted:highlighted];
}

- (void)drawRect:(CGRect)rect;
{
    [self normalGradientLayer];
    [self highlightGradientLayer];
    [self innerBorderLayer];
    [super drawRect:rect];
}

- (void)normalGradientLayer
{
    
    [[self layer] setCornerRadius:borderCornerRadius];
    [[self layer] setBorderWidth:borderWidth];
    [[self layer] setBorderColor:borderColor.CGColor];
    [[self layer] setMasksToBounds:YES];
    
    gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.bounds;
    [gradientLayer setBackgroundColor:normalBackgroundColor.CGColor];
    if(normalstartPointColor && normalstopPointColor)
        gradientLayer.colors = [NSArray arrayWithObjects: 
                                (id)normalstartPointColor.CGColor,
                                (id)normalstopPointColor.CGColor,nil
                                ];
    gradientLayer.locations = normalLocations;
    //[gradientLayer setPosition:CGPointMake([self bounds].size.height/2, [self bounds].size.height/2)];
    [self.layer insertSublayer:gradientLayer atIndex:0];
}

- (void)highlightGradientLayer
{
    highlightLayer = [CAGradientLayer layer];
    highlightLayer.frame = self.bounds;
    [highlightLayer setBackgroundColor:hightlightBackgroundColor.CGColor];
    if(highlightstartPointColor && highlightstopPointColor)
        highlightLayer.colors = [NSArray arrayWithObjects: 
                                 (id)highlightstartPointColor.CGColor,
                                 (id)highlightstopPointColor.CGColor,nil
                                 ];
    highlightLayer.hidden = YES;
    [self.layer insertSublayer:highlightLayer above:gradientLayer];
}

- (void)innerBorderLayer
{
    if (borderEtched)
    {
        innerLayer = [CALayer layer];
        innerLayer.frame = CGRectInset(self.bounds, 0.4, 0.4);
        innerLayer.cornerRadius= borderCornerRadius;
        innerLayer.borderWidth = 2;
        innerLayer.borderColor = [[UIColor whiteColor] CGColor];
        //innerLayer.opacity = 0.5;
        [self.layer insertSublayer:innerLayer above:gradientLayer];
    }
}

@end

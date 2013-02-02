//
//  VJButton.h
//  VJUI
//
//  Created by  on 10/01/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VjButton : UIButton

@property (nonatomic,retain) UIColor *normalstartPointColor;
@property (nonatomic,retain) UIColor *normalstopPointColor;
@property (nonatomic,copy)   NSArray *normalLocations;       // only support linear vertical gradient

@property (nonatomic,retain) UIColor *highlightstartPointColor;
@property (nonatomic,retain) UIColor *highlightstopPointColor;

@property (nonatomic,retain) UIColor *normalBackgroundColor;
@property (nonatomic,retain) UIColor *hightlightBackgroundColor;

@property (nonatomic,assign) float borderCornerRadius;
@property (nonatomic,assign) float borderWidth;
@property (nonatomic,assign) UIColor * borderColor;

@property (nonatomic,assign) BOOL borderEtched;       //Default TRUE

@property (nonatomic,assign) BOOL smoothHightlight;   //Default FALSE

@end
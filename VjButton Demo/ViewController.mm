//
//  ViewController.m
//  VjButton Demo
//
//  Created by  on 28/01/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

#define BTN_WIDTH 72
#define BTN_HEIGHT 37
@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    btn1.hightlightBackgroundColor  = [UIColor lightTextColor]; 
    btn1.smoothHightlight           = TRUE;
    btn1.borderEtched               = TRUE;
    btn1.borderWidth                = 1;
    btn1.borderCornerRadius         = 2;
    
    VjButton *btn2 = [[VjButton alloc] initWithFrame:CGRectMake(self.view.center.x - BTN_WIDTH/2 , 100, BTN_WIDTH, BTN_HEIGHT)];
    [btn2 addTarget:self action:@selector(btn_tapped:) forControlEvents:UIControlEventTouchUpInside];
    [btn2 setTag:2];
    [btn2 setTitle:@"Button 2" forState:UIControlStateNormal];
    [btn2.titleLabel setFont:[UIFont systemFontOfSize:15]];
    
    UIColor *normalStart            = [UIColor colorWithRed:148/255.0 green:63/255.0 blue:27/255.0 alpha:1.0f];
    UIColor *normalStop             = [UIColor colorWithRed:255/255.0 green:118/255.0 blue:84/255.0 alpha:1.0f];
    btn2.normalstartPointColor      = normalStart;
    btn2.normalstopPointColor       = normalStop;
    
    UIColor *highlightStart         = [UIColor colorWithRed:148/255.0 green:58/255.0 blue:31/255.0 alpha:1.0f];
    UIColor *highlightStop          = [UIColor colorWithRed:255/255.0 green:140/255.0 blue:117/255.0 alpha:1.0f];
    btn2.highlightstartPointColor   = highlightStart;
    btn2.highlightstopPointColor    = highlightStop;
    
    NSNumber *stopOne               = [NSNumber numberWithFloat:0.0];
    NSNumber *stopTwo               = [NSNumber numberWithFloat:0.5];
    NSArray *locations              = [NSArray arrayWithObjects:stopOne, stopTwo, nil];
    btn2.normalLocations            = locations;


    btn2.normalBackgroundColor      = nil; 
    btn2.borderEtched               = FALSE;
    
    [self.view addSubview:btn2];

    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

-(IBAction)btn_tapped:(id)sender
{
    UIButton *btn = (UIButton *) sender;
    
    NSLog(@"Button Tag id:%d",btn.tag);
}

@end

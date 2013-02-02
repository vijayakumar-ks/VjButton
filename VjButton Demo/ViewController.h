//
//  ViewController.h
//  VjButton Demo
//
//  Created by  on 28/01/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VJButton.h"

@interface ViewController : UIViewController
{
    IBOutlet VjButton *btn1;
}

-(IBAction)btn_tapped:(id)sender;
@end

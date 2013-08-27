//
//  FancySegmentedControl.h
//  PDSPlaceOrder
//
//  Created by Megan Keehan on 8/26/13.
//
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface FancySegmentedControl : UISegmentedControl
{
    UIColor *bgNotSelected;
    UIColor *bgSelected;
    UIColor *barNotSelected;
    UIColor *barSelected;
}

-(void)setBackgroundColor:(UIColor *)color forState:(UIControlState *)state;

-(void)setBarColor:(UIColor *)color forState:(UIControlState *)state;

-(void)setTextAttributes:(NSDictionary *)attrs forState:(UIControlState *) state;

@end

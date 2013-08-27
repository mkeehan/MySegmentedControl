//
//  FancySegmentedControl.m
//
//  Created by Megan Keehan on 8/26/13.
//
//

#import "FancySegmentedControl.h"

@implementation FancySegmentedControl

- (id)initWithItems:(NSArray *)items
{
    self = [super initWithItems:items];
    bgSelected = [UIColor blueColor];
    bgNotSelected = [UIColor whiteColor];
    barNotSelected = [UIColor lightGrayColor];
    barSelected = [UIColor orangeColor];
    self.selectedSegmentIndex = 0;
    if (self) {
        //change text stuff
        NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                    [UIFont boldSystemFontOfSize:17], UITextAttributeFont,
                                    [UIColor blackColor], UITextAttributeTextColor,
                                    nil];
        [self setTitleTextAttributes:attributes forState:UIControlStateNormal];
        NSDictionary *highlightedAttributes = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:UITextAttributeTextColor];
        [self setTitleTextAttributes:highlightedAttributes forState:UIControlStateHighlighted];
        
        //set all dividers to nothing
        UIView *yourView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, 30)];
        UIGraphicsBeginImageContext(yourView.bounds.size);
        [yourView.layer renderInContext:UIGraphicsGetCurrentContext()];
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        [self setDividerImage:image
          forLeftSegmentState:UIControlStateNormal
            rightSegmentState:UIControlStateNormal
                   barMetrics:UIBarMetricsDefault];
        [self setDividerImage:image
          forLeftSegmentState:UIControlStateSelected
            rightSegmentState:UIControlStateNormal
                   barMetrics:UIBarMetricsDefault];
        [self setDividerImage:image
          forLeftSegmentState:UIControlStateNormal
            rightSegmentState:UIControlStateSelected
                   barMetrics:UIBarMetricsDefault];
        
        
        yourView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 30)];
        yourView.backgroundColor = bgNotSelected;
        UIView *barView = [[UIView alloc] initWithFrame:CGRectMake(0, yourView.frame.size.height - 3, 40, 3)];
        barView.backgroundColor = barNotSelected;
        [yourView addSubview:barView];
        UIGraphicsBeginImageContext(yourView.bounds.size);
        [yourView.layer renderInContext:UIGraphicsGetCurrentContext()];
        image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        UIImage *normalBackgroundImage = image;
        [self setBackgroundImage:normalBackgroundImage
                        forState:UIControlStateNormal
                      barMetrics:UIBarMetricsDefault];
        
        yourView.backgroundColor = bgSelected;
        barView = [[UIView alloc] initWithFrame:CGRectMake(0, yourView.frame.size.height - 3, 40, 3)];
        barView.backgroundColor = barSelected;
        [yourView addSubview:barView];
        UIGraphicsBeginImageContext(yourView.bounds.size);
        [yourView.layer renderInContext:UIGraphicsGetCurrentContext()];
        image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        UIImage *selectedBackgroundImage = image;
        [self setBackgroundImage:selectedBackgroundImage
                        forState:UIControlStateSelected
                      barMetrics:UIBarMetricsDefault];
    }
    return self;
}

-(void)setBackgroundColor:(UIColor *)color forState:(UIControlState *)state
{
    UIControlState *selectedState = UIControlStateSelected;
    UIColor *barColor;
    if (state == selectedState)
    {
        bgSelected = color;
        barColor = barSelected;
    }
    else
    {
        bgNotSelected = color;
        barColor = barNotSelected;
    }
    UIView *yourView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 30)];
    yourView.backgroundColor = color;
    UIView *barView = [[UIView alloc] initWithFrame:CGRectMake(0, yourView.frame.size.height - 3, 40, 3)];
    barView.backgroundColor = barColor;
    [yourView addSubview:barView];
    UIGraphicsBeginImageContext(yourView.bounds.size);
    [yourView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    [self setBackgroundImage:image
                    forState:state
                  barMetrics:UIBarMetricsDefault];
}

-(void)setBarColor:(UIColor *)color forState:(UIControlState *)state
{
    UIControlState *selectedState = UIControlStateSelected;
    UIColor *bgColor;
    if (state == selectedState)
    {
        barSelected = color;
        bgColor = bgSelected;
    }
    else
    {
        barNotSelected = color;
        bgColor = bgNotSelected;
    }
    UIView *yourView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 30)];
    yourView.backgroundColor = bgColor;
    UIView *barView = [[UIView alloc] initWithFrame:CGRectMake(0, yourView.frame.size.height - 3, 40, 3)];
    barView.backgroundColor = color;
    [yourView addSubview:barView];
    UIGraphicsBeginImageContext(yourView.bounds.size);
    [yourView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [self setBackgroundImage:image
                    forState:state
                  barMetrics:UIBarMetricsDefault];
}

-(void)setTextAttributes:(NSDictionary *)attrs forState:(UIControlState *) state
{
    UIControlState *selectedState = UIControlStateSelected;
    if (state == selectedState)
    {
        //in case user mistakes the states
        state = UIControlStateHighlighted;
    }
    [self setTitleTextAttributes:attrs forState:state];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

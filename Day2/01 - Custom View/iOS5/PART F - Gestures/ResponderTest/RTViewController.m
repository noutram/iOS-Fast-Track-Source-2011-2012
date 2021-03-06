//
//  RTViewController.m
//  ResponderTest
//
//  Created by Nicholas Outram on 11/10/2011.
//  Copyright (c) 2011 University of Plymouth. All rights reserved.
//

#import "RTViewController.h"

@implementation RTViewController {
    
}

@synthesize normalLabel;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UISwipeGestureRecognizer *sga = [[UISwipeGestureRecognizer alloc] 
                                     initWithTarget:self
                                             action:@selector(handleGesture:)];
    
    [self.normalLabel addGestureRecognizer:sga];
    [sga release];
}

- (void)handleGesture:(UIGestureRecognizer *)gestureRecognizer
{
    NSLog(@"Got the swipe!");
}

- (void)viewDidUnload
{
    [self setNormalLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.normalLabel = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    NSLog(@"VIEW CONTROLLER received touch event from %@", NSStringFromClass([[touch view] class]) );
    
    [super touchesBegan:touches withEvent:event];
}

- (void)dealloc {
    [normalLabel release];
    [super dealloc];
}
@end

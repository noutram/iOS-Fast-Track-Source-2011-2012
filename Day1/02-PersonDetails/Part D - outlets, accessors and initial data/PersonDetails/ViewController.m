//
//  ViewController.m
//  PersonDetails
//
//  Created by Nicholas Outram on 28/09/2011.
//  Copyright (c) 2011 University of Plymouth. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@implementation ViewController {

    //Data model reference
    Person *model;
    
    //SubView objects
    IBOutlet UITextField *nameTextField;
    IBOutlet UISegmentedControl *genderSegmentedControl;
    IBOutlet UITextField *weightTextField;
    IBOutlet UITextField *heightTextField;
    IBOutlet UILabel *bmiLabel;      

}

// The designated initializer.  
// Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
// Such as model data which must persist under all conditions
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
        // Custom initialization goes here
        
        //Instantiate the Person data model (programatically) here in the controller
        model = [[Person alloc] initWithName:@"NickO" gender:MALE]; //This has a retain count of 1
        
    }
    return self;
}

//Override dealloc (for manual reference counting)
- (void)dealloc {
    
    //Now dealloc has a real purpose - we must release the model object (so that it can be deallocated)
    [model release];
    
    [super dealloc];
}

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

    //Populate View with Model data
    [self updateViewWithModel];

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
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

//Update the View with the current state of the model
-(void)updateViewWithModel
{
    [nameTextField setText:[model personName]];
    [weightTextField setText:[NSString stringWithFormat:@"%3.1f", [model weightInKg]]];
    [heightTextField setText:[NSString stringWithFormat:@"%1.1f", [model heightInM]]];
    if ([model gender]==MALE) {
        [genderSegmentedControl setSelectedSegmentIndex:0];
    } else {
        [genderSegmentedControl setSelectedSegmentIndex:1];
    }
    
    [bmiLabel setText:[NSString stringWithFormat:@"%3.3f", [model bmi]]];
}

-(void)setModel:(Person*)newModel
{
    [model release];            //Release old model
    model = [newModel retain];  //Replace with new and retain
}

-(Person*)model {
    return model;
}

-(IBAction)doToggle:(id)sender
{
    UISegmentedControl *sc = (UISegmentedControl*)sender;
    NSLog(@"Button toggled - state = %d", [sc selectedSegmentIndex]);
}

@end

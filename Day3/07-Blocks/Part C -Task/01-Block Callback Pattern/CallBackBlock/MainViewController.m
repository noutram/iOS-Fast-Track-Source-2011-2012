//
//  SingletonModelViewController.m
//  SingletonModel
//
//  Created by Nicholas Outram on 12/07/2011.
//  Copyright 2011 University of Plymouth. All rights reserved.
//

#import "MainViewController.h"
#import "ModalViewController.h"

@implementation MainViewController
@synthesize messageLabel;
@synthesize messageString;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {    
        self.messageString = @"Welcome";
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.messageLabel.text = self.messageString;
}


- (void)viewDidUnload
{
    [self setMessageLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)doSplat:(id)sender {
    
    //********
    // TO DO *
    //********
    //Create a block in this context (includes stack) - to be used as a callback by the modal dialog box
    //Don't forget to:
    // call [self dismissModalViewControllerAnimated:YES];
    // update the message with self.messageString = ....

    
    //Create a modal view controller with a block argument
    ModalViewController *modal = [[ModalViewController alloc] initWithNibName:@"ModalViewController" bundle:nil];
    [self presentModalViewController:modal animated:YES];   //This is non-blocking (asynchronous)
    [modal release];
    
    //Note that presentModalViewController:animated: is asynchronous
        
    //This context is now about to go out of scope 
}


- (void)dealloc {
    [messageLabel release];
    [super dealloc];
}

#pragma mark Accessors

//This accessor automatically updates the UI
-(void)setMessageString:(NSString *)newString
{
    //Accessor code (setter)
    if (messageString == newString) return;
    [messageString release];
    messageString = [newString retain];
    
    //Update interface
    if (self.messageLabel) {
        self.messageLabel.text = messageString;
    }
}

@end

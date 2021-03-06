//
//  MainViewController.m
//  PlainTable
//
//  Created by Nicholas Outram on 30/03/2011.
//  Copyright 2011 University of Plymouth. All rights reserved.
//

#import "MainViewController.h"
#import "Model.h"

@implementation MainViewController
@synthesize tableView, model;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
		model = [[Model alloc] init];
    }
    return self;
}


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	self.model = nil;
    [super dealloc];
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return [[self.model categoriesOfPets] count];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
	NSString *Key = [self.model.categoriesOfPets objectAtIndex:section];		//Get the section string (also the key)
	NSArray *arrayOfPets = [self.model.dictionaryOfSections objectForKey:Key];	//Get the object (NSArray) for this Key
	
    return [arrayOfPets count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tv cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tv dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
	// I'm going to use the most basic (default)
	NSString *Key = [self.model.categoriesOfPets objectAtIndex:indexPath.section];		//Get the section string (also the key)
	NSArray *arrayOfPets = [self.model.dictionaryOfSections objectForKey:Key];	//Get the object (NSArray) for this Key
	
	cell.textLabel.text = [arrayOfPets objectAtIndex:indexPath.row];
    
    return cell;
}

//Section title
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	NSString *Key = [self.model.categoriesOfPets objectAtIndex:section];		//Get the section string (also the key)
	return Key;
}

//Deletion support 
- (void)tableView:(UITableView *)tv commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSString *Key = [self.model.categoriesOfPets objectAtIndex:indexPath.section];		//Get the section string (also the key)
	NSMutableArray *arrayOfPets = [self.model.dictionaryOfSections objectForKey:Key];	//Get the object (NSMutableArray) for this Key
	[arrayOfPets removeObjectAtIndex:indexPath.row];
	[tv deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationBottom];
	//[tv reloadData];	//This is NOT needed - don't do this here ;o) If you remove data elsewhere, you may need to do this
}

#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tv didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
    /*
	 <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
	 [self.navigationController pushViewController:detailViewController animated:YES];
	 [detailViewController release];
	 */
	[tv deselectRowAtIndexPath:indexPath animated:YES];
	NSString *Key = [self.model.categoriesOfPets objectAtIndex:indexPath.section];		//Get the section string (also the key)
	NSArray *arrayOfPets = [self.model.dictionaryOfSections objectForKey:Key];	//Get the object (NSArray) for this Key
	NSLog(@"You selected %@ from section %@", [arrayOfPets objectAtIndex:indexPath.row], Key);
}

@end

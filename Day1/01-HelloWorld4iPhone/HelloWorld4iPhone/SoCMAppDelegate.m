//
//  SoCMAppDelegate.m
//  HelloWorld4iPhone
//
//  Created by Nicholas Outram on 27/09/2011.
//  Copyright (c) 2011 University of Plymouth. All rights reserved.
//


// THIS IS THE APPLICATION DELEGATE (delegation pattern will be covered later)

#import "SoCMAppDelegate.h"
#import "SoCMViewController.h"

@implementation SoCMAppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

- (void)dealloc
{
    [_window release];
    [_viewController release];
    [super dealloc];
}

//This is the entry point for the application

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //Create a window object (there is only one in iOS)
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
 
    // Override point for customization after application launch.
    
    //Create an instance of our view controller (the controller in the MVC paradigm)
    self.viewController = [[[SoCMViewController alloc] initWithNibName:@"SoCMViewController" bundle:nil] autorelease];
    
    //Set the view controller as the "root view controller" of the window - this also ensures the view (owned by the view controller) is correctly re-sized to fit
    self.window.rootViewController = self.viewController;
    
    //Make the window visible
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end

//
//  NibblyAppDelegate.h
//  Nibbly
//
//  Created by noutram on 05/02/2010.
//  Copyright University of Plymouth 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"

@interface NibblyAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MainViewController *mainVC;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet MainViewController *mainVC;
@end


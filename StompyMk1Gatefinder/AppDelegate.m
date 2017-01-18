//
//  AppDelegate.m
//  StompyMk1Gatefinder
//
//  Created by Chris Brooks on 1/16/17.
//  Copyright © 2017 Chris Brooks. All rights reserved.
//

#import "AppDelegate.h"
#import "Gatefinder.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    // for now just run the algorithm, it's fine
    Gatefinder *finder = [[Gatefinder alloc] init];
    [finder runSimulationToCompletion]; // glhf
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end

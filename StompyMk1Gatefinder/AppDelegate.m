//
//  AppDelegate.m
//  StompyMk1Gatefinder
//
//  Created by Chris Brooks on 1/16/17.
//  Copyright © 2017 Chris Brooks. All rights reserved.
//

#import "AppDelegate.h"
#import "DNAGenerator.h"
#import "Bot.h"
#import "Generation.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    // for now just run the algorithm, it's fine
    Generation *test = [Generation createInitialGeneration];
    NSLog(@"Whole generation: %@", [test description]);
    
    /*Bot *bot = [[Bot alloc] initWithServoValueArray:dna];
    [bot setName:@"Terrence"];
    
    NSLog(@"Robot: %@", [bot description]);*/
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end

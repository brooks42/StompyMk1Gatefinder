//
//  Simulation.h
//  StompyMk1Gatefinder
//
//  Created by Chris Brooks on 1/16/17.
//  Copyright © 2017 Chris Brooks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Generation.h"

// 500 iterations for the simulation at the moment
#define SIMULATION_LENGTH 500

// the actual Simulation class that
@interface Simulation : NSObject

@property Generation *generation;

// creates and preps the Simulation object to begin
- (instancetype) initWithGeneration: (Generation *) gen;

// steps the simulation various times (will be more useful when there's a UI to look at and manage)
- (void) stepSimulation;
- (void) startAutosteppingSimulation;
- (void) stopAutosteppingSimulation;

@end

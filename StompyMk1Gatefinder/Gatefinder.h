//
//  Gatefinder.h
//  StompyMk1Gatefinder
//
//  Created by Chris Brooks on 1/17/17.
//  Copyright © 2017 Chris Brooks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Simulation.h"
#import "Generation.h"

// we'll go through this many simulations to find the "best" robot gate for StompyMk1
#define SIMULATION_COUNT 50

@interface Gatefinder : NSObject

// a list of generations for Gatefinder, with the current generation at the front
@property NSMutableArray *generationsList;

// the current generation, for simplicity
@property Generation *currentGeneration;

//
- (instancetype) init;

// runs the entire algorithm until it's finished, printing out some milestones (like when simulations complete). When it's finished it'll print out the most successful robot to the console, and write the entire history to a set of files.
- (void) runSimulationToCompletion;

@end

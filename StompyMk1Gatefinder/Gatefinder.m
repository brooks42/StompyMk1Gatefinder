//
//  Gatefinder.m
//  StompyMk1Gatefinder
//
//  Created by Chris Brooks on 1/17/17.
//  Copyright © 2017 Chris Brooks. All rights reserved.
//

#import "Gatefinder.h"

@implementation Gatefinder {
    Simulation *simulation;
}

//
- (instancetype) init {
    self = [super init];
    
    if (self) {
        _generationsList = [NSMutableArray new];
    }
    
    return self;
}

//
- (void) createInitialGeneration {
    _currentGeneration = [Generation createInitialGeneration];
    [_currentGeneration setGenerationNumber:1];
    [_generationsList addObject:_currentGeneration];
}

// creates the next generation and adds it to our generations list
- (void) nextGeneration {
    _currentGeneration = [Generation createNewGenerationForParents:[_currentGeneration mostSuccessfulRobots]];
    [_currentGeneration setGenerationNumber:(int)[_generationsList count] + 1];
    [_generationsList addObject:_currentGeneration];
}

// runs the entire algorithm until it's finished, printing out some milestones (like when simulations complete). When it's finished it'll print out the most successful robot to the console, and write the entire history to a set of files.
- (void) runSimulationToCompletion {
    NSLog(@"runSimulationToCompletion");
    
    [self createInitialGeneration];
    
    // iterate through the entire algorithm here
    for (int i = 0; i < SIMULATION_COUNT; i++) {
        NSLog(@"starting simualtion #%d", i);
        simulation = [[Simulation alloc] initWithGeneration:_currentGeneration];
        [simulation runWholeSimulation]; // TODO: this will generate the best robots list in the current generation
        [self nextGeneration];
    }
    
    NSLog(@"simulation complete");
    NSLog(@"best robot is %@", [[[_currentGeneration mostSuccessfulRobots] objectAtIndex:0] description]);
}

@end

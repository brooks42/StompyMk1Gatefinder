//
//  Simulation.m
//  StompyMk1Gatefinder
//
//  Created by Chris Brooks on 1/16/17.
//  Copyright © 2017 Chris Brooks. All rights reserved.
//

#import "Simulation.h"

@implementation Simulation {
    volatile bool autoStep;
    int stepCount; // current count of the simulation's number of steps
}

//
- (instancetype) initWithGeneration: (Generation *) gen {
    self = [super init];
    
    if (self) {
        _generation = gen;
        autoStep = NO;
        stepCount = 0;
    }
    
    return self;
}

// steps the simulation 1 time
- (void) stepSimulation {
    stepCount++;
}

// starts autostepping the simulation
- (void) startAutosteppingSimulation {
    autoStep = YES;
}

// stops autostepping after the current step is finished
- (void) stopAutosteppingSimulation {
    autoStep = NO;
}

- (bool) simulationIsDone {
    return stepCount >= SIMULATION_LENGTH;
}

@end

//
//  Simulation.h
//  StompyMk1Gatefinder
//
//  Created by Chris Brooks on 1/16/17.
//  Copyright © 2017 Chris Brooks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Generation.h"

// the actual Simulation class that
@interface Simulation : NSObject

@property Generation *generation;

//
- (instancetype) initWithGeneration: (Generation *) gen;

//
- (void) stepSimulation;
- (void) startAutosteppingSimulation;
- (void) stopAutosteppingSimulation;

@end

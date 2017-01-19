//
//  Generation.h
//  StompyMk1Gatefinder
//
//  Created by Chris Brooks on 1/16/17.
//  Copyright © 2017 Chris Brooks. All rights reserved.
//

#import <Foundation/Foundation.h>

#define GEN_BOT_COUNT 500 // number of bots that we allow to exist in a generation
#define PROLIFERATE_COUNT 50 // the top 10% of our robots pass their genes on

#pragma mark - class definition

// a Generation is one layer of the genetic algorithm
// each generation has a number of robots and a target number of robots that will pass their genes on
@interface Generation : NSObject

@property unsigned long generationNumber;

// the bots for this generation
@property NSArray *bots;

// generates and returns the first, or "initial" generation we do
// just basically makes GEN_BOT_COUNT random robots and hopes for the best
+ (Generation *) createInitialGeneration;

// creates and returns a new Generation based on the passed parent robot list
+ (Generation *) createNewGenerationForParents: (NSArray *) parents;

// returns PROLIFERATE_COUNT most successful robots. These will be used as parents for the next generation
- (NSArray *) mostSuccessfulRobots;

// gets all of the robots in this generation as an NSData object so we can write it to a file
- (NSData *) robotsAsData;

@end

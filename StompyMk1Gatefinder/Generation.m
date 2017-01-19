//
//  Generation.m
//  StompyMk1Gatefinder
//
//  Created by Chris Brooks on 1/16/17.
//  Copyright © 2017 Chris Brooks. All rights reserved.
//

#import <GameKit/GameKit.h>
#import "Generation.h"
#import "Bot.h"
#import "DNAGenerator.h"

@implementation Generation

//
+ (Generation *) createInitialGeneration {
    Generation *gen = [Generation new];
    
    // basically create 500 random Bots
    NSMutableArray *botList = [NSMutableArray new];
    DNAGenerator *generator = [[DNAGenerator alloc] init];
    
    for (int i = 0; i < GEN_BOT_COUNT; i++) {
        [botList addObject: [[Bot alloc] initWithServoValueArray: [generator completelyRandomDNA]]];
    }
    
    [gen setBots:botList];
    
    return gen;
}

//
+ (Generation *) createNewGenerationForParents: (NSArray *) parents {
    
    NSLog(@"createNewGenerationForParents: %lu", [parents count]);
    
    // we take the parents and get the array of children for all of them, collating them into a giant array
    NSMutableArray *allChildren = [NSMutableArray new];
    DNAGenerator *generator = [[DNAGenerator alloc] init];
    
    // n^2 over all parents:
    for (Bot *parentOne in parents) {
        for (Bot *parentTwo in parents) {
            [allChildren addObjectsFromArray: [generator mingledDNAForBot:parentOne andBot:parentTwo]];
        }
    }
    
    // now generate bots from the gathered DNA and set them into the next generation
    Generation *nextGen = [Generation new];
    
    NSMutableArray *bots = [NSMutableArray new];
    for (DNA dna in allChildren) {
        [bots addObject:[[Bot alloc] initWithServoValueArray:dna]];
    }
    
    [nextGen setBots:bots];
    
    return nextGen;
}

//
- (NSArray *) mostSuccessfulRobots {
    
    // there's still no real measure of success just yet, but I'm going to test that the genetic algorithm idea even works by selecting for the value at [0][0]
    NSArray *botList = [_bots sortedArrayUsingComparator:^NSComparisonResult(Bot *  _Nonnull obj1, Bot * _Nonnull obj2) {
    
        if ([obj1 distanceTravelled] > [obj2 distanceTravelled]) {
            return NSOrderedAscending;
        }
        
        if ([obj2 distanceTravelled] < [obj2 distanceTravelled]) {
            return NSOrderedDescending;
        }
        
        return NSOrderedSame;
    }];
    
    // now we'll get the first PROLIFERATE_COUNT bots and return those
    NSArray *theBest = [botList subarrayWithRange:NSMakeRange(0, PROLIFERATE_COUNT)];
    
    return theBest;
}

// returns all of the robots at once. Probably a bad idea to do this a lot
- (NSString *) description {
    NSString *desc = @"Generation {";
    
    //
    for (Bot *bot in _bots) {
        desc = [NSString stringWithFormat:@"%@\n", [bot description]];
    }
    
    return desc;
}

@end

//
//  Generation.m
//  StompyMk1Gatefinder
//
//  Created by Chris Brooks on 1/16/17.
//  Copyright © 2017 Chris Brooks. All rights reserved.
//

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
    
    return gen;
}

//
+ (Generation *) createNewGenerationForParents: (NSArray *) parents {
    return [Generation createInitialGeneration]; // TODO: implement the DNA mixing
}

//
- (NSArray *) mostSuccessfulRobots {
    return nil; // there is no success yet
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

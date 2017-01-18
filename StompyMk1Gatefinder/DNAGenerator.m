//
//  DNAGenerator.m
//  StompyMk1Gatefinder
//
//  Created by Chris Brooks on 1/16/17.
//  Copyright © 2017 Chris Brooks. All rights reserved.
//

#import "DNAGenerator.h"
#import "Bot.h"

#ifndef SERVO_COUNT
#define SERVO_COUNT 8
#endif

#ifndef ROW_COUNT
#define ROW_COUNT 8
#endif

@implementation DNAGenerator

//
- (NSArray *) completelyRandomDNA {
    NSMutableArray *dna = [NSMutableArray new];
    
    NSMutableArray *servoValues;
    
    // feed numbers between the bot's MIN_SERVO and the bot's MAX_SERVO
    for (int i = 0; i < ROW_COUNT; i++) {
        servoValues = [NSMutableArray new];
        for (int x = 0; x < SERVO_COUNT; x++) {
            [servoValues addObject:[NSNumber numberWithInt:(arc4random() % (SERVO_MAX_VAL - SERVO_MIN_VAL)) + SERVO_MIN_VAL]];
        }
        [dna addObject:servoValues];
    }

    return [dna copy];
}

@end

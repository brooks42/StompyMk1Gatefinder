//
//  DNAGenerator.m
//  StompyMk1Gatefinder
//
//  Created by Chris Brooks on 1/16/17.
//  Copyright © 2017 Chris Brooks. All rights reserved.
//

#import "DNAGenerator.h"

@implementation DNAGenerator

//
- (DNA) completelyRandomDNA {
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

//
- (NSArray *) mingledDNAForBot:(Bot *)one andBot:(Bot *)two {
    
    NSMutableArray *childrenDNA = [NSMutableArray new];
    
    NSMutableArray *newDNA = [NSMutableArray new];
    
    // TODO: in the future we'll also be adding randomized tweaks to the parent values as we add them to the children, to make it more "genetic" where this is just gross cloning
    // we generate 4 DNA objects
    // the first is one's left legs and two's right
    newDNA = [NSMutableArray new];
    [newDNA addObject:[[one servoValues] objectAtIndex:LEFT_BACK_ELBOW]];
    [newDNA addObject:[[one servoValues] objectAtIndex:LEFT_BACK_SHOULDER]];
    [newDNA addObject:[[one servoValues] objectAtIndex:LEFT_FRONT_ELBOW]];
    [newDNA addObject:[[one servoValues] objectAtIndex:LEFT_FRONT_SHOULDER]];
    [newDNA addObject:[[two servoValues] objectAtIndex:RIGHT_BACK_ELBOW]];
    [newDNA addObject:[[two servoValues] objectAtIndex:RIGHT_BACK_SHOULDER]];
    [newDNA addObject:[[two servoValues] objectAtIndex:RIGHT_FRONT_ELBOW]];
    [newDNA addObject:[[two servoValues] objectAtIndex:RIGHT_FRONT_SHOULDER]];
    [childrenDNA addObject:newDNA];
    
    // the second is one's right legs and two's left
    newDNA = [NSMutableArray new];
    [newDNA addObject:[[two servoValues] objectAtIndex:LEFT_BACK_ELBOW]];
    [newDNA addObject:[[two servoValues] objectAtIndex:LEFT_BACK_SHOULDER]];
    [newDNA addObject:[[two servoValues] objectAtIndex:LEFT_FRONT_ELBOW]];
    [newDNA addObject:[[two servoValues] objectAtIndex:LEFT_FRONT_SHOULDER]];
    [newDNA addObject:[[one servoValues] objectAtIndex:RIGHT_BACK_ELBOW]];
    [newDNA addObject:[[one servoValues] objectAtIndex:RIGHT_BACK_SHOULDER]];
    [newDNA addObject:[[one servoValues] objectAtIndex:RIGHT_FRONT_ELBOW]];
    [newDNA addObject:[[one servoValues] objectAtIndex:RIGHT_FRONT_SHOULDER]];
    [childrenDNA addObject:newDNA];
    
    // the third is one's front legs and two's back
    newDNA = [NSMutableArray new];
    [newDNA addObject:[[two servoValues] objectAtIndex:LEFT_BACK_ELBOW]];
    [newDNA addObject:[[two servoValues] objectAtIndex:LEFT_BACK_SHOULDER]];
    [newDNA addObject:[[one servoValues] objectAtIndex:LEFT_FRONT_ELBOW]];
    [newDNA addObject:[[one servoValues] objectAtIndex:LEFT_FRONT_SHOULDER]];
    [newDNA addObject:[[two servoValues] objectAtIndex:RIGHT_BACK_ELBOW]];
    [newDNA addObject:[[two servoValues] objectAtIndex:RIGHT_BACK_SHOULDER]];
    [newDNA addObject:[[one servoValues] objectAtIndex:RIGHT_FRONT_ELBOW]];
    [newDNA addObject:[[one servoValues] objectAtIndex:RIGHT_FRONT_SHOULDER]];
    [childrenDNA addObject:newDNA];
    
    // the fourth is one's back legs and two's front
    newDNA = [NSMutableArray new];
    [newDNA addObject:[[one servoValues] objectAtIndex:LEFT_BACK_ELBOW]];
    [newDNA addObject:[[one servoValues] objectAtIndex:LEFT_BACK_SHOULDER]];
    [newDNA addObject:[[two servoValues] objectAtIndex:LEFT_FRONT_ELBOW]];
    [newDNA addObject:[[two servoValues] objectAtIndex:LEFT_FRONT_SHOULDER]];
    [newDNA addObject:[[one servoValues] objectAtIndex:RIGHT_BACK_ELBOW]];
    [newDNA addObject:[[one servoValues] objectAtIndex:RIGHT_BACK_SHOULDER]];
    [newDNA addObject:[[two servoValues] objectAtIndex:RIGHT_FRONT_ELBOW]];
    [newDNA addObject:[[two servoValues] objectAtIndex:RIGHT_FRONT_SHOULDER]];
    [childrenDNA addObject:newDNA];
    
    return childrenDNA;
}

@end

//
//  Bot.h
//  StompyMk1Gatefinder
//
//  Created by Chris Brooks on 1/16/17.
//  Copyright © 2017 Chris Brooks. All rights reserved.
//

#import <Foundation/Foundation.h>

#define SERVO_MAX_VAL 135
#define SERVO_MIN_VAL 45

// a simple software implementation of a StompyMk1 "bot"
// this bot is controlled by a single entity when we run the simulation
@interface Bot : NSObject

// the name of this robot, so you can be sad when they fail :)
@property NSString *name;

// a 2-D array of this Bot's servo values, 8 servos in total for X (8 so far) iterations
@property NSArray *servoValues;

// the distance travelled by the robot so far, used to determine which robots are the best
@property int distanceTravelled;

//
- (instancetype) initWithServoValueArray: (NSArray *) array;

@end

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

#define LEFT_BACK_ELBOW 0
#define LEFT_BACK_SHOULDER 1
#define LEFT_FRONT_ELBOW 2
#define LEFT_FRONT_SHOULDER 3
#define RIGHT_BACK_ELBOW 4
#define RIGHT_BACK_SHOULDER 5
#define RIGHT_FRONT_ELBOW 6
#define RIGHT_FRONT_SHOULDER 7

// a DNA object is an 8x8 array of arrays
// each array is a list of values for a given servo for each iteration
// so say [45, 90, 135, 90, 45, 90, 45, 135] would be a leg moving back and forth very slowly
// the servos are set up as follows:
// 0 - left back elbow
// 1 - left back shoulder
// 2 - left front elbow
// 3 - left front shoulder
// 4 - right back elbow
// 5 - right back shoulder
// 6 - right front elbow
// 7 - right front shoulder
typedef NSArray* DNA;

// a simple software implementation of a StompyMk1 "bot"
// this bot is controlled by a single entity when we run the simulation
@interface Bot : NSObject

// the name of this robot, so you can be sad when they fail :)
@property NSString *name;

// a 2-D array of this Bot's servo values, 8 servos in total for X (8 so far) iterations
@property DNA servoValues;

// the distance travelled by the robot so far, used to determine which robots are the best
@property int distanceTravelled;

//
- (instancetype) initWithServoValueArray: (DNA) array;

@end

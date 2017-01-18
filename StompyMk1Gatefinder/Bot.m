//
//  Bot.m
//  StompyMk1Gatefinder
//
//  Created by Chris Brooks on 1/16/17.
//  Copyright © 2017 Chris Brooks. All rights reserved.
//

#import "Bot.h"

@implementation Bot

//
- (instancetype) initWithServoValueArray: (DNA) array {
    self = [super init];
  
    //
    if (self) {
        _servoValues = array;
        _name = [[NSUUID UUID] UUIDString];
    }
    
    return self;
}

//
- (NSString *) description {
    NSString *toString = [NSString stringWithFormat:@"Robot { Name: %@", _name];
    
    for (NSArray *array in _servoValues) {
        toString = [NSString stringWithFormat:@"%@\n%@", toString,
                    [[NSString alloc] initWithData: [NSJSONSerialization dataWithJSONObject:array options:0 error:nil] encoding:NSUTF8StringEncoding]];
    }
    
    toString = [NSString stringWithFormat:@"%@ }", toString];
    
    return toString;
}

@end

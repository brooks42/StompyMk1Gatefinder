//
//  DNAGenerator.h
//  StompyMk1Gatefinder
//
//  Created by Chris Brooks on 1/16/17.
//  Copyright © 2017 Chris Brooks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Bot.h"

#define SERVO_COUNT 8
#define ROW_COUNT 8

@interface DNAGenerator : NSObject

// returns a completely randomized DNA array set for a single bot
- (DNA) completelyRandomDNA;

// returns 4 DNA objects, the results of mingling the passed parent's DNA
- (NSArray *) mingledDNAForBot: (Bot *) one andBot: (Bot *) two;

@end

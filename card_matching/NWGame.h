//
//  NWGame.h
//  card_matching
//
//  Created by Nicholas Wargnier on 10/17/13.
//  Copyright (c) 2013 Nicholas Wargnier. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NWDeck.h"

@interface NWGame : NSObject
@property (strong, nonatomic) NSMutableArray *currentCards;
@property (nonatomic) NSUInteger matches;
@property (nonatomic) NSUInteger flips;

-(void)startGame;
@end

//
//  NWGame.h
//  card_matching
//
//  Created by Nicholas Wargnier on 10/17/13.
//  Copyright (c) 2013 Nicholas Wargnier. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NWDeck.h"
#import "NWCard.h"

@interface NWGame : NSObject
@property (strong, nonatomic) NSMutableArray *currentCards;
@property (nonatomic) NSUInteger matches;
@property (nonatomic) NSUInteger flips;
@property (readonly, nonatomic) int score;




-(void)startGame;

//-(void)flipCardAtIndex:(NSUInteger)index;
//
//-(NWCard *)cardAtIndex:(NSUInteger)index;

@end

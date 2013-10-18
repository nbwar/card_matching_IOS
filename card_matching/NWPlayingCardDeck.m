//
//  NWPlayingCardDeck.m
//  card_matching
//
//  Created by Nicholas Wargnier on 10/17/13.
//  Copyright (c) 2013 Nicholas Wargnier. All rights reserved.
//

#import "NWPlayingCardDeck.h"
#import "NWPlayingCard.h"

@implementation NWPlayingCardDeck

-(id) init
{
    self = [super init];
    if (self) {
         for (NSString *suit in [NWPlayingCard validSuits]) {
             for (NSUInteger rank = 1; rank <= [NWPlayingCard maxRank]; rank++) {
                 NWPlayingCard *card = [[NWPlayingCard alloc] init];
                 card.rank = rank;
                 card.suit = suit;
                 [self addCard:card atTop:YES];
             }
        }
    }
    return self;
}
@end

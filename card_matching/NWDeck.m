//
//  NWDeck.m
//  card_matching
//
//  Created by Nicholas Wargnier on 10/17/13.
//  Copyright (c) 2013 Nicholas Wargnier. All rights reserved.
//

#import "NWDeck.h"

@interface NWDeck()
@property (strong, nonatomic) NSMutableArray *cards;
@end

@implementation NWDeck

// allocate and initialize cards if cards is nil

-(NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (void)addCard:(NWCard *)card atTop:(BOOL)atTop
{
    if (atTop) {
        [self.cards insertObject:card atIndex:0];
    } else
    {
        [self.cards addObject:card];
    }
}

- (NWCard *)drawRandomCard
{
    NWCard *randomCard = nil;
    
    if (self.cards.count) {
        unsigned index = arc4random() % self.cards.count;
        randomCard = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }

    return randomCard;
}
@end

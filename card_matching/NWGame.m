//
//  NWGame.m
//  card_matching
//
//  Created by Nicholas Wargnier on 10/17/13.
//  Copyright (c) 2013 Nicholas Wargnier. All rights reserved.
//

#import "NWGame.h"
#import "NWPlayingCardDeck.h"

@interface NWGame()
@property (strong, nonatomic) NWPlayingCardDeck *deck;
@end

@implementation NWGame

-(void)startGame
{
    NSLog(@"%@", self.deck);
    self.currentCards = [self chooseCards];
}

-(NWPlayingCardDeck *)deck
{
    if (!_deck) _deck = [[NWPlayingCardDeck alloc] init];
    return _deck;
}

-(NSMutableArray *)currentCards
{
    if(!_currentCards) _currentCards = [[NSMutableArray alloc] init];
    return _currentCards;
}

-(NSMutableArray *)chooseCards;
{
    NSMutableArray *randomIndexes = [[NSMutableArray alloc] init];
    NSMutableArray *cardsArray = [[NSMutableArray alloc] init];
    
    for (NSUInteger i = 0; i < 6; i++) {
        NSUInteger ran = arc4random() % 52;
        [randomIndexes addObject:[NSNumber numberWithInt:ran]];
    }
    
    for (NSUInteger x = 0; x < 6; x++) {
        [cardsArray addObject:[self.deck.cards objectAtIndex:x]];
    }
    
    return cardsArray;
}
@end

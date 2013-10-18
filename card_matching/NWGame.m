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
@property (readwrite, nonatomic) int score;
@end

@implementation NWGame

-(void)startGame
{
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
    NSMutableArray *cardsArray = [[NSMutableArray alloc] init];
    NSLog(@"Choosing Cards");
    
    for (NSUInteger x = 0; x < 6; x++) {
        [cardsArray addObject:[self.deck drawRandomCard]];
    }
    
    [cardsArray addObjectsFromArray:cardsArray];
    cardsArray = [self shuffleCards:cardsArray];
    
    return cardsArray;
}

-(NSMutableArray *)shuffleCards:(NSMutableArray *)cards
{
    NSUInteger firstIndex;
    NSUInteger secondIndex;
    for (NSUInteger i = 0; i < 12; i++) {
        firstIndex = arc4random() % 12;
        secondIndex = arc4random() % 12;
        [cards exchangeObjectAtIndex:firstIndex withObjectAtIndex:secondIndex];
    }
    return cards;
}
@end
